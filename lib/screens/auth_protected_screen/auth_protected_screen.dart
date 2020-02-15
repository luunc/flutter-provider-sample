import 'package:dxdart/providers/user_login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthProtectedScreen extends StatelessWidget {
  static const routeName = '/auth-protected-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('authenticated'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text('You are innnnnn'),
          ),
          RaisedButton(
            onPressed:
                Provider.of<UserLoginProvider>(context, listen: false).logout,
            child: Text('log out'),
          )
        ],
      ),
    );
  }
}
