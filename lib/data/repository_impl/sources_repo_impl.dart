import 'package:news_app_c15_mon_offline/data/api_service/api_service.dart';
import 'package:news_app_c15_mon_offline/data/datasource_contract/sources_datasource.dart';
import 'package:news_app_c15_mon_offline/data/datasource_impl/sources_api_datasource_impl.dart';
import 'package:news_app_c15_mon_offline/data/models/sources_response/Source.dart';
import 'package:news_app_c15_mon_offline/models/category_model.dart';
import 'package:news_app_c15_mon_offline/repository_contract/sources_repo.dart';

class SourcesRepoImpl extends SourcesRepo{
  late SourcesDataSource sourcesDataSource;
  SourcesRepoImpl({required this.sourcesDataSource});
  @override
  Future<List<Source>?> getSources(CategoryModel category) {
    return sourcesDataSource.getSources(category);
  }
  
}