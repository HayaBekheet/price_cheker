import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../constants/globals.dart';
import '/utils/money_formatter/src/flutter_money_formatter_base.dart';
import '/utils/money_formatter/src/utils/compact_format_type.dart';
import '/utils/money_formatter/src/utils/money_formatter_settings.dart';

String formatMoney(BuildContext context, double price,
    {bool showCurrency = true}) {
  return '${MoneyFormatter(
    amount: price,
    settings: MoneyFormatterSettings(
        compactFormatType: CompactFormatType.short,
        fractionDigits: Globals.kDefaultFractionDigits),
    /*locale: context.locale,*/
  ).output.nonSymbol}${showCurrency ? ' ' : ''}${showCurrency ? tr(context: context, 'currency') : ''}';
}
