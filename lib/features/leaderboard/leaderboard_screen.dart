import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codekameleon/features/leaderboard/leaderboard_card.dart';
import 'package:codekameleon/features/leaderboard/podium_item.dart';
import 'package:codekameleon/model/user_model.dart';
import 'package:flutter/material.dart';

import '../../constant/app_strings.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.leaderboard)),
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .orderBy("points", descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text("Something went wrong"));
              } else if (snapshot.data != null &&
                  snapshot.data!.docs.isNotEmpty) {
                final users = snapshot.data!.docs
                    .map((e) => UserModel.fromJson(e.data()))
                    .toList();
                return buildList(users);
              } else {
                return const Center(child: Text("No data found"));
              }
            }),
      ),
    );
  }

  Widget buildList(List<UserModel> users) {
    final topThree = users.take(3).toList();
    final others = users.skip(3).toList();

    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (topThree.length > 1)
                PodiumItem(user: topThree[1], position: 2),
              if (topThree.isNotEmpty)
                PodiumItem(user: topThree[0], position: 1),
              if (topThree.length > 2)
                PodiumItem(user: topThree[2], position: 3),
            ],
          ),
        ),
        // Rest of the list
        ListView.builder(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: others.length,
          itemBuilder: (context, index) => LeaderboardCard(
            user: others[index],
            index: index + 1,
          ),
        ),
      ],
    );
  }
}
