import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_gospel/models/verse.dart';
import 'package:the_gospel/providers/bible_json_provider.dart';
import 'package:the_gospel/views/home/bible/verse_details_screen.dart';

class VersesScreen extends ConsumerWidget {
  final String bookName;
  final int chapter;

  const VersesScreen({required this.bookName, required this.chapter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final json = ref.watch(bibleJsonProvider);
    final verses = json
        .where((e) => e['book'] == bookName && int.parse(e['chapter']) == chapter)
        .map((e) => Verse.fromJson(e))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text("$bookName - Chapter $chapter")),
      body: ListView.builder(
        itemCount: verses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Verse ${verses[index].verse}: ${verses[index].text}"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VerseDetailScreen(verse: verses[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
