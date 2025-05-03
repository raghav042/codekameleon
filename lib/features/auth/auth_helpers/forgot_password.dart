import 'package:flutter/material.dart';

import '../../../widgets/heading.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword>{
final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100,),
            Center(
              child: Text(
                "Recover Password",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const Heading(title: "Email"),
            TextFormField(
              controller: emailController,

            ),
            const SizedBox(height: 50,),
            Center(
              child: SizedBox(
                height: 50,
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: (){

                    },
                    child: const Text(
                      "Recover Password",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    )
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
