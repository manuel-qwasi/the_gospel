import 'package:the_gospel/models/chapter.dart';

class Book {
  final String title;
  final List<Chapter> chapters;

  Book({required this.title, required this.chapters});
}