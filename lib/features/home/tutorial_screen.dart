import 'package:codekameleon/model/tutorial_model.dart';
import 'package:codekameleon/widgets/markdown_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

import '../../widgets/heading.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({
    super.key,
    required this.tutorial,
    required this.syntax,
    required this.iconPath,
    required this.color,
  });
  final TutorialModel tutorial;
  final Syntax syntax;
  final String iconPath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tutorial.title),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                const Icon(Icons.access_time, size: 20, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  tutorial.duration,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MarkdownViewer(
                content: tutorial.content,
                syntax: syntax,
              ),
              const SizedBox(height: 30),
              const Heading(title: "Advertisement"),
              const SizedBox(height: 10),
              Container(
                height: 200,
                width: double.maxFinite,
                color: Colors.teal,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChips() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (_, i) {
          final isSelected = i == 2;
          return ChoiceChip(
            selectedColor: color,
            labelStyle: TextStyle(color: isSelected ? Colors.white : null),
            checkmarkColor: isSelected ? Colors.white : null,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            label: Text("label $i"),
            selected: isSelected,
            onSelected: (v) {},
          );
        },
        separatorBuilder: (_, __) => SizedBox(width: 8),
      ),
    );
  }
}
