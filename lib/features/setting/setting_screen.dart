import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../widgets/heading.dart';

import 'account_settings.dart';
import 'language_settings.dart';
import 'notification_settings.dart';
import 'theme_settings.dart';

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
      appBar: AppBar(title: const Text('Setting')),
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
        const Heading(title: "Account"),
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
              title: const Text("Manage Account"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationSettings()));
              },
              leading: const Icon(Icons.notifications_outlined),
              title: const Text("Notifications"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ThemeSettings()));
              },
              leading: const Icon(Icons.dark_mode_outlined),
              title: const Text("Theme Mode"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LanguageSettings()));
              },
              leading: const Icon(Icons.translate),
              title: const Text("Language"),
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
            ),
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
        const Heading(title: "Help & Support"),
        Column(
          children: [
            ListTile(
              onTap: () {
                launchUrlString(
                    "https://www.freeprivacypolicy.com/live/7af2be58-04b5-4389-ae72-47ed1c231fd8");
              },
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              leading: const Icon(Icons.help_outline),
              title: const Text("Help"),
            ),
            ListTile(
              onTap: () {
                launchUrlString(
                    "https://www.freeprivacypolicy.com/live/7af2be58-04b5-4389-ae72-47ed1c231fd8");
              },
              leading: const Icon(Icons.feedback_outlined),
              title: const Text("Feedback"),
            ),
            ListTile(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
              },
              leading: const Icon(Icons.info_outline),
              title: const Text("About Us"),
            ),

            /// TODO: terms of use is mandatory for app store
            // ListTile(
            //   leading: Icon(Icons.copyright),
            //   title: Text("Terms of Use"),
            // ),
            ListTile(
              onTap: () {
                launchUrlString(
                    "https://www.freeprivacypolicy.com/live/7af2be58-04b5-4389-ae72-47ed1c231fd8");
              },
              leading: const Icon(Icons.shield_outlined),
              title: const Text("Privacy Policy"),
            ),
            ListTile(
              onTap: () {
                // launchUrlString(AppHelper.storeUrl);
              },
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
              leading: const Icon(Icons.star_rate_outlined),
              title: const Text("Rate Us on Play Store"),
            ),
          ],
        ),
      ],
    );
  }
}
