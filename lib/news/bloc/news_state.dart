part of 'news_bloc.dart';

class NewsState {
  final bool isLoading;
  final bool isCompleted;
  final String? message;
  final NewsApiResponse? newsApiResponse;

  NewsState({
    this.isLoading = true,
    this.isCompleted = false,
    this.message,
    this.newsApiResponse,
  });
}
