import 'package:dxdart/core/screens/login_protected_route.dart';
import 'package:dxdart/providers/user_login_provider.dart';
import 'package:dxdart/screens/auth_protected_screen/auth_protected_screen.dart';
import 'package:dxdart/screens/login/login.dart';
import 'package:dxdart/screens/login_success/login_success.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dxdart/injection.dart';
import 'package:dxdart/screens/home/home.dart';
import 'package:dxdart/providers/dog_breed_provider.dart';

void main() async {
  await configureInjection();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DogBreedProvider>(
            create: (_) => getIt<DogBreedProvider>()),
        ChangeNotifierProvider<UserLoginProvider>(
            create: (_) => getIt<UserLoginProvider>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
        routes: {
          Home.routeName: (_) => Home(),
          Login.routeName: (_) => Login(),
          LoginSuccess.routeName: (_) => LoginSuccess(),
          AuthProtectedScreen.routeName: (_) =>
              LoginProtectedRoute(child: AuthProtectedScreen())
        },
      ),
    );
  }
}
