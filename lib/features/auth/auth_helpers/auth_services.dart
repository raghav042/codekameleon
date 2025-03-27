import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<bool> signInWithEmailAndPassword(String email, String password);
  Future<bool> registerWithEmailAndPassword(String email, String password);
  Future<bool> signOut();
  Stream<User?> get authStateChanges;
}
