import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_gospel/resources/app_widgets.dart';

Widget dailyVerseCard({
  required final String verse,
  required final String backgroundImage,
  required final String reference,
}) {
  return Container(
    padding: EdgeInsets.all(24.sp),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0.r),
      image: DecorationImage(
        image: AssetImage(backgroundImage),
        colorFilter: ColorFilter.mode(
          Colors.black.withValues(alpha: 200),
          BlendMode.darken,
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16.0.h),
          child: Text(
            verse,
            style: AppWidgets.text.semiBold(
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          reference,
          style: AppWidgets.text.regular(
            fontSize: 11.sp,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
