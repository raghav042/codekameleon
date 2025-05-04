import 'package:codekameleon/data/dart/tutorials/try_catch.dart';
import 'package:codekameleon/features/auth/login_screen.dart';
import 'package:codekameleon/features/home/home_screen.dart';
import 'package:codekameleon/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<void> signUpWithEmail({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();

      final UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );


    if (userCredential.user == null) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something went wrong")));
      }
      isLoading = false;
      notifyListeners();
      return;
    }

    UserModel user = UserModel(name: name, email: email, imageUrl: "", bio: "", points: 0, isOnline: true, recentLanguage: "", registeredAt: DateTime.now().toIso8601String(), lastSeenAt: DateTime.now().toIso8601String());


    await FirebaseFirestore.instance
        .collection("users")
        .doc(userCredential.user?.uid)
        .set(user.toJson());

    isLoading = false;
    notifyListeners();

    if (context.mounted) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  Future<void> signInWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    isLoading = true;
    notifyListeners();
    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    final User? user = userCredential.user;

    if (user != null) {
      MaterialPageRoute(builder: (context) => const HomeScreen());
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, get the UserCredential
    final userCredentials =
        await FirebaseAuth.instance.signInWithCredential(credential);

    if (userCredentials.user != null) {
      MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }

  Future<void> sendResetPasswordEmail() async {}

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SignInScreen()));
  }


}
