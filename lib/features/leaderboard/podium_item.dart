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
    final rankColor = _getRankColor(position);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: rankColor,
          child: Text(
            "#$position",
            style: GoogleFonts.quicksand(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            // style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          student.name,
          style:
              GoogleFonts.quicksand(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          "${student.score} pts",
          style: GoogleFonts.quicksand(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
          // const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 6),
        Container(
          width: 80,
          height: _heights[position],
          decoration: BoxDecoration(
            color: rankColor.withValues(alpha: 0.7),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Center(
            child: Text(
              position.toString(),
              style: GoogleFonts.quicksand(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              // style: const TextStyle(
              //   color: Colors.white,
              //   fontSize: 24,
              //   fontWeight: FontWeight.bold,
              // ),
            ),
          ),
        ),
      ],
    );
  }
}

Color _getRankColor(int rank) {
  return switch (rank) {
    1 => Colors.amber,
    2 => Colors.grey,
    3 => Colors.brown,
    _ => Colors.blueGrey,
  };
}
