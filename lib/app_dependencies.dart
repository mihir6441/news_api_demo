
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_api_demo/repository/news_repository.dart';
import 'package:news_api_demo/repository/news_repository_impl.dart';

import 'api_client/dio_client.dart';

final GetIt _getIt = GetIt.instance;

void setupDependencies() {

  // DIO HTTP Client
  _getIt.registerSingleton<Dio>(DioClient().getDio());


  // NewsAPI
  _getIt.registerSingleton<NewsRepository>(NewsRepositoryImpl());
}
