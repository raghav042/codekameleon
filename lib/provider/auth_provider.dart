import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationProvider extends ChangeNotifier {
  Future<void> createAccount(
      {required String email, required String password}) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    // credential.user?
  }

  Future<void> loginAccount(
      {required String email, required String password}) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    // credential.user?
  }

  Future<void> resetPassword(
      {required String email, required String password}) async {
    final credential =
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
