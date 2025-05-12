import 'package:flutter/material.dart';

class UiHelper {
  static void showGenericConfirmationDialog({
    required BuildContext context,
    required String title,
    required String message,
    required VoidCallback onConfirmed,
    String cancelText = "Cancel",
    String confirmText = "OK",
    String? thirdOption,
    VoidCallback? thirdClick,
  }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(cancelText),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onConfirmed();
            },
            child: Text(confirmText),
          ),
          if (thirdOption != null)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (thirdClick != null) {
                  thirdClick();
                }
              },
              child: Text(thirdOption),
            ),
        ],
      ),
    );
  }
}
