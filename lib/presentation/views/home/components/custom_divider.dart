import 'package:flutter/material.dart';

import '/common/themes/colours.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colours.kUnselectedColor,
      indent: 15.0,
      endIndent: 15.0,
      height: 0.0,
    );
  }
}
