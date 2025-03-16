import 'package:codekameleon/extension/context_extension.dart';
import 'package:codekameleon/model/tutorial_model.dart';
import 'package:codekameleon/widgets/markdown_viewer.dart';
import 'package:codekameleon/widgets/native_ad_widget.dart';
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
    final colorScheme = context.colorScheme;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar.large(
              title: Text(tutorial.title),
            )
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.edit_note,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          tutorial.updatedAt,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.timelapse_outlined,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          tutorial.duration,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      tutorial.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              MarkdownViewer(
                content: tutorial.content,
                syntax: syntax,
              ),
              const SizedBox(height: 30),
              const Heading(title: "Advertisement"),
              const SizedBox(height: 10),
              const NativeAdWidget(),
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
}
