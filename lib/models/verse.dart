class Verse {
  final int verse;
  final int chapter;
  final String book;
  final String text;

  Verse(
      {required this.verse,
      required this.chapter,
      required this.book,
      required this.text});

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
        verse: int.parse(
          json['verse'],
        ),
        chapter: int.parse(
          json['chapter'],
        ),
        book: json['book'],
        text: json['text']);
  }
}
