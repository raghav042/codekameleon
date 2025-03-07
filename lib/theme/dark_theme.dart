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
    textTheme: GoogleFonts.ubuntuTextTheme(ThemeData.dark().textTheme),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: scheme.onInverseSurface,
        foregroundColor: scheme.inverseSurface,
        side: const BorderSide(width: 0.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0,
      labelTextStyle: WidgetStatePropertyAll(GoogleFonts.ubuntu()),
      backgroundColor: scheme.tertiaryContainer,
      indicatorColor: scheme.primary,
    ),
    navigationRailTheme: NavigationRailThemeData(
      //elevation: 0,
      selectedLabelTextStyle: GoogleFonts.ubuntu(color: scheme.onSurface),
      unselectedLabelTextStyle: GoogleFonts.ubuntu(color: scheme.onSurface),
      backgroundColor: scheme.tertiaryContainer,
      indicatorColor: scheme.primary,
    ),
    listTileTheme: ListTileThemeData(
      // tileColor: scheme.surfaceContainerHighest,
      // selectedColor: scheme.onSecondaryContainer,
      // selectedTileColor: scheme.secondaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
