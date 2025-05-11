import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codekameleon/features/home/home_screen.dart';

import 'package:codekameleon/model/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const AuthScreen()));
    }
  }

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const AuthScreen()),
        (route) => false,
      );
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

  Future<void> updateUser(
      {required User user, required Map<String, dynamic> updateValues}) async {
    // log("tge yodate ${score}");

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .update(updateValues)
        .then((value) => log("User Updated"))
        .catchError((error) => log("Failed to update user: $error"));
  }

  Future<String?> uploadProfilePicture(File imageFile) async {
    try {
      final fileName =
          'profile_pictures/${user.name}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final ref = FirebaseStorage.instance.ref().child(fileName);
      final uploadTask = ref.putFile(imageFile);

      await uploadTask;
      return await ref.getDownloadURL();
    } catch (e) {
      log('Upload failed: $e');
      return null;
    }
  }
}
