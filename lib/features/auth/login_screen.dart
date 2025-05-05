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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        TextFormField(
          controller: _email,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email_outlined),
            labelText: AppStrings.email,
          ),
        ),
        const SizedBox(height: 15),
        TextFormField(
          controller: _password,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.lock_outline),
            labelText: AppStrings.password,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ForgetPasswordScreen()));
            },
            child: const Text(
              AppStrings.forgetPassword,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 10),
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
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ],
    );
  }
}
