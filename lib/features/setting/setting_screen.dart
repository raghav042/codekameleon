import 'package:codekameleon/helper/review_helper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../constant/app_strings.dart';
import '../../widgets/heading.dart';

import 'account_settings.dart';
import 'language_settings.dart';
import 'notification_settings.dart';
import 'theme_settings.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.setting)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            account(colorScheme),
            helpAndSupport(colorScheme),
          ],
        ),
      ),
    );
  }

  Widget account(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading(title: AppStrings.account),
        Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountSettings()));
              },
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              leading: const Icon(Icons.person_outline),
              title: const Text(AppStrings.manageAccount),
            ),
            // ListTile(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const NotificationSettings()));
            //   },
            //   leading: const Icon(Icons.notifications_outlined),
            //   title: const Text(AppStrings.notifications),
            // ),
            // ListTile(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const ThemeSettings()));
            //   },
            //   leading: const Icon(Icons.dark_mode_outlined),
            //   title: const Text(AppStrings.themeMode),
            // ),
            // ListTile(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const LanguageSettings()));
            //   },
            //   leading: const Icon(Icons.translate),
            //   title: const Text(AppStrings.language),
            //   shape: const RoundedRectangleBorder(
            //     borderRadius:
            //         BorderRadius.vertical(bottom: Radius.circular(16)),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }

  Widget helpAndSupport(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        const Heading(title: AppStrings.helpAndSupport),
        Column(
          children: [
            ListTile(
              onTap: () async {
                //launchUrlString(
                //    "https://www.freeprivacypolicy.com/live/7af2be58-04b5-4389-ae72-47ed1c231fd8");
                const urlHelp =
                    "https://www.freeprivacypolicy.com/live/7af2be58-04b5-4389-ae72-47ed1c231fd8";
                if (await canLaunchUrl(Uri.parse(urlHelp))) {
                  await launchUrl(Uri.parse(urlHelp));
                } else {
                  throw ("Could not launch $urlHelp");
                }
              },
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              leading: const Icon(Icons.help_outline),
              title: const Text(AppStrings.help),
            ),
            ListTile(
              onTap: () async {
                const urlFeedback =
                    "https://www.freeprivacypolicy.com/live/7af2be58-04b5-4389-ae72-47ed1c231fd8";
                //launchUrlString(
                //    "https://www.freeprivacypolicy.com/live/7af2be58-04b5-4389-ae72-47ed1c231fd8");
                if (await canLaunchUrl(Uri.parse(urlFeedback))) {
                  await launchUrl(Uri.parse(urlFeedback));
                } else {
                  throw ("Could not launch $urlFeedback");
                }
              },
              leading: const Icon(Icons.feedback_outlined),
              title: const Text(AppStrings.feedback),
            ),
            ListTile(
              onTap: () async {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
                const urlAboutus =
                    "https://www.freeprivacypolicy.com/live/7af2be58-04b5-4389-ae72-47ed1c231fd8";
                if (await canLaunchUrl(Uri.parse(urlAboutus))) {
                  await launchUrl(Uri.parse(urlAboutus));
                } else {
                  throw ("Could not launch $urlAboutus");
                }
              },
              leading: const Icon(Icons.info_outline),
              title: const Text(AppStrings.aboutUs),
            ),

            /// TODO: terms of use is mandatory for app store
            // ListTile(
            //   leading: Icon(Icons.copyright),
            //   title: Text("Terms of Use"),
            // ),
            ListTile(
              onTap: () async {
                //launchUrlString(
                //    "https://www.freeprivacypolicy.com/live/7af2be58-04b5-4389-ae72-47ed1c231fd8");
                const urlPrivacy =
                    "https://www.freeprivacypolicy.com/live/7af2be58-04b5-4389-ae72-47ed1c231fd8";
                if (await canLaunchUrl(Uri.parse(urlPrivacy))) {
                  await launchUrl(Uri.parse(urlPrivacy));
                } else {
                  throw ("Could not launch $urlPrivacy");
                }
              },
              leading: const Icon(Icons.shield_outlined),
              title: const Text(AppStrings.privacyPolicy),
            ),
            ListTile(
              onTap: () async {
                InAppReviewRepository().requestReview();
                //  const urlRateUs = "https://www.freeprivacypolicy.com/live/7af2be58-04b5-4389-ae72-47ed1c231fd8";
                //  if(await canLaunchUrl(Uri.parse(urlRateUs))){
                // await launchUrl(Uri.parse(urlRateUs));
                // } else {
                // throw("Could not launch $urlRateUs");
                // }
              },
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
              leading: const Icon(Icons.star_rate_outlined),
              title: const Text(AppStrings.rateUsOnPlayStore),
            ),
          ],
        ),
      ],
    );
  }
}
