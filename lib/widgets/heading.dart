import 'package:flutter/cupertino.dart';

class Heading extends StatelessWidget {
  const Heading({super.key, required this.title, this.padding});
  final String title;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.fromLTRB(24.0, 20, 12, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
