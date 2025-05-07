import 'package:codekameleon/features/home/home_screen.dart';
import 'package:codekameleon/helper/auth_helper.dart';
import 'package:codekameleon/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constant/app_strings.dart';

class UserProvider extends ChangeNotifier {
  late UserModel user;
  bool showRegisterScreen = true;
  bool isLoading = false;

  void toggleRegisterScreen(bool isRegister) {
    showRegisterScreen = isRegister;
    notifyListeners();
  }

  void initUserAndNavigate(BuildContext context, UserModel? userModel) {
    if (userModel != null) {
      user = userModel;

      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      //TODO: show snackBar that user does not exist
      Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));

    }
  }

  Future<void> signUpWithEmail({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();

    final userModel = await AuthHelper.signUpWithEmail(context,
        name: name, email: email, password: password);

    isLoading = false;
    notifyListeners();

    if (context.mounted) initUserAndNavigate(context, userModel);
  }

  Future<void> signInWithEmail(
      {required BuildContext context,
      required String email,
      required String password}) async {
    isLoading = true;
    notifyListeners();

    final userModel = await AuthHelper.signInWithEmail(context,
        email: email, password: password);

    isLoading = false;
    notifyListeners();

    if (context.mounted) initUserAndNavigate(context, userModel);
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    final userModel = await AuthHelper.signInWithGoogle(context);

    isLoading = false;
    notifyListeners();

    if (context.mounted) initUserAndNavigate(context, userModel);
  }

  Future<void> sendResetPasswordEmail() async {}

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      Navigator.push(context,

          MaterialPageRoute(builder: (context) => const WelcomeScreen()));

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
