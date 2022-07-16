
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:news_api_demo/model/News_api_response.dart';
import 'package:news_api_demo/repository/news_repository.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final _newsRepository = GetIt.I<NewsRepository>();

  NewsBloc() : super(NewsState()) {
    on<NewsListEvent>(_getNewsList);
  }

  void _getNewsList(NewsListEvent event, Emitter<NewsState> emit) async {
    emit(NewsState(isLoading: true));
    final response = await _newsRepository.newsList();
    emit(NewsState(isLoading: false, isCompleted: true, newsApiResponse: response));
  }
}
