import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:the_gospel/models/verse.dart';
import 'package:the_gospel/providers/bible_json_provider.dart';
import 'package:the_gospel/resources/app_widgets.dart';
import 'package:the_gospel/views/home/widgets/home_appbar.dart';

class VersesScreen extends ConsumerStatefulWidget {
  final String bookName;
  final int chapter;
  final int initialVerse;

  const VersesScreen(
      {required this.bookName,
      required this.chapter,
      required this.initialVerse});

  @override
  _VersesScreenState createState() => _VersesScreenState();
}

class _VersesScreenState extends ConsumerState<VersesScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToVerse();
    });
  }

  void _scrollToVerse() {
    final index = widget.initialVerse - 1; // 0-based index
    if (index >= 0 && _scrollController.hasClients) {
      _scrollController.animateTo(
        index * 50.0, // Adjust based on ListTile height
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final json = ref.watch(bibleJsonProvider);
    final verses = json
        .where((e) =>
            e['book'] == widget.bookName &&
            int.parse(e['chapter']) == widget.chapter)
        .map((e) => Verse.fromJson(e))
        .toList();

    return Scaffold(
      appBar: HomeAppBar(
        leading: IconButton(
          onPressed: context.pop,
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              elevation: 0, foregroundColor: Colors.black),
          child: Text(
            "${widget.bookName} ${widget.chapter}",
            style: AppWidgets.text.bold(fontSize: 16.sp),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.go('/bible/${widget.bookName}');
            },
            child: Icon(Icons.arrow_back_ios_new),
          ),
          FloatingActionButton(
            onPressed: () {
              context.go('/bible/${widget.bookName}/${widget.chapter + 1}');
            },
            child: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: verses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${verses[index].verse} ",
                  style: AppWidgets.text.bold(fontSize: 16),
                ),
                Expanded(child: Text("${verses[index].text}")),
              ],
            ),
          );
        },
      ),
    );
  }
}
