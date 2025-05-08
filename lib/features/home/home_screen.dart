import 'package:cached_network_image/cached_network_image.dart';
import 'package:codekameleon/features/home/leaderboard_tile.dart';
import 'package:codekameleon/features/home/search_field.dart';
import 'package:codekameleon/features/profile/profile_screen.dart';
import 'package:codekameleon/helper/ad_helper.dart';
import 'package:codekameleon/helper/language_helper.dart';
import 'package:codekameleon/provider/user_provider.dart';
import 'package:codekameleon/widgets/language_tile.dart';
import 'package:codekameleon/widgets/heading.dart';
import 'package:flutter/material.dart';

import '../../constant/app_strings.dart';
import '../../widgets/recent_language_tile.dart';
import '../notification/notification_screen.dart';
import '../setting/setting_screen.dart';
import 'package:provider/provider.dart';
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
    final user = context.read<UserProvider>().user;
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
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Hero(
                tag: AppStrings.profilePicTag,
                child: CircleAvatar(
                  backgroundImage: user.imageUrl != null
                      ? CachedNetworkImageProvider(user.imageUrl!)
                      : null,
                ),
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
                  const Heading(title: AppStrings.currentlyLearning),
                if (LanguageHelper.recentLanguage != null)
                  RecentLanguageTile(language: LanguageHelper.recentLanguage!),
                const LeaderboardTile(),
                const Heading(title: AppStrings.popularTutorials),
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
