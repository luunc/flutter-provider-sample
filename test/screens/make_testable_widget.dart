import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dxdart/providers/dog_breed_provider.dart';
import 'package:dxdart/injection.dart';

Widget makeTestableWidget(Widget child) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<DogBreedProvider>(
          create: (_) => getIt<DogBreedProvider>()),
    ],
    child: MaterialApp(
      home: child,
    ),
  );
}
