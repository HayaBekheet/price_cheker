import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/gen/assets.gen.dart';

class SaudiRiyalSymbol extends StatelessWidget {
  const SaudiRiyalSymbol({
    super.key,
    required this.symbolColor,
    this.symbolSize = 1.0,
  });

  final Color symbolColor;
  final double symbolSize;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: symbolSize,
      child: SvgPicture.asset(
        Assets.images.svg.saudiRiyal,
        width: 16.0,
        height: 16.0,
        colorFilter: ColorFilter.mode(
          symbolColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
