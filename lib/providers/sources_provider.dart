import 'package:flutter/material.dart';
import 'package:news_app_c15_mon_offline/data/api_service/api_service.dart';
import 'package:news_app_c15_mon_offline/data/models/sources_response/Source.dart';
import 'package:news_app_c15_mon_offline/models/category_model.dart';
import 'package:news_app_c15_mon_offline/repository_contract/sources_repo.dart';

class SourcesProvider extends ChangeNotifier{
  SourcesRepo sourcesRepo;
  SourcesProvider({required this.sourcesRepo});
  List<Source> sources = [];
  bool isLoading = true;

  Future<void> fetchSources(CategoryModel category)async{
    isLoading = true;
    notifyListeners();
    sources = await sourcesRepo.getSources(category) ?? [];
    isLoading = false;
    notifyListeners();
  }
}