import 'dart:convert';
import 'package:ebook_store/Model/books.dart';
import 'package:http/http.dart' as http;

class BookApi {
  static const String baseUrl = 'http://192.168.18.113/ApiMAker/api/';

  Future<List<Books>> getAllBooks() async {
    final response = await http.get(Uri.parse('$baseUrl/Book/GetAllBooks'));

    if (response.statusCode == 200) {
      Iterable<dynamic> data = json.decode(response.body);
      List<Books> books =
          List<Books>.from(data.map((model) => Books.fromJson(model)));
      return books;
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<String> saveBook(Map<String, dynamic> bookData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/Book/SaveBook'),
      body: bookData,
    );

    if (response.statusCode == 200) {
      return 'Book Added ${json.decode(response.body)['ID']}';
    } else {
      throw Exception('Failed to save book');
    }
  }
}
