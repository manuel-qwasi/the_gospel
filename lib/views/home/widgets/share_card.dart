import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget shareCard({
  final String? title,
  final String? description,
}) {
  return Container(
    padding: EdgeInsets.all(24),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6.0.r),
            child: Image.asset(
              'assets/images/share_image.png',
              width: double.infinity,
              height: 150.h,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? "Share with your friends",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2F2F2F),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xFF2F2F2F),
              size: 18.sp,
            ),
          ],
        ),
        Text(
          description ?? "Invite your family to download",
          style: TextStyle(
            fontSize: 12.sp,
            color: Color(0xFF2F2F2F),
          ),
        ),
      ],
    ),
  );
}
