import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:mashtoz_flutter/domens/models/book.dart';

class BookRepository {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
  final bookrep = BookRepository;
  Future<List<Comments>?> bookFetch() async {
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => Comments.fromJson(data)).toList();
      } else {
        print('Error_in_BookRepo');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
  
}
