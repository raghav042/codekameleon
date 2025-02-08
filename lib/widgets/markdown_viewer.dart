import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'code_element_builder.dart';

class MarkdownViewer extends StatelessWidget {
  const MarkdownViewer({
    super.key,
    required this.filePath,
    required this.syntax,
  });
  final String filePath;
  final Syntax syntax;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    bool isDarkMode = colorScheme.brightness == Brightness.dark;
    return FutureBuilder(
      future: rootBundle.loadString(filePath),
      builder: (context, snapshot) {
        return snapshot.data != null
            ? MarkdownBody(
                data: snapshot.data!,
                styleSheet: MarkdownStyleSheet(
                  code: GoogleFonts.notoSansMono(),
                ),
                builders: {
                  'code': CodeElementBuilder(
                    isDarkMode: isDarkMode,
                    syntax: syntax,
                  )
                },
              )
            : const SizedBox();
      },
    );
  }
}
