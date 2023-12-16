import 'dart:convert';
import 'package:dio/dio.dart';

class StephenKingService {
  final Dio dio = Dio();

  Future<dynamic> getBooks() async {
    try {
      final response = await dio.get('https://stephen-king-api.onrender.com/books');
      return response.data;
    } catch (error) {
      print('Error fetching books: $error');
      rethrow; // Re-throw the error to let the calling code handle it
    }
  }

  Future<dynamic> getBookByTitle(String title) async {
    try {
      final response = await dio.get('https://stephen-king-api.onrender.com/books?title=$title');
      return response.data;
    } catch (error) {
      print('Error fetching book by title: $error');
      throw error;
    }
  }

  Future<dynamic> getBookByID(String id) async {
    try {
      final response = await dio.get('https://stephen-king-api.onrender.com/books/$id');
      return response.data;
    } catch (error) {
      print('Error fetching book by ID: $error');
      throw error;
    }
  }

  Future<dynamic> getAuthor() async {
    try {
      final response = await dio.get('https://stephen-king-api.onrender.com/author');
      return response.data;
    } catch (error) {
      print('Error fetching author: $error');
      throw error;
    }
  }
}
