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
      code: element.textContent, // Code text
      syntax: syntax, // Language
      syntaxTheme: isDarkMode
          ? SyntaxTheme.vscodeDark()
          : SyntaxTheme.vscodeLight(), // Theme
      fontSize: 14.0, // Font size
      withZoom: false, // Enable/Disable zoom icon controls
      withLinesCount: false, // Enable/Disable line number
      expanded: false, // Enable/Disable container expansion
      selectable: false, // Enable/Disable code text selection
    );
  }
}
