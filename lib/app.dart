import 'package:codekameleon/provider/quiz_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/splash_screen.dart';
import 'main.dart';
import 'provider/user_provider.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Code Kameleon',
        home: const SplashScreen(),
        themeMode: ThemeMode.system,
        theme: lightTheme(),
        darkTheme: darkTheme(),
      ),
    );
  }
}

final providers = [
  // ChangeNotifierProvider<QuizProvider>(create: (context) => QuizProvider()),
  ChangeNotifierProvider(create: (context) => UserProvider()),
];
