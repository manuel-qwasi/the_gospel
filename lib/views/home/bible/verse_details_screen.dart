import 'package:flutter/material.dart';
import 'package:the_gospel/models/verse.dart';

class VerseDetailScreen extends StatelessWidget {
  final Verse verse;

  const VerseDetailScreen({required this.verse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${verse.book} ${verse.chapter}:${verse.verse}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(verse.text, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
