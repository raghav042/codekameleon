import 'package:animations/animations.dart';
import 'package:codekameleon/features/leaderboard/leaderboard_card.dart';
import 'package:codekameleon/model/student_model.dart';
import 'package:codekameleon/features/leaderboard/leaderboard_screen.dart';
import 'package:codekameleon/widgets/heading.dart';
import 'package:flutter/material.dart';

class LeaderboardTile extends StatelessWidget {
  const LeaderboardTile({super.key});
  static final List<Student> _students = [
    Student(name: "Raghav Shukla", rank: 1, score: 100),
    Student(name: "Dhiren", rank: 2, score: 90),
    Student(name: "Vinay", rank: 3, score: 80),
    Student(name: "Roshni", rank: 4, score: 70),
    Student(name: "Aishwarya", rank: 5, score: 80),
    Student(name: "Sarah", rank: 6, score: 70),
    Student(name: "Aishwarya", rank: 5, score: 80),
    Student(name: "Sarah", rank: 6, score: 70),
    Student(name: "Aishwarya", rank: 5, score: 80),
    Student(name: "Sarah", rank: 6, score: 70),
    Student(name: "Aishwarya", rank: 5, score: 80),
    Student(name: "Sarah", rank: 6, score: 70),
    Student(name: "Aishwarya", rank: 5, score: 80),
    Student(name: "Sarah", rank: 6, score: 70),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
      child: OpenContainer(
        closedColor: colorScheme.tertiaryContainer,
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        closedBuilder: (_, __) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
                  child: Heading(
                    title: "Leaderboard",
                    padding: EdgeInsets.zero,
                  ),
                ),
                const SizedBox(height: 20),
                ..._students
                    .take(3)
                    .map((student) => LeaderboardCard(student: student)),
              ],
            ),
          );
        },
        openBuilder: (_, __) => LeaderboardScreen(
          students: _students,
        ),
      ),
    );
  }
}
