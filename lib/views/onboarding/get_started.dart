import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:the_gospel/common/widgets/button_widgets.dart';
import 'package:the_gospel/resources/app_widgets.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDAE2EB),
      body: SafeArea(
        child: SizedBox(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/f8c0c0adb6021cd2aa8f4589f9b7d086.png',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: 16.h,
                left: 0,
                right: 0,
                child: Column(
                  spacing: 8.h,
                  children: [
                    Text(
                      "Welcome",
                      style: AppWidgets.text.semiBold(
                        fontSize: 20.sp,
                        color: Color(0xFF8C96A1),
                      ),
                    ),
                    Text(
                      "Start your journey\nthrough God's Word",
                      textAlign: TextAlign.center,
                      style: AppWidgets.text.bold(fontSize: 23.sp),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 40.h,
                left: 24.w,
                right: 24.w,
                child: SizedBox(
                  height: 48.h,
                  child: AppWidgets.button.customButton(
                      label: "Get Started",
                      onPressed: () => context.go('/home-tab')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
