import 'package:flutter/material.dart';
import 'package:go7eight/src/core/constants/colors.dart';

class ExpandableSection extends StatelessWidget {
  final String title;
  final Widget content;

  const ExpandableSection({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      expandedAlignment: Alignment.topLeft,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.black
              : AppColor.white,
        ),
      ),
      children: [content],
    );
  }
}