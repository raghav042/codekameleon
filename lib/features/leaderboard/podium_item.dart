import 'package:cached_network_image/cached_network_image.dart';
import 'package:codekameleon/extension/context_extension.dart';
import 'package:codekameleon/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PodiumItem extends StatelessWidget {
  const PodiumItem({super.key, required this.user, required this.position});
  final UserModel user;
  final int position;

  static const _heights = {1: 110.0, 2:70.0, 3: 45.0};

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final rankColor = _getRankColor(position, colorScheme);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: rankColor,
          backgroundImage: user.imageUrl != null
              ? CachedNetworkImageProvider(user.imageUrl!)
              : null,
          child: user.imageUrl == null
              ? Text(
                  "#$position",
                  style: GoogleFonts.quicksand(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              : null,
        ),
        const SizedBox(height: 8),
        Text(
          user.name,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: GoogleFonts.quicksand(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${user.points} pts",
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
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25), bottom: Radius.circular(8)),
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
