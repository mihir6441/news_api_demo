import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_api_demo/model/News_api_response.dart';

import 'news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  final _dio = GetIt.I<Dio>();

  @override
  Future<NewsApiResponse> newsList() async {
    final response =
        await _dio.get('/everything?q=india&from=2022-06-04&sortBy=publishedAt&apiKey=5aec5c70cf7d460083223fdebbce4a0c');
    final newsResponse = NewsApiResponse.fromJson(response.data);
    return newsResponse;
  }
}
