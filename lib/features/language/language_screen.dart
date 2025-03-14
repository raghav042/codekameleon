import 'package:flutter/material.dart';

import '../../model/language_model.dart';
import '../tutorial/tutorial_tab.dart';
import '../quiz/quiz_tab.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key, required this.language});
  final LanguageModel language;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar.large(
                title: Text(language.name),
                actions: [
                  Image.asset(language.smallIcon, height: 28),
                ],
                bottom: TabBar(
                  splashBorderRadius: BorderRadius.circular(25),
                  tabs: const [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.menu_book_outlined),
                        SizedBox(width: 8),
                        Text("Tutorials"),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sports_esports_outlined),
                        SizedBox(width: 8),
                        Text("Quiz"),
                      ],
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              TutorialTab(course: language),
              const QuizTab(),
            ],
          ),
        ),
      ),
    );
  }
}
