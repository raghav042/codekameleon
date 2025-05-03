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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              
              Row(
                children: [
                  Image.asset(("assets/icons/app_logo.png"), height: 70,),

                ],
              ),
              Text("Code Kameleon"),
              Text("Craft Your Code"),
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
                  Text("Already have an account ?"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
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
