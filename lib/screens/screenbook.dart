import 'package:flutter/material.dart';
import '../models/book.dart';
class BookListScreen extends StatelessWidget {
 final List<Book> books;

 BookListScreen({required this.books});

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text(book.author),
            leading: Image.network(book.coverImageUrl),
          );
        },
      ),
    );
 }
}
List<Book> books = [
 Book(title: 'The Dark Tower', author: 'Stephen King', coverImageUrl: 'https://example.com/cover-image.jpg'),
 Book(title: '1984', author: 'George Orwell', coverImageUrl: 'https://example.com/cover-image2.jpg'),
];

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    return MaterialApp(
      home: BookListScreen(books: books),
    );
 }
}

void main() {
 runApp(MyApp());
}