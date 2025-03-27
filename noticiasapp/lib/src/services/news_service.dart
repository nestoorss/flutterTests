import 'package:flutter/material.dart';
import 'package:noticiasapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = "newsapi.org";
final _APIKEY = "6d9279eb280d4104bb7d77e5026a76c4";

class NewsService with ChangeNotifier {

  List<Article> headlines = [];

  NewsService() {
    this.getTopHeadLines();
  }

  getTopHeadLines() async {
    var uri = Uri.https(
      _URL_NEWS,
      '/v2/top-headlines',
      {
        'country': 'us',
        'apiKey': _APIKEY,
      },
    );
    final resp = await http.get(uri);

    final newsResponse = NewsResponse.fromJson(resp.body);

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

}