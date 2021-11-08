import 'dart:convert';

import 'package:http/http.dart' as http;

class PostData {
  final String baseUrl = "http://elearningcave.com/wp-json/wp/v2/posts?_embed";

  Future<List> getAllPost() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (socketException) {
      return Future.error("Error Fetching Data");
    }
  }
}
