import 'package:codekameleon/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initPreferences();
  runApp(const App());
}
