import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  final scheme = ColorScheme.fromSeed(seedColor: Colors.blue);
  return ThemeData(
    colorScheme: scheme,
    textTheme: GoogleFonts.ubuntuTextTheme(),
    //scaffoldBackgroundColor: Colors.white,
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
      border: OutlineInputBorder(
        borderSide: const BorderSide(),
        borderRadius: BorderRadius.circular(25.0),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0,
      labelTextStyle: WidgetStatePropertyAll(GoogleFonts.ubuntu()),
      backgroundColor: scheme.tertiaryContainer,
      indicatorColor: scheme.primary,
    ),
    navigationRailTheme: NavigationRailThemeData(
      selectedLabelTextStyle: GoogleFonts.ubuntu(color: scheme.onSurface),
      unselectedLabelTextStyle: GoogleFonts.ubuntu(color: scheme.onSurface),
      backgroundColor: scheme.tertiaryContainer,
      indicatorColor: scheme.primary,
    ),
    listTileTheme: ListTileThemeData(
      tileColor: scheme.surfaceContainer,
      selectedColor: scheme.onSurface,
      selectedTileColor: scheme.secondaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    // chipTheme: ChipThemeData(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(25),
    //     side: BorderSide(color: scheme.surfaceContainerHighest),
    //   ),
    // ),
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
