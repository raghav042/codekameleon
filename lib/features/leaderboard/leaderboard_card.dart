import 'package:codekameleon/model/student_model.dart';
import 'package:flutter/material.dart';

class LeaderboardCard extends StatelessWidget {
  final Student student;

  const LeaderboardCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueGrey,
          child: Text(
            "#${student.rank}",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(student.name),
        subtitle: Text("${student.score} pts"),
        trailing: Text(
          "${student.rank}",
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
