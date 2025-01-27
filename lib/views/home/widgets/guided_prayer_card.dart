import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_gospel/resources/app_widgets.dart';

Widget guidedPrayerCard({
  required final String prayer,
}) {
  return Container(
    padding: EdgeInsets.all(24.sp),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.0.h),
          child: Text(
            "Guided Prayer",
            style: AppWidgets.text.regular(
              fontSize: 12.sp,
              color: Color(0xFF2F2F2F),
            ),
          ),
        ),
        Text(
          prayer,
          style: AppWidgets.text.semiBold(
            fontSize: 14.sp,
            color: Color(0xFF2F2F2F),
          ),
        ),
      ],
    ),
  );
}
