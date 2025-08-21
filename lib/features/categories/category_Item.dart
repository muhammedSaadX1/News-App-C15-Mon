import 'package:flutter/material.dart';
import 'package:news_app_c15_mon_offline/models/category_model.dart';

class CategoryItem extends StatelessWidget {
   CategoryItem({super.key, required this.category, });
  CategoryModel category;


  @override
  Widget build(BuildContext context) {
    return Container(

        child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(category.imagePath)));
  }
}
