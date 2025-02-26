import 'package:flutter/material.dart';
import 'features/home/home_screen.dart';
import 'home.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Kameleon',
      home: const Home(),
      themeMode: ThemeMode.system,
      theme: lightTheme(),
      darkTheme: darkTheme(),
    );
  }
}
