import 'package:news_app_c15_mon_offline/data/models/articles_response/Article.dart';
import 'package:news_app_c15_mon_offline/data/models/sources_response/Source.dart';

abstract class ArticlesDataSource{
  Future<List<Article>?>getArticles(Source source);
}