// import 'package:codekameleon/features/auth/auth_helpers/auth_cubit.dart';
// import 'package:codekameleon/features/auth/auth_helpers/auth_repo.dart';
// import 'package:codekameleon/features/auth/auth_helpers/firebase_auth.dart';
// import 'package:codekameleon/features/auth/login_screen.dart';
import 'package:codekameleon/features/home/home_screen.dart';
import 'package:codekameleon/features/quiz/quiz_cubit.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';

// import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return
      // MultiProvider(
      // providers: [
      //   RepositoryProvider(
      //     create: (context) =>
      //         AuthRepository(FirebaseAuthService(FirebaseAuth.instance)),
      //   ),
      //   BlocProvider(
      //     create: (context) => AuthCubit(context.read<AuthRepository>()),
      //   ),
      //   BlocProvider(
      //     create: (context) => QuizCubit(),
      //   ),
      // ],
      // child:
      MaterialApp(
        title: 'Code Kameleon',
        home: HomeScreen(),
        themeMode: ThemeMode.system,
        theme: lightTheme(),
        darkTheme: darkTheme(),
      // ),
    );
  }
}

// List<BlocProvider> providers = [
//   BlocProvider(
//     create: (context) =>
//         AuthCubit(AuthRepository(FirebaseAuthService(FirebaseAuth.instance))),
//   ),
// ];
