import 'package:codekameleon/features/auth/login_screen.dart';
import 'package:codekameleon/features/auth/signup_screen.dart';
import 'package:codekameleon/provider/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/app_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final provider = context.watch<AuthenticationProvider>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              buildTitle(provider, colorScheme),
              const SizedBox(height: 40),
              buildHeaderButtons(provider, colorScheme),
              const SizedBox(height: 40),
              provider.showRegisterScreen
                  ? const SignUpScreen()
                  : const SignInScreen(),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Or continue with"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              buildGoogleButton(provider, colorScheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle(AuthenticationProvider provider, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          provider.showRegisterScreen
              ? AppStrings.unleashMessage
              : AppStrings.welcomeMessage,
          textAlign: TextAlign.center,
          style: GoogleFonts.quicksand(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          provider.showRegisterScreen
              ? AppStrings.createAccountMessage
              : AppStrings.howToAccessLearningSpace,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget buildHeaderButtons(
      AuthenticationProvider provider, ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: provider.showRegisterScreen
                  ? colorScheme.tertiaryContainer
                  : colorScheme.surfaceContainerHighest,
              foregroundColor: provider.showRegisterScreen
                  ? colorScheme.onTertiaryContainer
                  : colorScheme.onSurface,
            ),
            onPressed: () {
              provider.toggleRegisterScreen(true);
            },
            child: const Text(
              "Register",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          height: 50,
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: !provider.showRegisterScreen
                  ? colorScheme.tertiaryContainer
                  : colorScheme.surfaceContainerHighest,
              foregroundColor: !provider.showRegisterScreen
                  ? colorScheme.onTertiaryContainer
                  : colorScheme.onSurface,
            ),
            onPressed: () {
              provider.toggleRegisterScreen(false);
            },
            child: const Text(
              "Login",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildGoogleButton(
      AuthenticationProvider provider, ColorScheme colorScheme) {
    return SizedBox(
      height: 50,
      width: double.maxFinite,
      child: OutlinedButton(
        onPressed: provider.isLoading ? null : () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: colorScheme.surfaceContainerLowest,
          foregroundColor: colorScheme.onSurface,
        ),
        child: provider.isLoading
            ? const CircularProgressIndicator()
            : const Text(
                "Continue with Google",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
