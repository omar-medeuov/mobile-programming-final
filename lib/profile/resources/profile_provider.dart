import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:https_project/model/profile_user.dart';

class ProfileProvider {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<ProfileUser>> fetchProfile() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic>jsonList = jsonDecode(response.body);
      final List<ProfileUser> userList = jsonList.map((json) => ProfileUser.fromJson(json)).toList();
      return userList;
    } else {
      throw Exception("Failed to load profileUser");
    }
  }
}
