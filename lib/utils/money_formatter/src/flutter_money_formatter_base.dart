import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';

import 'utils/compact_format_type.dart';
import 'utils/money_formatter_settings.dart';
import 'utils/money_formatter_output.dart';
import 'utils/money_formatter_compare.dart';

part 'utils/utilities.dart';

/// [FlutterMoneyFormatter] instance
class MoneyFormatter {
  late _Utilities _utilities;

  /// Init instance of [FlutterMoneyFormatter]
  ///
  /// [amount] (@required) the number that will be formatted
  MoneyFormatter({required this.amount, /*required this.locale,*/ this.settings}) {
    settings = settings ?? MoneyFormatterSettings();
    output = _getOutput();
    comparator = MoneyFormatterCompare(amount: amount);
  }

  /// Amount number that will be formatted.
  double amount;

  //Locale locale;

  /// The formatter settings
  MoneyFormatterSettings? settings;

  /// Returns compiled and formatted output in several formats.
  late MoneyFormatterOutput output;

  /// Comparator
  late MoneyFormatterCompare comparator;

  /// output builder
  MoneyFormatterOutput _getOutput() {
    _utilities = _Utilities(amount: amount, /*local: locale,*/ settings: settings);

    String urs = _utilities.refineSeparator;
    int decSepCharPos = urs.indexOf(settings?.decimalSeparator ?? '˘');

    return MoneyFormatterOutput(
        nonSymbol: urs,
        symbolOnLeft: '${settings?.symbol ?? ''}${_utilities.spacer}$urs',
        symbolOnRight:
            '$urs${_utilities.spacer}${settings?.symbol ?? ''}',
        compactNonSymbol: _compactNonSymbol,
        compactSymbolOnLeft:
            '${settings?.symbol ?? ''}${_utilities.spacer}$_compactNonSymbol',
        compactSymbolOnRight:
            '$_compactNonSymbol${_utilities.spacer}${settings?.symbol ?? ''}',
        fractionDigitsOnly:
            urs.substring((-1 == decSepCharPos ? 0 : decSepCharPos + 1)),
        withoutFractionDigits: urs.substring(
            0, -1 == decSepCharPos ? urs.length - 1 : decSepCharPos));
  }

  /// returns FlutterMoneyFormatter after calculating amount.
  MoneyFormatter fastCalc(
      {required FastCalcType type, required double amount}) {
    switch (type) {
      case FastCalcType.addition:
        this.amount += amount;
        break;

      case FastCalcType.subtraction:
        this.amount -= amount;
        break;

      case FastCalcType.multiplication:
        this.amount *= amount;
        break;

      case FastCalcType.division:
        this.amount /= amount;
        break;

      case FastCalcType.percentageAddition:
        this.amount += (amount / 100) * this.amount;
        break;

      case FastCalcType.percentageSubtraction:
        this.amount -= (amount / 100) * this.amount;
        break;

      default:
        throw "Unknown calculation type.";
    }

    return this;
  }

  /// Copies current instance and change some values to the new instance.
  MoneyFormatter copyWith(
      {double? amount,
      String? symbol,
      String? thousandSeparator,
      String? decimalSeparator,
      int? fractionDigits,
      String? symbolAndNumberSeparator,
      CompactFormatType? compactFormatType}) {
    MoneyFormatterSettings? ts = settings;

    MoneyFormatterSettings mfs = MoneyFormatterSettings(
        symbol: symbol ?? ts?.symbol,
        thousandSeparator: thousandSeparator ?? ts?.thousandSeparator,
        decimalSeparator: decimalSeparator ?? ts?.decimalSeparator,
        symbolAndNumberSeparator:
            symbolAndNumberSeparator ?? ts?.symbolAndNumberSeparator,
        fractionDigits: fractionDigits ?? ts?.fractionDigits,
        compactFormatType: compactFormatType ?? ts?.compactFormatType);

    return MoneyFormatter(amount: amount ?? this.amount, /*locale: locale,*/ settings: mfs,);
  }

  /// Returns compact format number without currency symbol
  String get _compactNonSymbol {
    String compacted = _utilities.baseCompact.format(amount);
    String numerics = RegExp(r'(\d+\.\d+)|(\d+)')
        .allMatches(compacted)
        .map((value) => value.group(0))
        .toString()
        .replaceAll('(', '')
        .replaceAll(')', '');

    String alphas = compacted.replaceAll(numerics, '');

    String reformat = NumberFormat.currency(
            symbol: '',
            decimalDigits:
                !numerics.contains('.') ? 0 : settings?.fractionDigits)
        .format(num.parse(numerics));

    return '$reformat$alphas';
  }
}
