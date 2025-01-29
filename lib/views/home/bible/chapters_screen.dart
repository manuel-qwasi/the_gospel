import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_gospel/providers/bible_json_provider.dart';
import 'package:the_gospel/resources/app_widgets.dart';
import 'package:the_gospel/views/home/bible/verse_screen.dart';

class ChaptersScreen extends ConsumerWidget {
  final String bookName;

  const ChaptersScreen({required this.bookName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final json = ref.watch(bibleJsonProvider);
    final chapters = json
        .where((e) => e['book'] == bookName)
        .map((e) => int.parse(e['chapter']))
        .toSet()
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(bookName)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.h, vertical: 4.0.h),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // Number of columns
            crossAxisSpacing: 16.sp,
            mainAxisSpacing: 16.sp,
            childAspectRatio: 1.2, // Adjust for better fit
          ),
          itemCount: chapters.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VersesScreen(
                      bookName: bookName,
                      chapter: chapters[index],
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color(0xFFBDBDBD), width: 1), // Thin border
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    chapters[index].toString(),
                    style: AppWidgets.text.semiBold(fontSize: 16),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
