import 'package:flutter/material.dart';
import 'package:news_app_c15_mon_offline/core/assets_manager.dart';
import 'package:news_app_c15_mon_offline/core/colors_manager.dart';

class CategoryModel{
  String name;
  String imagePath;
  String id;


  CategoryModel({required this.id, required this.name, required this.imagePath, });

static List<CategoryModel> categories = [
  CategoryModel(id: "general", name: "General", imagePath: ImageAssets.general,  ),
  CategoryModel(id: "business", name: "Business", imagePath: ImageAssets.business,  ),
  CategoryModel(id: "sports", name: "Sports", imagePath: ImageAssets.sports,  ),
  CategoryModel(id: "health", name: "Health", imagePath: ImageAssets.health,  ),
  CategoryModel(id: "science", name: "Science", imagePath: ImageAssets.science,  ),
  CategoryModel(id: "technology", name: "Technology", imagePath: ImageAssets.tech,  ),
  CategoryModel(id: "entertainment", name: "Entertainment", imagePath: ImageAssets.entertainment,  ),
];

}