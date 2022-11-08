// ignore_for_file: unnecessary_string_interpolations

import 'package:intl/intl.dart';

abstract class NumberUtils {
  static NumberFormat numberFormat = NumberFormat();

  static String time(int? value) {
    NumberFormat numberFormatTime = NumberFormat("00");
    if (value == 0) return '00';
    return "${numberFormatTime.format(value)}";
  }

  static String vnd(double? value) {
    if (value == null) return '-';
    return "${numberFormat.format(value)} VNĐ";
  }

  static String noVnd(double? value) {
    if (value == null) return '-';
    return numberFormat.format(value);
  }

  static String intToVnd(int? value) {
    if (value == null) return '-';
    return "${numberFormat.format(value)} VNĐ";
  }

  static String stringToVnd(String? value) {
    if (value == null) return '-';
    return "${numberFormat.format(value)} VNĐ";
  }

  static String vndd(double? value) {
    if (value == null) return '-';
    if (value > 0) {
      return "+${numberFormat.format(value)} VNĐ";
    } else {
      return "${numberFormat.format(value)} VNĐ";
    }
  }
}
