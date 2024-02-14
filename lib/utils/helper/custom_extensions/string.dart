part of '../helper.dart';

final formatter = NumberFormat('#,##,000');

extension StringExtensions on String {
  bool parseToBool() {
    final str = this;
    return str.toLowerCase() == 'true';
  }

  String toFormattedNumber({String? pattern}) {
    if (isEmpty) return '';

    final _formatter = pattern != null && pattern.isNotEmpty ? NumberFormat(pattern) : formatter;

    final formattedNumber = _formatter.format(num.parse(this));

    return formattedNumber;
  }
}
