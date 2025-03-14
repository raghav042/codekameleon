import 'package:flutter/material.dart';
import '../../model/language_model.dart';
import 'tutorial_screen.dart';

class TutorialTab extends StatelessWidget {
  const TutorialTab({super.key, required this.course});
  final LanguageModel course;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      primary: true,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      itemCount: course.tutorials.length,
      itemBuilder: (_, index) {
        return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TutorialScreen(
                      tutorial: course.tutorials[index],
                      syntax: course.syntax,
                      iconPath: course.smallIcon,
                      color: course.color,
                    ),
                  ));
            },
            contentPadding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
            title: Text(
              course.tutorials[index].title,
              maxLines: 1,
              style: const TextStyle(fontSize: 18),
            ),
            subtitle: Text(course.tutorials[index].description, maxLines: 1),
            trailing: trailing(course.tutorials[index].duration));
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
