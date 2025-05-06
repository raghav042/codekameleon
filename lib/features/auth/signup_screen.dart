import 'package:codekameleon/helper/validator_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/app_strings.dart';
import '../../provider/user_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    return Column(
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
              labelText: AppStrings.email,),
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
                icon: obscurePassword
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined)),
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
                  icon: obscureConfirmPassword
                      ? const Icon(Icons.visibility_outlined)
                      : const Icon(Icons.visibility_off_outlined))),
        ),
        const SizedBox(height: 50),
        if(!provider.isLoading)
        SizedBox(
          height: 50,
          width: double.maxFinite,
          child: ElevatedButton(
            onPressed: provider.isLoading
                ? null
                : () {
                    provider.signUpWithEmail(
                      context: context,
                      name: nameController.text.trim(),
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                  },
            child: provider.isLoading
                ? const CircularProgressIndicator()
                : const Text(
                    AppStrings.createAccount,
                    style: TextStyle( fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ],
    );
  }
}
