import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_gospel/common/widgets/appbar_widgets.dart';
import 'package:the_gospel/common/widgets/text_form_field_widgets.dart';
import 'package:the_gospel/providers/bible_providers.dart';
import 'package:the_gospel/resources/app_widgets.dart';
import 'package:the_gospel/views/home/widgets/bottom_sheet_widget.dart';

class BibleScreen extends ConsumerStatefulWidget {
  @override
  _BibleScreenState createState() => _BibleScreenState();
}

class _BibleScreenState extends ConsumerState<BibleScreen> {
  TextEditingController _searchController = TextEditingController();
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final books = ref.watch(booksProvider);

    // Filter books based on search query
    final filteredBooks = books
        .where((book) => book.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        title: Text(
          "Books",
          style: AppWidgets.text.semiBold(fontSize: 24),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 8.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: const Color(0xFFDAE2EB),
            ),
            child: Text(
              "KJV",
              style: AppWidgets.text.bold(),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: searchBar(
              controller: _searchController,
              hintText: "Search for a book",
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredBooks[index]),
                  onTap: () {
                    showBibleBottomSheet(context, ref, filteredBooks[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
