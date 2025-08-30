import 'package:news_app_c15_mon_offline/data/datasource_contract/articles_datasource.dart';
import 'package:news_app_c15_mon_offline/data/models/articles_response/Article.dart';
import 'package:news_app_c15_mon_offline/data/models/sources_response/Source.dart';
import 'package:news_app_c15_mon_offline/repository_contract/articles_repo.dart';

class ArticlesRepoImpl implements ArticlesRepo{
  ArticlesDataSource articlesDataSource;
  ArticlesRepoImpl({required this.articlesDataSource});
  @override
  Future<List<Article>?> getArticles(Source source) {
  return  articlesDataSource.getArticles(source);
  }

}