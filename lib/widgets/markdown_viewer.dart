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
      styleSheet: MarkdownStyleSheet(
          code: GoogleFonts.ubuntu(),
          h1: GoogleFonts.lora(fontSize: 42),
          h2: GoogleFonts.robotoSerif(fontSize: 22),
          h3: GoogleFonts.openSans(),
          p: GoogleFonts.openSans(fontSize: 15.5),
          strong: GoogleFonts.openSans(fontSize: 14),
          h1Padding: const EdgeInsets.only(bottom: 20),
          h2Padding: const EdgeInsets.symmetric(vertical: 12)),
      builders: {
        'code': CodeElementBuilder(
          scheme: context.colorScheme,
          syntax: syntax,
        )
      },
    );
  }
}
