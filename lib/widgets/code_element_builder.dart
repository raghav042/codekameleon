import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class CodeElementBuilder extends MarkdownElementBuilder {
  CodeElementBuilder({required this.isDarkMode, required this.syntax});
  final bool isDarkMode;
  final Syntax syntax;

  @override
  Widget? visitElementAfter(element, preferredStyle) {
    return SyntaxView(
      code: element.textContent,
      syntax: syntax,
      syntaxTheme:
          isDarkMode ? SyntaxTheme.vscodeDark() : SyntaxTheme.vscodeLight(),
      fontSize: 14.0,
      withZoom: false,
      withLinesCount: false,
      expanded: false,
      selectable: false,
    );
  }
}
