// import 'package:codekameleon/features/auth/auth_helpers/auth_cubit.dart';
// import 'package:codekameleon/features/auth/auth_helpers/auth_state.dart';
// import 'package:codekameleon/features/auth/auth_helpers/auth_status.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});
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
