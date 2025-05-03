import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserAuthProvider extends ChangeNotifier {
  // This instance will allow us to sign in, Reset password
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;



  // We will know if the user is logged in or not all the changes that user will make
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  // Creating a signIn function
  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    return await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  // Fucntion for creating an account
  Future<UserCredential> createAccount(
      {required String email, required String password}) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  // Now a function to sign out
  /// Signs out the current user.
  ///
  /// Throws a [FirebaseException] if there is an error.
  ///
  /// Returns a [Future] that resolves when the user is signed out.
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  // Now a function to reset password
  Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

//   bool isLoading = false;

//   /// write function to create account
//   Future<void> signup({required String email, required String password}) async {
//     isLoading = true;
//     notifyListeners();

//     UserCredential userCredential =
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     final User? user = userCredential.user;

//     if(user != null){
//       //TODO: navigate to desired screen
//     }

//     // TODO: show snackBar

//     isLoading = false;
//     notifyListeners();
//   }
// }
}
