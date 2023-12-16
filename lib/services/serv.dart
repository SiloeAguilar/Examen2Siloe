import 'dart:convert';
import 'package:dio/dio.dart';

class StephenKingService {
  final Dio dio;

  StephenKingService() : dio = Dio();

  StephenKingService.withBaseUrl(String baseUrl) : dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<dynamic> getBooks() async {
    try {
      final response = await dio.get('/books');
      return response.data;
    } catch (error) {
      _handleError('Error fetching books', error);
      rethrow;
    }
  }

  Future<dynamic> getBookByTitle(String title) async {
    try {
      final response = await dio.get('/books', queryParameters: {'title': title});
      return response.data;
    } catch (error) {
      _handleError('Error fetching book by title', error);
      return;
    }
  }

  Future<dynamic> getBookByID(String id) async {
    try {
      final response = await dio.get('/books/$id');
      return response.data;
    } catch (error) {
      _handleError('Error fetching book by ID', error);
      rethrow;
    }
  }

  Future<dynamic> getAuthor() async {
    try {
      final response = await dio.get('/author');
      return response.data;
    } catch (error) {
      _handleError('Error fetching author', error);
      rethrow;
    }
  }

  void _handleError(String message, dynamic error) {
    print('$message: $error');
    if (error is DioError) {
      // Handle Dio-specific errors here
      print('DioError details: ${error.response?.data}');
    }
  }
}
