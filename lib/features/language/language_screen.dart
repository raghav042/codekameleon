import 'package:flutter/material.dart';

import '../../model/language_model.dart';
import '../tutorial/tutorial_tab.dart';
import '../quiz/quiz_tab.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key, required this.language});
  final LanguageModel language;

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.language.name),
          actions: [
            Image.asset(widget.language.smallIcon, height: 28),
          ],
          bottom: TabBar(
            splashBorderRadius: BorderRadius.circular(25),
            tabs: const [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.menu_book_outlined),
                  SizedBox(width: 4),
                  Text("Tutorials"),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sports_esports_outlined),
                  SizedBox(width: 4),
                  Text("Quiz"),
                ],
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              TutorialTab(course: widget.language),
              const QuizTab(),
            ],
          ),
        ),
      ),
    );
  }
}
