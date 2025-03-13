import 'package:codekameleon/helper/language_helper.dart';
import 'package:codekameleon/widgets/language_tile.dart';
import 'package:codekameleon/widgets/heading.dart';
import 'package:flutter/material.dart';

import '../../widgets/recent_language_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Heading(title: "Quizes"),
                SizedBox(
                  height: 170,
                  child: CarouselView(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    itemExtent: 300,
                    children: List.generate(
                      quizes.length,
                      (i) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border:
                              Border.all(width: 2, color: colorScheme.primary),
                          image: DecorationImage(
                            image: AssetImage(quizes[i]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: SearchAnchor.bar(
                          barElevation: const WidgetStatePropertyAll(0),
                          barHintText: "Search anything",
                          suggestionsBuilder: (_, c) {
                            return [];
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.settings_outlined),
                      ),
                    ],
                  ),
                ),
                if (LanguageHelper.recentLanguage != null)
                  const Heading(title: "Currently Learning"),
                if (LanguageHelper.recentLanguage != null)
                  RecentLanguageTile(language: LanguageHelper.recentLanguage!),
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

List<String> quizes = [
  "assets/images/c_quiz.png",
  "assets/images/cpp_quiz.png",
  "assets/images/java_quiz.png",
  "assets/images/dart_quiz.png",
  "assets/images/swift_quiz.png",
  "assets/images/kotlin_quiz.png",
  "assets/images/javascript_quiz.png",
];
