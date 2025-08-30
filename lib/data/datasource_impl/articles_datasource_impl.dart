import 'package:news_app_c15_mon_offline/data/api_service/api_service.dart';
import 'package:news_app_c15_mon_offline/data/datasource_contract/articles_datasource.dart';
import 'package:news_app_c15_mon_offline/data/models/articles_response/Article.dart';
import 'package:news_app_c15_mon_offline/data/models/sources_response/Source.dart';

class ArticlesApiDataSourceImpl implements ArticlesDataSource{

  APiService apiService;
  ArticlesApiDataSourceImpl({required this.apiService});

  @override
  Future<List<Article>?> getArticles(Source source) {
  return  apiService.getArticles(source);
  }

}