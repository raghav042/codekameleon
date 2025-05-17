import 'package:flutter/material.dart';
import '../../model/language_model.dart';
import 'tutorial_screen.dart';

class TutorialList extends StatelessWidget {
  const TutorialList({super.key, required this.language});
  final LanguageModel language;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      primary: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: language.tutorials.length,
      itemBuilder: (_, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TutorialScreen(
                  tutorial: language.tutorials[index],
                  syntax: language.syntax,
                  iconPath: language.smallIcon,
                  color: language.color,
                ),
              ),
            );
          },
          contentPadding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
          title: Text(
            language.tutorials[index].title,
            maxLines: 1,
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: Text(language.tutorials[index].description, maxLines: 1),
          trailing: trailing(language.tutorials[index].duration),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 8),
    );
  }

  Widget trailing(String duration) {
    return SizedBox(
      width: 55,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          const Positioned(
            left: 0,
            child: SizedBox(
              height: 50,
              child: VerticalDivider(),
            ),
          ),
          Positioned(
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.timelapse_outlined,
                    size: 18,
                  ),
                  Text(
                    duration,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
