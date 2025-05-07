import 'package:cached_network_image/cached_network_image.dart';
import 'package:codekameleon/extension/context_extension.dart';
import 'package:codekameleon/helper/language_helper.dart';
import 'package:codekameleon/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constant/app_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final colorScheme = context.colorScheme;
    final user = context.read<UserProvider>().user;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Hero(
              tag: AppStrings.profilePicTag,
              child: CircleAvatar(
                radius: size.width / 4,
                backgroundImage: user.imageUrl != null
                    ? CachedNetworkImageProvider(user.imageUrl!)
                    : null,
              ),
            ),
            const SizedBox(height: 10, width: double.maxFinite),
            Text(
              user.name,
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                user.bio,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
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
                                AppStrings.progressPoints,
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
                        user.points.toString(),
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
                                AppStrings.currentlyLearning,
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
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainer,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                  bottom: Radius.circular(4),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.data_object),
                  const SizedBox(width: 12),
                  Text(
                    AppStrings.myProfileTxt,
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 2, color: colorScheme.surface),
            Container(
              width: size.width,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainer,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                  bottom: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.assignName,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                      //  SizedBox(width: 10),
                      Text(
                        user.name,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.assignEmail,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                      //  SizedBox(width: 10),
                      Text(
                        user.email,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.assignPoints,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                      //  SizedBox(width: 10),
                      Text(
                        user.points.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.assignOnline,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                      //  SizedBox(width: 10),
                      Text(
                        user.isOnline.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.assignStatus,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                      //  SizedBox(width: 10),
                      Text(
                        AppStrings.active,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.lastSeenAt,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                      //  SizedBox(width: 10),
                      Text(
                        user.lastSeenAt.split("T").first,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.registeredAt,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                      //  SizedBox(width: 10),
                      Text(
                        user.registeredAt.split("T").first,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: AppStrings.assignBio,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                      TextSpan(
                        text: user.bio,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
