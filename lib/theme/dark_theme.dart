import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.dark,
  );
  return ThemeData(
    colorScheme: scheme,
    textTheme: GoogleFonts.openSansTextTheme(ThemeData.dark().textTheme),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
      backgroundColor: scheme.surface,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: scheme.onInverseSurface,
        foregroundColor: scheme.inverseSurface,
        side: const BorderSide(width: 0.2),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(),
        borderRadius: BorderRadius.circular(25.0),
      ),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: scheme.surfaceContainer,
      selectedColor: scheme.onSurface,
      selectedTileColor: scheme.secondaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    tabBarTheme: TabBarTheme(
      dividerColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: scheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(25),
      ),
      labelPadding: const EdgeInsets.symmetric(vertical: 10),
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: scheme.onTertiaryContainer,
      ),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
    ),
  );
}
