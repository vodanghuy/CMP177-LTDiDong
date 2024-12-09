import 'package:flutter/material.dart';

class ProfileExample extends StatelessWidget{
  const ProfileExample({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hồ sơ'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: 300,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.yellow,
                      backgroundImage: NetworkImage('https://picsum.photos/200/200'),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Tên người dùng',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        Icon(Icons.email),
                        SizedBox(width: 8),
                        Text('Email: email@example.com'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Icon(Icons.phone),
                        SizedBox(width: 8),
                        Text('Số điện thoại: 0123456789'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ),
          ),
        ),
    );
  }
}