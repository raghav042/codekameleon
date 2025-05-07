import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codekameleon/features/leaderboard/leaderboard_card.dart';
import 'package:codekameleon/features/leaderboard/leaderboard_screen.dart';
import 'package:codekameleon/model/user_model.dart';
import 'package:codekameleon/widgets/heading.dart';
import 'package:flutter/material.dart';

import '../../constant/app_strings.dart';

class LeaderboardTile extends StatefulWidget {
  const LeaderboardTile({super.key});

  @override
  State<LeaderboardTile> createState() => _LeaderboardTileState();
}

class _LeaderboardTileState extends State<LeaderboardTile> {
  List<UserModel> users = [];
  Future<void> getUsers() async {
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .orderBy("points", descending: true)
        .limit(3)
        .get();
    final docs = snapshot.docs.map((e) => UserModel.fromJson(e.data()));
    users.addAll(docs);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

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
                    title: AppStrings.leaderboard,
                    padding: EdgeInsets.zero,
                  ),
                ),
                const SizedBox(height: 20),
                ...users.map((student) => LeaderboardCard(user: student)),
              ],
            ),
          );
        },
        openBuilder: (_, __) => const LeaderboardScreen(),
      ),
    );
  }
}
