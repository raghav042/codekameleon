import 'package:codekameleon/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, required this.imagePath, required this.title});
  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: imagePath.contains(".svg")
              ? SvgPicture.asset(imagePath)
              : Image.asset(imagePath),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: context.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8),
        const Text("Please check again after some time"),
      ],
    );
  }
}
