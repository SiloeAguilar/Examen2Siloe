import 'package:flutter/material.dart';
import 'package:flutter_examen2siloe/models/book.dart';
import 'package:flutter/material.dart';
class BookDetailScreen extends StatelessWidget {
  final Book book;
  BookDetailScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 244, 244),
      appBar: AppBar(
        title: Text('Detalle del Libro'),
        backgroundColor: Color.fromARGB(255, 195, 12, 174),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 255, 245, 245), Colors.grey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Título: ${book.title}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'ID: ${book.id}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Descripción: ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 24, 22, 22),
              ),
            ),
            Text(
              book.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'VILLANOS:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: book.villains.length,
                itemBuilder: (context, index) {
                  final villain = book.villains[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 0, 0),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.circle_notifications, color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          villain['name'] ?? 'Desconocido',
                          style: TextStyle(color: Color.fromARGB(255, 11, 0, 51)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
