import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:https_project/authentication/ui/city_selection_page.dart';
import 'package:https_project/news/news_bloc.dart';
import 'package:https_project/news/news_repository.dart';
import 'package:https_project/news/news_page.dart';

void main() {
  runApp(
    BlocProvider<NewsBloc>(
      create: (_) => NewsBloc(NewsRepository()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Selection',
      home: CitySelectionPage(),
      routes: {
        '/news': (context) => NewsPage(), 
      },
    );
  }
}
