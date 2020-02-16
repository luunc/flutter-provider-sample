import 'package:dxdart/providers/user_login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dxdart/providers/dog_breed_provider.dart';
import 'package:dxdart/injection.dart';

Widget makeTestableWidget(Widget child) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<DogBreedProvider>(
          create: (_) => getIt<DogBreedProvider>()),
      ChangeNotifierProvider<UserLoginProvider>(
          create: (_) => getIt<UserLoginProvider>()),
    ],
    child: MaterialApp(
      home: child,
    ),
  );
}
