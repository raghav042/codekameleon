import 'package:codekameleon/features/leaderboard/leaderboard_card.dart';
import 'package:codekameleon/features/leaderboard/podium_item.dart';
import 'package:codekameleon/model/student_model.dart';
import 'package:flutter/material.dart';

import '../../constant/app_strings.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key, required this.students});

  final List<Student> students;

  @override
  Widget build(BuildContext context) {
    final topThree = students.take(3).toList();
    final others = students.skip(3).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.leaderboard),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (topThree.length > 1)
                    PodiumItem(student: topThree[1], position: 2),
                  if (topThree.isNotEmpty)
                    PodiumItem(student: topThree[0], position: 1),
                  if (topThree.length > 2)
                    PodiumItem(student: topThree[2], position: 3),
                ],
              ),
            ),
            // Rest of the list
            ListView.builder(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: others.length,
              itemBuilder: (context, index) => LeaderboardCard(
                student: others[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
