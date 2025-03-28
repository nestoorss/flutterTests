import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticiasapp/src/models/category_model.dart';
import 'package:noticiasapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = "newsapi.org";
final _APIKEY = "6d9279eb280d4104bb7d77e5026a76c4";

class NewsService with ChangeNotifier {

  List<Article> headlines = [];
  String _selectedCategory = "business";

  bool _isLoading = true;

  List<Category> categories = [
    Category(FontAwesomeIcons.building, "business"),
    Category(FontAwesomeIcons.tv, "entertainment"),
    Category(FontAwesomeIcons.addressCard, "general"),
    Category(FontAwesomeIcons.headSideVirus, "health"),
    Category(FontAwesomeIcons.vials, "science"),
    Category(FontAwesomeIcons.volleyball, "sports"),
    Category(FontAwesomeIcons.memory, "technology")
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    this.getTopHeadLines();

    categories.forEach((item) {
      this.categoryArticles[item.name] = <Article>[];
    });

    this.getArticlesByCategory( this._selectedCategory );
  }

  bool get isLoading => this._isLoading;

  String get selectedCategory => this._selectedCategory;
  set selectedCategory(String valor) {
    this._selectedCategory = valor;
    this._isLoading = true;
    this.getArticlesByCategory( valor );
    notifyListeners();
  }
  List<Article> get getArticulosCategoriaSeleccionada => this.categoryArticles[this.selectedCategory]!;

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

  getArticlesByCategory(String category) async {

    if (this.categoryArticles[category]!.isNotEmpty) {
      this._isLoading = false;
      notifyListeners();
      return;
    }

    var uri = Uri.https(
      _URL_NEWS,
      '/v2/top-headlines',
      {
        'country': 'us',
        'apiKey': _APIKEY,
        'category': category
      },
    );
    final resp = await http.get(uri);

    final newsResponse = NewsResponse.fromJson(resp.body);

    this.categoryArticles[category]!.addAll(newsResponse.articles);
    this._isLoading = false;
    notifyListeners();
  }

}