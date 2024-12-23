import 'package:flutter/material.dart';

class UserInforWidget extends StatelessWidget{
  final String username;
  final String email;
  UserInforWidget({required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Username: $username', style: const TextStyle(fontSize: 20)),
        Text('Email: $email', style: const TextStyle(fontSize: 20))
      ],
    );
  }
}
class UserInforScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}