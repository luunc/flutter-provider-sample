import 'package:dxdart/core/errors/base_error.dart';
import 'package:dxdart/providers/user_login_provider.dart';
import 'package:dxdart/screens/login_success/login_success.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  static const routeName = '/login';

  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<UserLoginProvider, List>(
      selector: (_, provider) => [
        provider.isLogin,
        provider.loginSuccess,
        provider.loginFailed,
        provider.error
      ],
      builder: (_, data, __) =>
          LoginProvider(data[0], data[1], data[2], data[3]),
    );
  }
}

class LoginProvider extends StatefulWidget {
  final bool isLogin;
  final Function loginSuccess;
  final Function loginFail;
  final BaseError error;

  const LoginProvider(
    this.isLogin,
    this.loginSuccess,
    this.loginFail,
    this.error, {
    Key key,
  }) : super(key: key);

  @override
  _LoginProviderState createState() => _LoginProviderState();
}

class _LoginProviderState extends State<LoginProvider> {
  @override
  void initState() {
    super.initState();
    if (widget.isLogin) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pop();
      });
    }
  }

  @override
  void didUpdateWidget(LoginProvider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLogin) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacementNamed(LoginSuccess.routeName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Colors.greenAccent,
                  child: Text('Login success'),
                  onPressed: widget.loginSuccess,
                ),
                RaisedButton(
                  color: Colors.redAccent,
                  child: Text('Login failed'),
                  onPressed: widget.loginFail,
                ),
              ],
            ),
            if (widget.error != null)
              Text(
                widget.error.message,
                style: TextStyle(color: Colors.redAccent),
              ),
          ],
        ),
      ),
    );
  }
}
