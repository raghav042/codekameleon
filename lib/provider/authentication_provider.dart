import 'package:codekameleon/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<void> createAccount({
    required BuildContext context,
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

    final User? user = userCredential.user;
    isLoading = false;
    notifyListeners();

    if (user != null) {
      if (context.mounted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    }
  }

  Future<void> logIn({
    required String email,
    required String password,
    required BuildContext context
  }) async {
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

  // function for google sign in
  Future<void> googleSignIn({required BuildContext context}) async {
    final GoogleSignInAccount? googleSignIn = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleSignIn?.authentication;

    final signinUserCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    )

    final userCredential = await FirebaseAuth.instance.signInWithCredential(signinUserCredential);
    if(userCredential.user != null){
      if(context.mounted) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    }

  }

}
