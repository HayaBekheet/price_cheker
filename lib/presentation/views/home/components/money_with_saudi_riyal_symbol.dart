import 'package:flutter/material.dart';

import '/common/functions/format_money.dart';
import 'saudi_riyal_symbol.dart';

class MoneyWithSaudiRiyalSymbol extends StatelessWidget {
  const MoneyWithSaudiRiyalSymbol({
    super.key,
    this.prefix,
    required this.money,
    required this.textStyle,
    this.showCurrency = true,
    this.symbolSize = 1.0,
    required this.symbolColor,
  });

  final Widget? prefix;
  final num money;
  final TextStyle textStyle;
  final bool showCurrency;
  final double symbolSize;
  final Color symbolColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.0,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (prefix != null) prefix!,
        Text(
          formatMoney(
            context,
            money.toDouble(),
            showCurrency: false,
          ),
          style: textStyle,
          textAlign: TextAlign.start,
          overflow: TextOverflow.visible,
          softWrap: true,
        ),
        if (showCurrency)
          SaudiRiyalSymbol(
            symbolColor: symbolColor,
            symbolSize: symbolSize,
          ),
      ],
    );
  }
}
