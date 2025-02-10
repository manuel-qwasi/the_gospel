import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_gospel/models/verse.dart';
import 'package:the_gospel/providers/bible_json_provider.dart';
import 'package:the_gospel/resources/app_widgets.dart';
import 'package:the_gospel/views/home/bible/verse_screen.dart';
void showBibleBottomSheet(BuildContext context, WidgetRef ref, String bookName) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => BibleBottomSheet(bookName: bookName),
  );
}

class BibleBottomSheet extends ConsumerStatefulWidget {
  final String bookName;

  const BibleBottomSheet({super.key, required this.bookName});

  @override
  _BibleBottomSheetState createState() => _BibleBottomSheetState();
}

class _BibleBottomSheetState extends ConsumerState<BibleBottomSheet> {
  String? selectedChapter;

  @override
  Widget build(BuildContext context) {
    final json = ref.watch(bibleJsonProvider);

    if (selectedChapter == null) {
      // Show Chapters
      final chapters = json
          .where((e) => e['book'] == widget.bookName)
          .map((e) => int.parse(e['chapter']))
          .toSet()
          .toList();

      return _buildBottomSheetContent(
        title: widget.bookName,
        items: chapters,
        onItemTap: (chapter) {
          setState(() {
            selectedChapter = chapter.toString();
          });
        },
      );
    } else {
      // Show Verse Numbers
      final verses = json
          .where((e) => e['book'] == widget.bookName && e['chapter'] == selectedChapter)
          .map((e) => int.parse(e['verse']))
          .toSet()
          .toList();

      return _buildBottomSheetContent(
        title: "${widget.bookName} - Chapter $selectedChapter",
        items: verses,
        onItemTap: (verse) {
          Navigator.pop(context); // Close the bottom sheet
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VersesScreen(
                bookName: widget.bookName,
                chapter: int.parse(selectedChapter!),
                initialVerse: verse, // Pass tapped verse
              ),
            ),
          );
        },
      );
    }
  }

  Widget _buildBottomSheetContent({
    required String title,
    required List<int> items,
    required Function(int) onItemTap,
  }) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.75,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Padding(
          padding: EdgeInsets.all(16.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppWidgets.text.bold(fontSize: 20)),
              SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  controller: scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16.sp,
                    mainAxisSpacing: 16.sp,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => onItemTap(items[index]),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFBDBDBD), width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            items[index].toString(),
                            style: AppWidgets.text.semiBold(fontSize: 16),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
