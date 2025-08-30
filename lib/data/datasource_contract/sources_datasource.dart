import 'package:news_app_c15_mon_offline/data/models/sources_response/Source.dart';
import 'package:news_app_c15_mon_offline/models/category_model.dart';

abstract class SourcesDataSource {
  Future<List<Source>?> getSources(CategoryModel category);
}
