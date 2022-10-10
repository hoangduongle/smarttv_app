

import 'package:intl/intl.dart';

abstract class NumberUtils {
  static NumberFormat numberFormat = NumberFormat();

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

  static String feedbackPoint(double? value) {
    if (value == null) return '-';
    if (value > 0) {
      return value.toStringAsFixed(1);
    } else {
      return "-";
    }
  }
}
