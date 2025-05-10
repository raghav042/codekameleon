import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codekameleon/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  const AuthHelper._();

  static Future<UserModel?> signUpWithEmail(BuildContext context,
      {required String name,
      required String email,
      required String password}) async {
    late UserCredential userCredential;
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception('Signup failed: ${e.message.toString()}');
    } catch (e) {
      throw Exception('Signup failed: ${e.toString()}');
    }
    

    // Here the user is not getting created & we are catching it and showing the error
    if (userCredential.user == null && context.mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Something went wrong")));
      return null;
    }

    // This is user model So, We are just creating a user model here
    final UserModel user = UserModel(
      name: name,
      email: email,
      imageUrl: null,
      bio: "bio",
      points: 0,
      isOnline: true,
      recentLanguage: null,
      registeredAt: DateTime.now().toIso8601String(),
      lastSeenAt: DateTime.now().toIso8601String(),
    );

    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user?.uid)
          .set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw Exception('Signup failed: ${e.message.toString()}');
    } catch (e) {
      throw Exception('Signup failed: ${e.toString()}');
    }

    return user;
  }

  static Future<UserModel?> signInWithEmail(BuildContext context,
      {required String email, required String password}) async {
    late UserCredential userCredential;
    late dynamic snapshot;

    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception('Signup failed: ${e.message.toString()}');
    } catch (e) {
      throw Exception('Signup failed: ${e.toString()}');
    }

    if (userCredential.user == null && context.mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Something went wrong")));
      return null;
    }

    try {
      snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user!.uid)
          .get();
    } on FirebaseAuthException catch (e) {
      throw Exception('Signup failed: ${e.message.toString()}');
    } catch (e) {
      throw Exception('Signup failed: ${e.toString()}');
    }
    return snapshot.exists ? UserModel.fromJson(snapshot.data()!) : null;
  }

  static Future<UserModel?> signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, get the UserCredential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user == null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Something went wrong")));
        return null;
      }

      if (userCredential.additionalUserInfo?.isNewUser == true) {
        final UserModel user = UserModel(
          name: userCredential.user?.displayName ?? "",
          email: userCredential.user?.email ?? "",
          imageUrl: userCredential.user?.photoURL,
          bio: "bio",
          points: 0,
          isOnline: true,
          recentLanguage: null,
          registeredAt: DateTime.now().toIso8601String(),
          lastSeenAt: DateTime.now().toIso8601String(),
        );

        await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user?.uid)
            .set(user.toJson());
        return user;
      } else {
        final snapshot = await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .get();
        snapshot.exists ? UserModel.fromJson(snapshot.data()!) : null;
      }
    } catch (e) {
      throw Exception('Signup failed: ${e.toString()}');
    }
    return null;
  }
}
