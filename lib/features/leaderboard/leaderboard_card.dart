import 'package:codekameleon/extension/context_extension.dart';
import 'package:codekameleon/model/user_model.dart';
import 'package:flutter/material.dart';

class LeaderboardCard extends StatelessWidget {
  const LeaderboardCard({super.key, required this.user});
  final UserModel user;

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
            "#${user.points}",
            style: TextStyle(color: colorScheme.onPrimaryContainer),
          ),
        ),
        title: Text(
          user.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "${user.points}",
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
