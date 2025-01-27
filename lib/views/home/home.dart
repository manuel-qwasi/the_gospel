import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_gospel/resources/app_widgets.dart';
import 'package:the_gospel/views/home/widgets/daily_verse_card.dart';
import 'package:the_gospel/views/home/widgets/guided_prayer_card.dart';
import 'package:the_gospel/views/home/widgets/home_appbar.dart';
import 'package:the_gospel/views/home/widgets/share_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final String streak = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: HomeAppBar(
        title: Text(
          "Today",
          style: AppWidgets.text.bold(fontSize: 26.sp),
        ),
        actions: [
          Image.asset(
            'assets/images/icons/streak_icon.png',
            height: 24.sp,
          ),
          Text(
            streak,
            style: AppWidgets.text.semiBold(fontSize: 19.sp),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0.w, right: 8.0.w),
            child: Image.asset(
              'assets/images/logo/logo.png',
              height: 58.h,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          // vertical: 16.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.0.h),
                child: Text(
                  "DAILY DEVOTION",
                  style: AppWidgets.text.semiBold(fontSize: 13.sp),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 24.h,
                  children: [
                    versesWidgets(),
                    guidedPrayerCard(prayer: "Parables: A House Divided"),
                    shareCard(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget versesWidgets() {
    return dailyVerseCard(
      verse:
          "For God so loved the world that he gave his one and only Son, that whoever believes in him shall not perish but have eternal life.",
      backgroundImage: 'assets/images/daily_verse_background/verse_image_1.png',
      reference: "John 3:16",
    );
  }
}
