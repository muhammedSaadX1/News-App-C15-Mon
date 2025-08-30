import 'package:flutter/material.dart';
import 'package:news_app_c15_mon_offline/data/api_service/api_service.dart';
import 'package:news_app_c15_mon_offline/data/models/articles_response/Article.dart' ;
import 'package:news_app_c15_mon_offline/data/models/sources_response/Source.dart';
import 'package:news_app_c15_mon_offline/repository_contract/articles_repo.dart';

class ArticlesProvider extends ChangeNotifier{
  ArticlesRepo articlesRepo;
  ArticlesProvider({required this.articlesRepo});
  List<Article> articles = [];
  bool isLoading = true;

  void fetchArticles(Source source)async{
    isLoading = true;
    notifyListeners();
    articles = await articlesRepo.getArticles(source) ?? [];
 isLoading = false ;

  notifyListeners();

  }
}