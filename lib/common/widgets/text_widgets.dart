import 'package:flutter/material.dart';

class TextWidgets {
  String fontFamily = 'Inter';

  TextStyle regular({
    final double? fontSize,
    final Color? color,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: fontSize ?? 14,
      color: color,
      fontFamily: fontFamily,
    );
  }

  TextStyle thin({
    final double? fontSize,
    final Color? color,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w100,
      fontSize: fontSize ?? 14,
      color: color,
    );
  }

  TextStyle light({
    final double? fontSize,
    final Color? color,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: fontSize ?? 14,
      color: color,
    );
  }

  TextStyle medium({
    final double? fontSize,
    final Color? color,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: fontSize ?? 14,
      color: color,
    );
  }

  TextStyle semiBold({
    final double? fontSize,
    final Color? color,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: fontSize ?? 16,
      color: color,
    );
  }

  TextStyle bold({
    final double? fontSize,
    final Color? color,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: fontSize ?? 16,
      color: color,
    );
  }
}
