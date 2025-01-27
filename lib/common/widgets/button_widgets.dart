import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidgets {
  Widget customButton({
    required final String label,
    required final VoidCallback onPressed,
    final double? labelSize,
    final double? elevation,
    final Color? labelColor,
    final Color? buttonColor,
    final FontWeight? fontWeight,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation ?? 0,
        backgroundColor: buttonColor ?? Colors.white,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        // ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: labelSize ?? 14.sp,
          color: labelColor ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.w500,
        ),
      ),
    );
  }
}
