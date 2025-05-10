import 'package:codekameleon/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/app_strings.dart';
import '../../helper/auth_helper.dart';
import '../../helper/validator_helper.dart';
import 'forget_password_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final signUpFormKey = GlobalKey<FormState>();
  final signInFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool isLoading = false;
  bool showRegisterScreen = true;

  //TODO: write functions to validate data before login or register
  //TODO: write functions to dispose controllers after use

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    //final provider = context.watch<UserProvider>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              children: [
                buildTitle(colorScheme),
                const SizedBox(height: 40),
                buildHeaderButtons(colorScheme),
                const SizedBox(height: 40),
                showRegisterScreen ? signUpForm() : signInForm(),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text("Or"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                buildGoogleButton(colorScheme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitle(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          showRegisterScreen
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
          showRegisterScreen
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

  Widget buildHeaderButtons(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: showRegisterScreen
                  ? colorScheme.tertiaryContainer
                  : colorScheme.surfaceContainerHighest,
              foregroundColor: showRegisterScreen
                  ? colorScheme.onTertiaryContainer
                  : colorScheme.onSurface,
            ),
            onPressed: () {
              toggleRegisterScreen(true);
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
              backgroundColor: !showRegisterScreen
                  ? colorScheme.tertiaryContainer
                  : colorScheme.surfaceContainerHighest,
              foregroundColor: !showRegisterScreen
                  ? colorScheme.onTertiaryContainer
                  : colorScheme.onSurface,
            ),
            onPressed: () {
              toggleRegisterScreen(false);
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

  Widget buildGoogleButton(ColorScheme colorScheme) {
    return SizedBox(
      height: 50,
      width: double.maxFinite,
      child: OutlinedButton(
        onPressed: isLoading ? null : signInWithGoogle,
        style: OutlinedButton.styleFrom(
          backgroundColor: colorScheme.surfaceContainerLowest,
          foregroundColor: colorScheme.onSurface,
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/google.png", height: 35),
                  const SizedBox(width: 12),
                  const Text(
                    "Continue with Google",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
      ),
    );
  }

  Widget signInForm() {
    return Form(
      key: signInFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: AppStrings.email,
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: passwordController,
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
          if (!isLoading)
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : signInWithEmail,
                child: isLoading // It has already loading
                    ? const CircularProgressIndicator()
                    : const Text(
                        AppStrings.login,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
              ),
            ),
        ],
      ),
    );
  }

  Widget signUpForm() {
    return Form(
      key: signUpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: nameController,
            validator: ValidatorHelper.validateName,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                labelText: AppStrings.name),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: AppStrings.email,
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: passwordController,
            obscureText: obscurePassword,
            decoration: InputDecoration(
              labelText: AppStrings.password,
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
                icon: Icon(obscurePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: confirmPasswordController,
            obscureText: obscureConfirmPassword,
            decoration: InputDecoration(
              labelText: AppStrings.confirmPassword,
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureConfirmPassword = !obscureConfirmPassword;
                  });
                },
                icon: Icon(obscureConfirmPassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
              ),
            ),
          ),
          const SizedBox(height: 50),
          if (!isLoading)
            SizedBox(
              height: 50,
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: isLoading ? null : signUpWithEmail,
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        AppStrings.createAccount,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
              ),
            ),
        ],
      ),
    );
  }

  void toggleRegisterScreen(bool isRegister) {
    setState(() {
      showRegisterScreen = isRegister;
    });
  }

  Future<void> signUpWithEmail() async {
    setState(() {
      isLoading = true;
    });

    final userModel = await AuthHelper.signUpWithEmail(
      context,
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    setState(() {
      isLoading = false;
    });

    if (mounted) UserProvider().initUserAndNavigate(context, userModel);
  }

  Future<void> signInWithEmail() async {
    setState(() {
      isLoading = true;
    });

    final userModel = await AuthHelper.signInWithEmail(
      context,
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    setState(() {
      isLoading = false;
    });

    if (mounted) UserProvider().initUserAndNavigate(context, userModel);
  }

  Future<void> signInWithGoogle() async {
    setState(() {
      isLoading = true;
    });

    final userModel = await AuthHelper.signInWithGoogle(context);

    setState(() {
      isLoading = false;
    });

    if (mounted) UserProvider().initUserAndNavigate(context, userModel);
  }
}
