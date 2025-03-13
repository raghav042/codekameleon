import 'package:codekameleon/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'code_element_builder.dart';

class MarkdownViewer extends StatelessWidget {
  const MarkdownViewer({
    super.key,
    required this.content,
    required this.syntax,
  });
  final String content;
  final Syntax syntax;

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: content,
      styleSheet: MarkdownStyleSheet(code: GoogleFonts.notoSansMono()),
      builders: {
        'code': CodeElementBuilder(
          scheme: context.colorScheme,
          syntax: syntax,
        )
      },
    );
  }
}
