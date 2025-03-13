import 'package:codekameleon/features/home/leaderboard_tile.dart';
import 'package:codekameleon/helper/language_helper.dart';
import 'package:codekameleon/widgets/language_tile.dart';
import 'package:codekameleon/widgets/heading.dart';
import 'package:flutter/material.dart';

import '../../widgets/recent_language_tile.dart';
import 'quiz_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(8),
            child: CircleAvatar(),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings_outlined),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: SearchBar(
                    elevation: WidgetStatePropertyAll(0),
                  ),
                ),
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
