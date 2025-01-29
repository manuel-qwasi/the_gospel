import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_gospel/common/widgets/appbar_widgets.dart';
import 'package:the_gospel/common/widgets/text_form_field_widgets.dart';
import 'package:the_gospel/providers/bible_providers.dart';
import 'package:the_gospel/resources/app_widgets.dart';
import 'chapters_screen.dart';

class BibleScreen extends ConsumerStatefulWidget {
  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends ConsumerState<BibleScreen> {
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
          style: AppWidgets.text.semiBold(fontSize: 16),
        ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChaptersScreen(bookName: filteredBooks[index]),
                      ),
                    );
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
