import 'package:flutter/material.dart';

class LoginSuccess extends StatelessWidget {
  static const routeName = '/login-success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Success'),
      ),
      body: Center(
        child: Text('You are logged in.'),
      ),
    );
  }
}
