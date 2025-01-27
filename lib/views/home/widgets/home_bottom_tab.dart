import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_gospel/views/home/bible.dart';
import 'package:the_gospel/views/home/home.dart';
import 'package:the_gospel/views/home/notes.dart';

class HomeBottomTab extends StatefulWidget {
  const HomeBottomTab({super.key});

  @override
  State<HomeBottomTab> createState() => _HomeBottomTabState();
}

int _currentIndex = 0;
final List screens = [
  const HomeScreen(),
  const BibleScreen(),
  const NoteScreen(),
];

class _HomeBottomTabState extends State<HomeBottomTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: 68.h,
          backgroundColor: Colors.white,
          indicatorColor: Color(0xFFDCE4EA),
        ),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          destinations: [
            NavigationDestination(
              icon: Icon(
                EneftyIcons.home_2_bold,
                size: 24.h,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/images/icons/bible_icon.png',
                height: 24.h,
                color: Colors.black,
              ),
              label: 'Bible',
            ),
            NavigationDestination(
              icon: Icon(
                EneftyIcons.note_bold,
                color: Colors.black,
                size: 24.h,
              ),
              label: 'Notes',
            ),
          ],
        ),
      ),
    );
  }
}
