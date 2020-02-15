import 'package:dio/dio.dart';
import 'package:dxdart/core/errors/connection_error.dart';
import 'package:flutter/cupertino.dart';

import 'package:dxdart/core/provider/loading_error_provider.dart';
import 'package:dxdart/core/constants.dart';
import 'package:dxdart/core/network/d_dio.dart';

import 'package:dxdart/models/dog_breed_model.dart';

class DogBreedProvider extends LoadingErrorProvider {
  // DEPENDENCIES
  /////////////////////////////////////////
  final DDio dioClient;

  // CONSTRUCTOR
  /////////////////////////////////////////
  DogBreedProvider({@required this.dioClient});

  // STATES
  /////////////////////////////////////////
  DogBreed _data;

  DogBreed get data => _data;

  // METHODS
  /////////////////////////////////////////
  Future<void> getBreed() async {
    try {
      changeLoading(true);
      notifyListeners();

      final response = await dioClient.get(
        'https://api.thedogapi.com/v1/images/search',
        options: Options(
          headers: {'x-api-key': API_KEY},
        ),
      );

      Map<String, dynamic> breed = response.data[0];
      Map<String, dynamic> breedMap = {
        'name': (breed['breeds'] as List).length > 0
            ? breed['breeds'][0]['name']
            : '',
        'origin': (breed['breeds'] as List).length > 0
            ? breed['breeds'][0]['origin']
            : '',
        'imgUrl': breed['url'],
      };

      final newBreed = DogBreed.fromMap(breedMap);

      _data = newBreed;
      changeLoading(false);
      if (error != null) {
        changeError(null);
      }
      notifyListeners();
    } catch (e) {
      changeError(ConnectionError());
      changeLoading(false);
      notifyListeners();
    }
  }
}
