import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dxdart/core/network/d_dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:dxdart/providers/dog_breed_provider.dart';
import 'package:dxdart/models/dog_breed_model.dart';

import '../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements DDio {}

void main() {
  MockHttpClient mockHttpClient;
  DogBreedProvider dogBreedProvider;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dogBreedProvider = DogBreedProvider(dioClient: mockHttpClient);
  });

  test('#1 Init with the right states', () {
    expect(dogBreedProvider.data, null);
  });

  group('#2 getBreed()', () {
    test('#2.1 fetch breed successfully', () async {
      final expectedJson = await fixture('breeds.json');
      final jsonMap = json.decode(expectedJson);

      Map<String, dynamic> breed = jsonMap[0];
      Map<String, dynamic> breedMap = {
        'name': (breed['breeds'] as List).length > 0
            ? breed['breeds'][0]['name']
            : '',
        'origin': (breed['breeds'] as List).length > 0
            ? breed['breeds'][0]['origin']
            : '',
        'imgUrl': breed['url'],
      };

      final expectedNumberTrivia = DogBreed.fromMap(breedMap);

      when(mockHttpClient.get(any, options: anyNamed('options')))
          .thenAnswer((_) async => Response(data: jsonMap, statusCode: 200));

      await dogBreedProvider.getBreed();

      expect(dogBreedProvider.data, expectedNumberTrivia);
    });

    test('#2.2 fetch breed failed', () async {
      final expectedNumberTrivia = DogBreed(imgUrl: '', name: '', origin: '');

      when(mockHttpClient.get(any, options: anyNamed('options')))
          .thenThrow(Exception);

      await dogBreedProvider.getBreed();

      expect(dogBreedProvider.data, expectedNumberTrivia);
    });
  });
}
