import 'package:flutter/material.dart';
class Post {
    Post({
        required this.id,
        required this.title,
        required this.body,
        this.base64Image,
    });

    final int? id;
    final String? title;
    final String? body;
    final String? base64Image;

    // Hàm chuyển đổi từ Json sang đối tượng Post
    factory Post.fromJson(Map<String, dynamic> json){
        return Post(
            id: json["id"],
            title: json["title"],
            body: json["body"],
            base64Image: json["base64Image"],
        );
    }

    // Hàm chuyển đổi từ Post sang đối tượng Json
    Map<String, dynamic> toJson() =>{
        "id": id,
        "title": title,
        "body": body,
        "base64Image": base64Image
    };
}