import 'package:codekameleon/extension/context_extension.dart';
import 'package:codekameleon/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PodiumItem extends StatelessWidget {
  final Student student;
  final int position;

  const PodiumItem({super.key, required this.student, required this.position});

  static const _heights = {1: 90.0, 2: 75.0, 3: 60.0};

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final rankColor = _getRankColor(position, colorScheme);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: rankColor,
          child: Text(
            "#$position",
            style: GoogleFonts.quicksand(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          student.name,
          style: GoogleFonts.quicksand(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${student.score} pts",
          style: GoogleFonts.quicksand(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: 80,
          height: _heights[position],
          decoration: BoxDecoration(
            color: rankColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Center(
            child: Text(
              position.toString(),
              style: GoogleFonts.quicksand(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Color _getRankColor(int rank, ColorScheme colorScheme) {
  return switch (rank) {
    1 => Colors.lightBlue.shade400,
    2 => Colors.purple.shade300,
    3 => Colors.pink.shade300,
    _ => Colors.blueGrey,
  };
}
