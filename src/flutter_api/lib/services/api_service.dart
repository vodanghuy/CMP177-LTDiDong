import 'package:http/http.dart' as http;
import 'dart:convert';
import 'post.dart';

class ApiService{
  final String baseUrl = 'https://github.com/vodanghuy/CMP177-LTDiDong/posts';

  //Lấy toàn bộ bài viết
  Future<List<Post>> fetchAllPosts() async{
    final response = await http.get(Uri.parse(baseUrl));

    if(response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((json) => Post.fromJson(json)).toList();
    }
    else
      {
        throw Exception('Có lỗi khi tải toàn bộ bài viết');
      }
  }

  //Lấy một bài viết cụ thể theo id
  Future<Post> fetchPost(int id) async{
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if(response.statusCode == 200)
      {
        return Post.fromJson(jsonDecode(response.body));
      }
    else
      {
        throw Exception('Có lỗi khi tải chi tiết bài viết');
      }
  }
}