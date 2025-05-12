import 'package:codekameleon/features/auth/email_sent_screen.dart';
import 'package:codekameleon/widgets/reusable_elevated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/app_strings.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final TextEditingController forgetEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.lostYourCodingComouflage,
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  AppStrings.enterEmailToResetPassword,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              TextFormField(
                controller: forgetEmail,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: AppStrings.email,
                ),
              ),
              const SizedBox(height: 50),
              ReusableElevatedButton(
                title: AppStrings.continueWord,
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.sendPasswordResetEmail(
                      email: forgetEmail.text.trim(),
                    );

                    // Navigate to success screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EmailSentScreen(),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${e.toString()}')),
                    );
                  }
                },
              ),
              // SizedBox(
              //   height: 50,
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     onPressed: () async {
              //       try {
              //         await FirebaseAuth.instance.sendPasswordResetEmail(
              //           email: forgetEmail.text.trim(),
              //         );

              //         // Navigate to success screen
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const EmailSentScreen(),
              //           ),
              //         );
              //       } catch (e) {
              //         ScaffoldMessenger.of(context).showSnackBar(
              //           SnackBar(content: Text('Error: ${e.toString()}')),
              //         );
              //       }
              //     },
              //     child: const Text(
              //       AppStrings.continueWord,
              //       style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
