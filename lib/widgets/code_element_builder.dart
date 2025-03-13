import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class CodeElementBuilder extends MarkdownElementBuilder {
  CodeElementBuilder({required this.scheme, required this.syntax});
  final ColorScheme scheme;
  final Syntax syntax;

  @override
  Widget? visitElementAfter(element, preferredStyle) {
    if (element.textContent.length < 20) {
      return Text(element.textContent, style: preferredStyle);
    }

    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: scheme.surfaceContainer,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(25),
                bottom: Radius.circular(4),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    syntax.name,
                    style: const TextStyle(fontSize: 13.5),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.copy,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: scheme.surface, height: 1.5),
          Container(
            width: double.maxFinite,
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              color: scheme.surfaceContainer,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(4),
                bottom: Radius.circular(25),
              ),
            ),
            child: SyntaxView(
              code: element.textContent,
              syntax: syntax,
              fontSize: 14.5,
              withZoom: false,
              withLinesCount: false,
              expanded: false,
              selectable: false,
              syntaxTheme: scheme.brightness == Brightness.dark
                  ? SyntaxTheme.vscodeDark().copyWith(
                      backgroundColor: Colors.transparent,
                    )
                  : SyntaxTheme.vscodeLight().copyWith(
                      backgroundColor: Colors.transparent,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
