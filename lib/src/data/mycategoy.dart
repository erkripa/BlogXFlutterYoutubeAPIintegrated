import 'dart:convert';
import 'package:http/http.dart' as http;

class MyCategroy {
  final String _baseUrl =
      'http://elearningcave.com/wp-json/wp/v2/posts?_embed&categories=2';

  Future<List> _getAllPosts() async {
    try {
      var _response = await http.get(Uri.parse(_baseUrl));

      if (_response.statusCode == 200) {
        return jsonDecode(_response.body);
      } else {
        return Future.error("Server  Error");
      }
    } catch (e) {
      return Future.error("Data Fetching Error!");
    }
  }

  Future<List> get getAllPost => _getAllPosts();
}
