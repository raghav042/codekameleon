import 'package:codekameleon/features/auth/signup_screen.dart';
import 'package:codekameleon/provider/authentication_provider.dart';
import 'package:codekameleon/widgets/heading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constant/app_strings.dart';
import 'forget_password_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
                AppStrings.welcomeMessage,
                style: GoogleFonts.quicksand(fontSize: 30),
              ),
              const SizedBox(height: 10),
              const Text(
                AppStrings.howToAccessLearningSpace,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              const Heading(title: AppStrings.email),
              TextFormField(
                controller: _email,
              ),
              const Heading(title: AppStrings.password),
              TextFormField(
                controller: _password,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ForgetPasswordScreen()));
                  },
                  child: const Text(
                    AppStrings.forgetPassword,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: provider.isLoading
                      ? null // So that button can't be pushed
                      : () {
                          provider.signInWithEmail(
                              context: context,
                              email: _email.text,
                              password: _password.text);
                        },
                  child: provider.isLoading // It has already loading
                      ? const CircularProgressIndicator()
                      : const Text(
                          AppStrings.login,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(AppStrings.doNotHaveAccount),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: const Text(
                      AppStrings.register,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
