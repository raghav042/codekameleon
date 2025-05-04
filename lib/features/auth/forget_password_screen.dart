import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constant/app_strings.dart';
import '../../provider/authentication_provider.dart';
import '../../widgets/heading.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.lostYourCodingComouflage,
                style: GoogleFonts.quicksand(fontSize: 30),
              ),
              const SizedBox(height: 10),
              const Text(
                AppStrings.enterEmailToResetPassword,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              const Heading(title: AppStrings.email),
              TextFormField(),
              const SizedBox(height: 50),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: provider.isLoading
                      ? null // So that button can't be pushed
                      : () {},
                  child: provider.isLoading // It has already loading
                      ? const CircularProgressIndicator()
                      : const Text(
                          AppStrings.continueWord,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
