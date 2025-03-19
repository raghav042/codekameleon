import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            account(colorScheme),
            helpAndSupport(colorScheme),
            appInfo(colorScheme),
          ],
        ),
      ),
    );
  }

  Widget account(ColorScheme colorScheme) {
    return Column(
      children: [
        Heading(title: "Account"),
        Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountSettings()));
              },
              tileColor: colorScheme.surfaceContainerLowest,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              leading: Icon(Icons.person_outline),
              title: Text("Manage Account"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationSettings()));
              },
              tileColor: colorScheme.surfaceContainerLowest,
              leading: Icon(Icons.notifications_outlined),
              title: Text("Notifications"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThemeSettings()));
              },
              tileColor: colorScheme.surfaceContainerLowest,
              leading: Icon(Icons.dark_mode_outlined),
              title: Text("Theme Mode"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LanguageSettings()));
              },
              tileColor: colorScheme.surfaceContainerLowest,
              leading: Icon(Icons.translate),
              title: Text("Language"),
              shape: RoundedRectangleBorder(
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
      children: [
        SizedBox(height: 15),
        Heading(title: "Help & Support"),
        Column(
          children: [
            ListTile(
              onTap: () {
                launchUrlString(
                    "https://www.freeprivacypolicy.com/live/7af2be58-04b5-4389-ae72-47ed1c231fd8");
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              tileColor: colorScheme.surfaceContainerLowest,
              leading: Icon(Icons.help_outline),
              title: Text("Help"),
            ),
            ListTile(
              onTap: () {
                launchUrlString(
                    "https://www.freeprivacypolicy.com/live/7af2be58-04b5-4389-ae72-47ed1c231fd8");
              },
              tileColor: colorScheme.surfaceContainerLowest,
              leading: Icon(Icons.feedback_outlined),
              title: Text("Feedback"),
            ),
            ListTile(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
              },
              tileColor: colorScheme.surfaceContainerLowest,
              leading: Icon(Icons.info_outline),
              title: Text("About Us"),
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
              tileColor: colorScheme.surfaceContainerLowest,
              leading: Icon(Icons.shield_outlined),
              title: Text("Privacy Policy"),
            ),
            ListTile(
              onTap: () {
                // launchUrlString(AppHelper.storeUrl);
              },
              tileColor: colorScheme.surfaceContainerLowest,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
              leading: Icon(Icons.star_rate_outlined),
              title: Text("Rate Us on Play Store"),
            ),
          ],
        ),
      ],
    );
  }

  Widget appInfo(ColorScheme colorScheme) {
    return Column(
      children: [
        SizedBox(height: 30),
        Image.asset(
          "assets/images/logo_with_name.png",
          width: 150,
          color: colorScheme.surfaceContainer,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
