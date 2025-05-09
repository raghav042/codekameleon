import 'package:codekameleon/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/app_strings.dart';
import '../../helper/snackbar_helper.dart';
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
          title: const Text(AppStrings.accountSettings),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        const Heading(title: AppStrings.profile),
        ListTile(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //         const RegistrationScreen(isRegister: false)));
            SnackbarHelper.snackbarFunction(context, "Coming Soon");

          },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          tileColor: colorScheme.surfaceContainerLowest,
          leading: const Icon(Icons.person_outline),
          title: const Text(AppStrings.editProfile),
        ),
        ListTile(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const BasicInfoScreen()));
          },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
          tileColor: colorScheme.surfaceContainerLowest,
          leading: const Icon(Icons.info_outline),
          title: const Text(AppStrings.editBasicInformation),
        ),
      ],
    );
  }

  Widget manageAccount(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        const Heading(title: AppStrings.account),
        ListTile(
          onTap: () {
            context.read<UserProvider>().signOut(context);
            SnackbarHelper.snackbarFunction(context, "Logged Out");
          },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          tileColor: colorScheme.surfaceContainerLowest,
          leading: const Icon(Icons.logout),
          title: const Text(AppStrings.logOut),
        ),
        ListTile(
          onTap: () {
            context.read<UserProvider>().deleteAccount(context);
            //SnackbarHelper.snackbarFunction(context, "Account Deleted");
            //no need because the deleteAccount function already has a snackbar
          },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
          tileColor: colorScheme.surfaceContainerLowest,
          leading: const Icon(Icons.delete_forever),
          title: const Text(AppStrings.deleteAccount),
        ),
      ],
    );
  }
}
