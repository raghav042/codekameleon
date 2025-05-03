import 'package:codekameleon/features/auth/signup_screen.dart';
import 'package:codekameleon/widgets/heading.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child:  Text(
                  'Welcome back',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const Heading(title: "Email"),
              TextFormField(),

              // TODO: create ui for password

              const Heading(title: 'Password'),

              TextFormField(),
              const SizedBox(height: 50),
              // TODO: Creare a button
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account ?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:codekameleon/features/auth/auth_helpers/auth_cubit.dart';
// import 'package:codekameleon/features/auth/auth_helpers/auth_state.dart';
// import 'package:codekameleon/features/auth/auth_helpers/auth_status.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class LoginScreen extends StatelessWidget {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<AuthCubit, AuthState>(
//         builder: (context, state) {
//           if (state.status == AuthStatus.loading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state.status == AuthStatus.authenticated) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('You are already logged in'),
//               ),
//             );
//           }
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(labelText: 'Email'),
//                 ),
//                 TextField(
//                   controller: _passwordController,
//                   decoration: const InputDecoration(labelText: 'Password'),
//                   obscureText: true,
//                 ),
//                 ElevatedButton(
//                   onPressed: () =>
//                       context.read<AuthCubit>().signInWithEmailAndPassword(
//                             _emailController.text,
//                             _passwordController.text,
//                           ),
//                   child: const Text('Sign In'),
//                 ),
//                 if (state.errorMessage != null)
//                   Text(
//                     state.errorMessage!,
//                     style: const TextStyle(color: Colors.red),
//                   ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
