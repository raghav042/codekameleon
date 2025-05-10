import 'package:codekameleon/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  final scheme = AppColor.lightScheme;
  return ThemeData(
    colorScheme: scheme,
    textTheme: GoogleFonts.openSansTextTheme(),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
      backgroundColor: scheme.surface,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
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
      filled: true,
      fillColor: scheme.surfaceContainer,
      border: OutlineInputBorder(
        borderSide: const BorderSide(),
        borderRadius: BorderRadius.circular(50.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(50.0),
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
