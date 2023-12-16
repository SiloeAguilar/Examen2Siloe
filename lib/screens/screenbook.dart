import 'package:flutter/material.dart';
import '../models/book.dart';
import 'package:flutter_examen2siloe/screens/screenbook_detailes.dart';
import 'package:flutter_examen2siloe/providers/book_provider.dart';
import 'package:provider/provider.dart';
class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<BookListProvider>(context, listen: false).fetchBook());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Libros de Stephen King'),
        backgroundColor: Color.fromARGB(255, 10, 191, 215), // Fondo del título en naranja
      ),
      body: Consumer<BookListProvider>(
        builder: (context, bookListProvider, child) {
          if (bookListProvider.books.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: bookListProvider.books.length,
            itemBuilder: (context, index) {
              final book = bookListProvider.books[index];
              return BookListItem(book: book);
            },
          );
        },
      ),
    );
  }
}

class BookListItem extends StatefulWidget {
  final Book book;

  BookListItem({required this.book});

  @override
  _BookListItemState createState() => _BookListItemState();
}

class _BookListItemState extends State<BookListItem> {
  bool isStarred = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailScreen(book: widget.book),
          ),
        );
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://dical.es/modules/ph_simpleblog/featured/78.jpg', // Imagen por defecto
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.book.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.book.description,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  isStarred ? Icons.star : Icons.star_border,
                  color: isStarred ? Colors.yellow : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isStarred = !isStarred;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
