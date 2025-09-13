import 'package:flutter/material.dart';

import '/common/themes/colours.dart';

class IconedTitle extends StatelessWidget {
  const IconedTitle({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.0,
      children: [
        Icon(icon, color: Colours.kHighlightColor4.withValues(alpha: 0.5)),
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colours.kDescriptionColor),
        ),
      ],
    );
  }
}
