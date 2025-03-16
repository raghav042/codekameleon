import 'package:animations/animations.dart';
import 'package:codekameleon/features/leaderboard/leaderboard_screen.dart';
import 'package:codekameleon/widgets/heading.dart';
import 'package:flutter/material.dart';

class LeaderboardTile extends StatelessWidget {
  const LeaderboardTile({super.key});

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
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Heading(
                        title: "Leaderboard Rank",
                        padding: EdgeInsets.zero,
                      ),
                      Icon(Icons.open_in_full),
                    ],
                  ),
                ),
                SizedBox(height: 20, width: double.maxFinite),
                ListTile(
                  title: Text("some content"),
                ),
                SizedBox(height: 8),
                ListTile(
                  title: Text("useful information"),
                ),
                SizedBox(height: 8),
                ListTile(
                  title: Text("another useful information"),
                ),
              ],
            ),
          );
        },
        openBuilder: (_, __) => const LeaderboardScreen(),
      ),
    );
  }
}
