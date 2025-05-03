
import 'package:codekameleon/features/auth/login_screen.dart';
import 'package:codekameleon/features/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Code Kameleon',
      home: LoginScreen(),//const HomeScreen(),
      themeMode: ThemeMode.system,
      theme: lightTheme(),
      darkTheme: darkTheme(),
    );
  }
}

final providers = [
  //ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
];
