import 'package:codekameleon/extension/context_extension.dart';
import 'package:codekameleon/features/home/leaderboard_tile.dart';
import 'package:codekameleon/features/home/search_field.dart';
import 'package:codekameleon/features/profile/profile_screen.dart';
import 'package:codekameleon/helper/ad_helper.dart';
import 'package:codekameleon/helper/language_helper.dart';
import 'package:codekameleon/widgets/language_tile.dart';
import 'package:codekameleon/widgets/heading.dart';
import 'package:flutter/material.dart';

import '../../widgets/recent_language_tile.dart';
import '../notification/notification_screen.dart';
import '../setting/setting_screen.dart';
import 'quiz_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    AdHelper.initGoogleMobileAds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()));
            },
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Hero(
                tag: "my_profile_pic",
                child: CircleAvatar(),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationScreen()));
              },
              icon: const Icon(Icons.notifications_outlined),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingScreen()));
              },
              icon: const Icon(Icons.settings_outlined),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchField(),
                const QuizList(),
                const SizedBox(height: 20),
                if (LanguageHelper.recentLanguage != null)
                  const Heading(title: "Currently Learning"),
                if (LanguageHelper.recentLanguage != null)
                  RecentLanguageTile(language: LanguageHelper.recentLanguage!),
                const LeaderboardTile(),
                const Heading(title: "Popular Tutorials"),
                Center(
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: List.generate(
                      LanguageHelper.language.length,
                      (i) => LanguageTile(language: LanguageHelper.language[i]),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
