import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/models/post.dart';
import 'package:flutter_api/services/api_service.dart';

class PostScreen extends StatefulWidget
{
  const PostScreen({super.key});
  @override
  _PostScreenState createState() => _PostScreenState();
}
class _PostScreenState extends State<PostScreen>
{
  late Future<List<Post>> futurePosts;
  @override
  void initState()
  {
    super.initState();
    futurePosts = ApiService().fetchAllPosts();
  }

  @override
  Widget build(BuildContext context)
  {
    return Expanded (
        child: FutureBuilder<List<Post>>(
        future: futurePosts, // Future để lấy dữ liệu từ API
        builder: (context, snapshot) {
// Nếu đang trong trạng thái chờ (dữ liệu chưa về)
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
            child:
            CircularProgressIndicator()
        ); // Hiển thị vòng tròn chờ
      }
// Nếu có lỗi trong quá trình lấy dữ liệu
      else if (snapshot.hasError) {
        return Text('Lỗi: ${snapshot.error}'); // Hiển thị lỗi
      }
// Nếu dữ liệu đã được tải thành công
      else if (snapshot.hasData) {
        List<Post> posts = snapshot.data!; // Lấy danh sách bài viết
        return ListView.builder(
          itemCount: posts.length, // Số lượng bài viết
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(posts [index]
                  .title!), // Hiển thị tiêu đề của bài viết // Text
              subtitle: Text (posts [index]
                  .body!), // Hiển thị nội dung của bài viết // Text
            ); // ListTile
          },
        ); // ListView.builder
          }
// Trường hợp không có dữ liệu (danh sách rỗng)
          else {
            return const Text('Không có dữ liệu');
          }
        },
        ),
    );
  }
}