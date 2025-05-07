import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codekameleon/features/auth/signup_screen.dart';
import 'package:codekameleon/model/user_model.dart';
import 'package:codekameleon/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> authService() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final snapshot = await FirebaseFirestore.instance.collection("users").doc(user.uid).get();
      context.read<UserProvider>().initUserAndNavigate(context, UserModel.fromJson(snapshot.data()!));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
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
