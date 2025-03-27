import 'dart:developer';

import 'package:codekameleon/features/auth/auth_helpers/auth_exception.dart';
import 'package:codekameleon/features/auth/auth_helpers/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService(this._firebaseAuth);

  @override
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  @override
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      log("the firebase auth email is $email and password is $password");
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      log("the credential is $credential");
      return credential.user != null;
    } on FirebaseAuthException catch (e) {
      throw AuthException(_mapFirebaseErrorToMessage(e));
    }
  }

  @override
  Future<bool> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return credential.user != null;
    } on FirebaseAuthException catch (e) {
      throw AuthException(_mapFirebaseErrorToMessage(e));
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      throw AuthException(_mapFirebaseErrorToMessage(e));
    }
  }

  String _mapFirebaseErrorToMessage(FirebaseAuthException e) {
    log("the error in firebase auth is ${e.code}");
    switch (e.code) {
      case 'invalid-credential':
        return 'The credential is invalid.';
      case "channel-error":
        return "Kindly Fill all the fields";

      default:
        return 'An error occurred: ${e.message}';
    }
  }
}
