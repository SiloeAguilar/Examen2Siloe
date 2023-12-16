import 'package:flutter/material.dart';
import '../models/book.dart';
class BookDetailsScreen extends StatelessWidget {
 final Book book;
 BookDetailsScreen({required this.book});
 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(book.coverImageUrl),
            ),
            Text(
              'Author: ${book.author}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
 }
}
