import 'package:news_app_c15_mon_offline/data/api_service/api_service.dart';
import 'package:news_app_c15_mon_offline/data/datasource_contract/sources_datasource.dart';
import 'package:news_app_c15_mon_offline/data/models/sources_response/Source.dart';
import 'package:news_app_c15_mon_offline/models/category_model.dart';

class SourcesApiDataSourceImpl implements SourcesDataSource {
  late APiService apiService;

  SourcesApiDataSourceImpl({required this.apiService});

  @override
  Future<List<Source>?> getSources(CategoryModel category) async {
    return apiService.getSources(category);
  }
}
