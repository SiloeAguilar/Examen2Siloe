import 'package:flutter_examen2siloe/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_examen2siloe/services/serv.dart';

class BookListProvider with ChangeNotifier {
  final BookService _bookService = BookService();
  List<Book> _books = [];
  List<Book> get books => _books;
  void fetchBook() async {
    _books = await _bookService.getBooks();
    notifyListeners();
  }
}