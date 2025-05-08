import 'package:codekameleon/features/home/home_screen.dart';
import 'package:codekameleon/helper/auth_helper.dart';
import 'package:codekameleon/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constant/app_strings.dart';
import '../features/auth/auth_screen.dart';

class UserProvider extends ChangeNotifier {
  UserProvider._internal();
  static final UserProvider _instance = UserProvider._internal();
  factory UserProvider() => _instance;

  late UserModel user;

  void initUserAndNavigate(BuildContext context, UserModel? userModel) {
    if (userModel != null) {
      user = userModel;

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      //TODO: show snackBar that user does not exist
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const AuthScreen()));
    }
  }

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AuthScreen()));
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    signOut(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(AppStrings.deleteAccountMessage),
      ),
    );
  }
}
