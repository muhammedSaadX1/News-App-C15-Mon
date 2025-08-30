import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c15_mon_offline/data/models/articles_response/Article.dart';
import 'package:news_app_c15_mon_offline/data/models/articles_response/ArticlesResponse.dart';
import 'package:news_app_c15_mon_offline/data/models/sources_response/Source.dart';
import 'package:news_app_c15_mon_offline/data/models/sources_response/SourcesResponse.dart';
import 'package:news_app_c15_mon_offline/models/category_model.dart';

///https://newsapi.org/v2/everything?apiKey=81c62801f53e43ad82e8854d02375bcb&sources=medical-news-today
class APiService {
  static const String apiKey = "81c62801f53e43ad82e8854d02375bcb";
  static const String baseUrl = "newsapi.org";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndPoint = "/v2/everything";

   Future<List<Source>?>getSources(CategoryModel category)async {
    Uri url = Uri.https(baseUrl, sourcesEndPoint, {
      "apiKey": apiKey,
      "category": category.id,
    });
   http.Response serverResponse = await  http.get(url);

   var json = jsonDecode(serverResponse.body);
   SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
   return sourcesResponse.sources ;

  }


   Future<List<Article>?> getArticles(Source source)async{
    Uri url = Uri.https(baseUrl, articlesEndPoint, {
      "apiKey":apiKey,
      "sources":source.id
    });
   http.Response serverResponse = await  http.get(url);
   var json = jsonDecode(serverResponse.body);
   ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
   return articlesResponse.articles;
  }
}
