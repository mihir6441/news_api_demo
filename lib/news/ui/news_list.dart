// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_demo/news/bloc/news_bloc.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({Key? key}) : super(key: key);

  static Widget create() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (BuildContext context) => NewsBloc(),
        ),
      ],
      child: const NewsListScreen(),
    );
  }

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(NewsListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<NewsBloc, NewsState>(
          listener: (context, state) {
            if(state.isCompleted){
              print('is completed');
            }
          },
          child: BlocBuilder<NewsBloc, NewsState>(builder: (_, state) {
            return state.isLoading
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                        color: Colors.red,
                      ),
                  ],
                )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state.newsApiResponse?.articles?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(state.newsApiResponse?.articles?[index].title ?? ''),
                      );
                    });
          })),
    );
  }
}
