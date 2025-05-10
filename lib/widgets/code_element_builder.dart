import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            margin: const EdgeInsets.only(top: 5),
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
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                      text: element.textContent,
                    )).then(
                      (value) {
                        String? result = element.textContent.toString();
                        log("the copies data is $result");
                      },
                    );
                  },
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
            margin: const EdgeInsets.only(bottom: 5),
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
              syntaxTheme: _syntaxTheme(scheme),
            ),
          ),
        ],
      ),
    );
  }
}

SyntaxTheme _syntaxTheme(ColorScheme scheme) {
  return scheme.brightness == Brightness.dark
      ? SyntaxTheme.vscodeDark().copyWith(backgroundColor: Colors.transparent)
      : SyntaxTheme.vscodeLight().copyWith(backgroundColor: Colors.transparent);
}
