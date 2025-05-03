import 'package:flutter/material.dart';

import '../../widgets/heading.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Become a ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Code Kameleon",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Sign up to continue",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Heading(title: "Name"),
              TextFormField(
                controller: nameController,
              ),
              const Heading(title: "Email"),
              TextFormField(
                controller: emailController,
              ),
              const Heading(title: "Password"),
              TextFormField(
                controller: passwordController,
              ),
              const Heading(title: "Confirm Password"),
              TextFormField(
                controller: confirmPasswordController,
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 50,
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Create Account",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account ?"),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
