import 'package:codekameleon/extension/context_extension.dart';
import 'package:codekameleon/model/student_model.dart';
import 'package:flutter/material.dart';

class LeaderboardCard extends StatelessWidget {
  final Student student;

  const LeaderboardCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: colorScheme.primaryContainer,
          child: Text(
            "#${student.rank}",
            style: TextStyle(color: colorScheme.onPrimaryContainer),
          ),
        ),
        title: Text(
          student.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "${student.score}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.star_rounded, color: Colors.amber),
          ],
        ),
      ),
    );
  }
}
