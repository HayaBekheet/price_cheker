part of '../flutter_money_formatter_base.dart';

enum FastCalcType {
  addition,
  subtraction,
  multiplication,
  division,
  percentageAddition,
  percentageSubtraction
}

class _Utilities {
  _Utilities({required this.amount, /*required this.local,*/ this.settings}) {
    settings = settings ?? MoneyFormatterSettings();
  }

  final double amount;

  //final Locale local;

  MoneyFormatterSettings? settings;

  /// Returns formatted number
  String get baseFormat => NumberFormat.currency(
          symbol: '',
          decimalDigits: settings?.fractionDigits,
          locale: 'en_US')
      .format(amount);

  /// Returns formatted number with refined separator chars
  String get refineSeparator => baseFormat
      .replaceAll(',', '(,)')
      .replaceAll('.', '(.)')
      .replaceAll('(,)', settings?.thousandSeparator ?? ' ')
      .replaceAll('(.)', settings?.decimalSeparator ?? ' ');

  /// Returns spacer as `spaceBetweenSymbolAndNumber` value
  String get spacer => settings?.symbolAndNumberSeparator ?? ' ';

  /// Returns base compact format
  NumberFormat get baseCompact =>
      settings?.compactFormatType == CompactFormatType.short
          ? NumberFormat.compact(
              /*locale: "${local.languageCode}_${local.countryCode}"*/)
          : NumberFormat.compactLong(
              /*locale: "${local.languageCode}_${local.countryCode}"*/);
}
