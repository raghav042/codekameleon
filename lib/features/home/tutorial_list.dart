import 'package:animations/animations.dart';
import 'package:codekameleon/features/home/tutorial_screen.dart';
import 'package:codekameleon/model/tutorial_info.dart';
import 'package:codekameleon/model/tutorial_model.dart';
import 'package:flutter/material.dart';

class TutorialList extends StatelessWidget {
  const TutorialList({super.key, required this.info});
  final TutorialInfo info;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 280,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: info.tutorials.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (_, i) {
          return SizedBox(
            width: 220,
            child: OpenContainer(
              closedColor: colorScheme.tertiaryContainer,
              closedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              closedBuilder: (_, __) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      info.tutorials[i].title,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              openBuilder: (_, __) => TutorialScreen(
                tutorial: info.tutorials[i],
                syntax: info.syntax,
                iconPath: info.iconPath,
              ),
            ),
          );
        },
      ),
    );
  }
}
