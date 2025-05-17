import 'package:codekameleon/extension/context_extension.dart';
import 'package:codekameleon/features/quiz/quiz_result.dart';
import 'package:codekameleon/helper/quiz_helper.dart';
import 'package:codekameleon/model/language_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../preferences/preferences.dart';

class QuizInfo extends StatelessWidget {
  const QuizInfo({super.key, required this.language});
  final LanguageModel language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/quiz.svg",
              height: 300,
            ),
            Text(
              "Quiz Already Taken",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent, // Consistent color scheme
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "You have already taken this quiz. You can reattempt it after one week.",
              textAlign: TextAlign.center,
              style: TextStyle(
                // Use Raleway for body text
                fontSize: 16,
                color: Colors.grey[700], // Darker gray for better readability
              ),
            ),
            const SizedBox(height: 24),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                final quizResult = Preferences.getQuizResult(language.name);
                //  Add navigation logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizResultScreen(
                      language: language,
                      result: const {},
                    ), // Corrected class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colorScheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Consistent rounding
                ),
              ),
              child: Text(
                "View Results / Answers",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600, // Medium weight for button text
                ),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                //  Add logic for watching an ad and reattempting quiz
                // You would typically use a plugin like:
                //  firebase_admob or google_mobile_ads
                // to display an ad here.
                //
                // Example (Conceptual):
                // showRewardedAd().then((success) {
                //   if (success) {
                //     //  Allow user to re-take quiz
                //     Navigator.pop(context); // Go back to quiz screen
                //   } else {
                //     //  Show error message
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(
                //         content: Text("Failed to load ad. Please try again."),
                //       ),
                //     );
                //   }
                // });

                //  For demonstration purposes, let's add a placeholder:
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Watch Ad to Reattempt"),
                    content: const Text(
                        "An ad will be shown. After the ad, you can reattempt the quiz."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          QuizHelper().quizReattempt(language);
                        },
                        child: const Text("Watch Ad"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: const Text("Cancel"),
                      ),
                    ],
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blueAccent, // Use the blue accent
                side: const BorderSide(color: Colors.blueAccent),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Reattempt Quiz (Watch Ad)",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
