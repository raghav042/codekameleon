import 'package:codekameleon/features/auth/login_screen.dart';
import 'package:codekameleon/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<void> signUpWithEmail({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();

    final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final User? user = userCredential.user;
    isLoading = false;
    notifyListeners();

    if (user != null) {
      if (context.mounted) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    }
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
    required BuildContext context
  }) async {
    isLoading = true;
    notifyListeners();
    final UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        
    final User? user = userCredential.user;

    if (user != null) {
      MaterialPageRoute(builder: (context) => const HomeScreen());
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> signInWithGoogle()async{

  }

  Future<void> sendResetPasswordEmail()async{}

  Future<void> signOut(BuildContext context)async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
  }

}
