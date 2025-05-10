import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/user_model.dart';
import '../../provider/user_provider.dart';
import 'auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> authService() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();
      UserProvider()
          .initUserAndNavigate(context, UserModel.fromJson(snapshot.data()!));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const AuthScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authService();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          Image.asset(
            "assets/icons/app_logo.png",
            height: 180,
          ),
          const SizedBox(
            height: 10,
            width: double.maxFinite,
          ),
          Text(
            "Code Kameleon",
            style: GoogleFonts.lora(fontSize: 30),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: LinearProgressIndicator(),
          ),
          const Spacer(flex: 2),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              "Made with ❤️ by Techlyverse",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
