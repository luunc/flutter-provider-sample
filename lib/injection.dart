import 'package:dio/dio.dart';
import 'package:dxdart/providers/user_login_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

import 'providers/dog_breed_provider.dart';
import 'core/network/d_dio.dart';
import 'core/network/network_info.dart';

final getIt = GetIt.instance;

Future<void> configureInjection() async {
  getIt.registerSingleton<Dio>(Dio());

  getIt
      .registerSingleton<NetworkInfo>(NetworkInfoImpl(DataConnectionChecker()));

  getIt.registerSingleton<DDio>(
      DDio(networkInfo: getIt<NetworkInfo>(), dio: getIt<Dio>()));

  getIt.registerSingleton<DogBreedProvider>(
      DogBreedProvider(dioClient: getIt<DDio>()));

  getIt.registerSingleton<UserLoginProvider>(UserLoginProvider());
}
