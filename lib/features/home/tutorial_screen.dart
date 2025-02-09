import 'package:codekameleon/model/tutorial_model.dart';
import 'package:codekameleon/widgets/markdown_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({
    super.key,
    required this.tutorial,
    required this.syntax,
    required this.iconPath,
    required this.scheme,
  });
  final TutorialModel tutorial;
  final Syntax syntax;
  final String iconPath;
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(tutorial.title),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                const Icon(Icons.access_time, size: 20),
                const SizedBox(width: 8),
                Text(tutorial.duration),
              ],
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
          child: MarkdownViewer(
            content: tutorial.filePath,
            syntax: syntax,
          ),
        ),
      ),
    );
  }
}
