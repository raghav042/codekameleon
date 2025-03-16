import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'features/home/home_screen.dart';
import 'provider/main_provider.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Code Kameleon',
        home: const HomeScreen(),
        themeMode: ThemeMode.system,
        theme: lightTheme(),
        darkTheme: darkTheme(),
      ),
    );
  }
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => MainProvider()),
];
