import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Heading extends StatelessWidget {
  const Heading({super.key, required this.title, this.padding});
  final String title;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.fromLTRB(20.0, 12, 12, 0),
      child: Text(
        title,
        style: GoogleFonts.quicksand(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
