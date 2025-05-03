import 'package:codekameleon/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
}
