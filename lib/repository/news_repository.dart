import 'package:news_api_demo/model/News_api_response.dart';

abstract class NewsRepository {
  Future<NewsApiResponse> newsList();
}
