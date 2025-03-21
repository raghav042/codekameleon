import 'package:flutter/material.dart';

import '../../widgets/heading.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  bool changeName = false;
  bool changeEmail = false;
  bool changePassword = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Account Settings"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              editProfile(colorScheme),
              manageAccount(colorScheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget editProfile(ColorScheme colorScheme) {
    return Column(
      children: [
        const SizedBox(height: 15),
        const Heading(title: "Profile"),
        Column(
          children: [
            ListTile(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //         const RegistrationScreen(isRegister: false)));
              },
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              tileColor: colorScheme.surfaceContainerLowest,
              leading: const Icon(Icons.person_outline),
              title: const Text("Edit Profile"),
            ),
            ListTile(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const BasicInfoScreen()));
              },
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
              tileColor: colorScheme.surfaceContainerLowest,
              leading: const Icon(Icons.info_outline),
              title: const Text("Edit Basic Information"),
            ),
          ],
        ),
      ],
    );
  }

  Widget manageAccount(ColorScheme colorScheme) {
    return Column(
      children: [
        const SizedBox(height: 15),
        const Heading(title: "Account"),
        Column(
          children: [
            ListTile(
              onTap: () {
                // UserProvider().signOut(context);
              },
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              tileColor: colorScheme.surfaceContainerLowest,
              leading: const Icon(Icons.logout),
              title: const Text("Log Out"),
            ),
            ListTile(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                        Text("Your account will be deleted within 24 hours"),
                  ),
                );
                // UserProvider().signOut(context);
              },
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
              tileColor: colorScheme.surfaceContainerLowest,
              leading: const Icon(Icons.delete_forever),
              title: const Text("Delete Account"),
            ),
          ],
        ),
      ],
    );
  }
}
