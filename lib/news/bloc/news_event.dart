part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}
class NewsListEvent extends NewsEvent {
  NewsListEvent();
}

