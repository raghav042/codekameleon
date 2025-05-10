import 'dart:developer';

import 'package:flutter/material.dart';

class ReusableElevatedButton extends StatefulWidget {
  final String title;
  final Future<void> Function() onPressed;
  final Color? color;
  final Color? foreGroundColor;
  final double? width;
  final double? height;
  final TextStyle? titleStyle;
  final Color? borderColor;

  const ReusableElevatedButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.color,
      this.width,
      this.height,
      this.titleStyle,
      this.foreGroundColor,
      this.borderColor});

  @override
  State<ReusableElevatedButton> createState() => _ReusableElevatedButtonState();
}

class _ReusableElevatedButtonState extends State<ReusableElevatedButton> {
  bool _isLoading = false;

  Future<void> _handlePress() async {
    setState(() => _isLoading = true);
    try {
      log("the loader in hadle press ${_isLoading}");
      await widget.onPressed();
    } finally {
      setState(() => _isLoading = false);
      log("the loader in hadle press finally ${_isLoading}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 50,
      child: ElevatedButton(
        // style: ElevatedButton.styleFrom(
        //   shape: RoundedRectangleBorder(
        //     // side: BorderSide(color: widget.borderColor ?? AppConstants.primary),
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        // ),
        onPressed: _isLoading ? null : _handlePress,
        child: _isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                widget.title,
                style:
                    widget.titleStyle ?? TextStyle(fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
