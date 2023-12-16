import 'package:flutter/material.dart';
import 'services/serv.dart';
void main() async {
 final stephenKingService = StephenKingService();

 // Obtener todos los libros
 final books = await stephenKingService.getBooks();
 print(books);

 // Obtener un libro por título
 final bookByTitle = await stephenKingService.getBookByTitle('El Resplandor');
 print(bookByTitle);

 // Obtener un libro por ID
 final bookByID = await stephenKingService.getBookByID('5a2c2f525f3e772f6e044736');
 print(bookByID);

 // Obtener la información del autor
 final author = await stephenKingService.getAuthor();
 print(author);
}

