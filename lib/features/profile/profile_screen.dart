import 'package:codekameleon/constant/app_colors.dart';
import 'package:codekameleon/extension/context_extension.dart';
import 'package:codekameleon/helper/language_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final colorScheme = context.colorScheme;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Hero(
              tag: "my_profile_pic",
              child: CircleAvatar(
                radius: size.width / 4,
              ),
            ),
            const SizedBox(height: 10, width: double.maxFinite),
            const Text(
              "Victor Timely",
              style: TextStyle(fontSize: 35),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                "something about user useful information or anything else",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width / 2 - 30,
                  height: size.width / 2 - 30,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                "My Rewards Points",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "225",
                        style: GoogleFonts.quicksand(
                          fontSize: 50,
                          color: colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width / 2 - 30,
                  height: size.width / 2 - 30,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.menu_book_outlined,
                              color: colorScheme.tertiary,
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text(
                                "Currently Learning",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (LanguageHelper.recentLanguage != null)
                        Image.asset(
                          LanguageHelper.recentLanguage!.largeIcon,
                          height: size.width / 4 - 10,
                        )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColor.darkScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                  bottom: Radius.circular(4),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.data_object,
                    color: AppColor.darkScheme.onSurface,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "my_profile.json",
                    style: GoogleFonts.quicksand(
                      color: AppColor.darkScheme.onSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 1),
            Container(
              width: size.width,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColor.darkScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(4),
                  bottom: Radius.circular(16),
                ),
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SyntaxView(
                    code: code,
                    syntax: Syntax.CPP,
                    fontSize: 16,
                    withZoom: false,
                    withLinesCount: false,
                    expanded: false,
                    selectable: false,
                    syntaxTheme: SyntaxTheme.vscodeDark().copyWith(
                      baseStyle: GoogleFonts.firaCode(),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static const String code = '''
{
  'name': name,
  'email': email,
  'imageUrl': unavailable,
  'bio': bio,
  'points': points,
  'isOnline': isOnline,
  'recentLanguage': recentLanguage,
  'registeredAt': registeredAt,
  'lastSeenAt': lastSeenAt,
}
''';
}
