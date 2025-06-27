import 'dart:convert';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<Map<String, dynamic>> fetchPost() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
