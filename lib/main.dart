import 'package:flutter/material.dart';
import 'package:flutter_examen2siloe/providers/book_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_examen2siloe/screens/screenbook.dart';void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookListProvider()),
      ],
      child: MaterialApp(
        title: 'LIBRERIA',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            color: Color.fromARGB(255, 133, 0, 151),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.library_books),
                SizedBox(width: 10),
                Text('LIBRERIA', style: TextStyle(color: Colors.white)),
              ],
            ),
            elevation: 0, // Sin sombra en el AppBar
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 139, 0, 154), Colors.brown[800]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: BookListScreen(),
          ),
        ),
      ),
    );
  }
}
