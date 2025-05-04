import 'package:codekameleon/features/auth/signup_screen.dart';
import 'package:codekameleon/features/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()));
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
