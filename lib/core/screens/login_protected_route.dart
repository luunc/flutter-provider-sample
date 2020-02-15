import 'package:dxdart/providers/user_login_provider.dart';
import 'package:dxdart/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginProtectedRoute extends StatelessWidget {
  final Widget child;

  const LoginProtectedRoute({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<UserLoginProvider, bool>(
      selector: (_, provider) => provider.isLogin,
      builder: (_, isLogin, __) => _LoginProtectedRoute(
        child: child,
        isLogin: isLogin,
      ),
    );
  }
}

class _LoginProtectedRoute extends StatelessWidget {
  final Widget child;
  final bool isLogin;

  const _LoginProtectedRoute({
    Key key,
    @required this.isLogin,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isLogin) return Login();

    return child;
  }
}
