
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_gospel/models/verse.dart';
import 'package:the_gospel/providers/bible_json_provider.dart';

// Book Provider
final booksProvider = Provider<List<String>>((ref) {
  final json = ref.watch(bibleJsonProvider);
  return json.map((e) => e['book'] as String).toSet().toList();
});

// Chapters Provider
final chaptersProvider = StateProvider<List<int>>((ref) => []);

// Verses Provider
final versesProvider = StateProvider<List<Verse>>((ref) => []);