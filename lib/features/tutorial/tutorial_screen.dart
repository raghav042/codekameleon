import 'dart:io';

import 'package:codekameleon/extension/context_extension.dart';
import 'package:codekameleon/model/tutorial_model.dart';
import 'package:codekameleon/widgets/markdown_viewer.dart';
import 'package:codekameleon/widgets/native_ad_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

import '../../constant/app_strings.dart';

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
                //margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage("assets/icons/app_logo.png"),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.codeKameleon,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onPrimaryContainer,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                            width: double.maxFinite,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                tutorial.updatedAt,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.primary,
                                ),
                              ),
                              Text(
                                "${tutorial.duration} read",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(height: 1, color: colorScheme.surface),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.tertiaryContainer,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
                child: Text(
                  tutorial.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              MarkdownViewer(
                content: tutorial.content,
                syntax: syntax,
              ),
              const SizedBox(height: 20),
              if (!kIsWeb && Platform.isAndroid) const NativeAdWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
