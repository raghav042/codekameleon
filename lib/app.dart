
import 'package:codekameleon/features/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'features/home/home_screen.dart';
import 'main.dart';
import 'provider/auth_provider.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';

import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Code Kameleon',
        home: SignupScreen(),//const HomeScreen(),
        themeMode: ThemeMode.system,
        theme: lightTheme(),
        darkTheme: darkTheme(),
      ),
    );
  }
}

final providers = [
  ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
];
