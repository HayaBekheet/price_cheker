import 'package:flutter/material.dart';

import '/common/themes/colours.dart';
import 'money_with_saudi_riyal_symbol.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.0,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(7.0),
          decoration: BoxDecoration(
            color: Colours.kHighlightColor4.withValues(
              alpha: 0.2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(7.0),
            ),
          ),
          child: MoneyWithSaudiRiyalSymbol(
            money: 35.00,
            textStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colours.kHighlightColor4),
            symbolColor: Colours.kHighlightColor4,
          ),
        ),
        Stack(
          children: [
            MoneyWithSaudiRiyalSymbol(
              money: 45.00,
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colours.kDescriptionColor),
              symbolColor: Colours.kDescriptionColor,
            ),
            Positioned.fill(
              child: CustomPaint(
                painter: LineThroughPainter(
                  lineColor: Colours.kHighlightColor4,
                  strokeWidth: 1.0,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LineThroughPainter extends CustomPainter {
  final Color lineColor;
  final double strokeWidth;

  LineThroughPainter({this.lineColor = Colors.red, this.strokeWidth = 2.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, 0),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
