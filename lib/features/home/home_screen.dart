import 'package:flutter/material.dart';
import 'package:news_app_c15_mon_offline/features/home/home_drawer.dart';
import 'package:news_app_c15_mon_offline/models/category_model.dart';

import '../categories/categories_view.dart';
import '../sources/sources_view.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 late  Widget homeView = CategoriesView(onCategoryClicked: onCategoryClicked,);

void onCategoryClicked(CategoryModel selectedCategory){
  homeView = SourcesView(category: selectedCategory,);
  setState(() {

  });
}

void onGotoHomeClicked(){
  homeView = CategoriesView(onCategoryClicked: onCategoryClicked);
  Navigator.pop(context);
  setState(() {

  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: HomeDrawer(onGotoHomeClicked: onGotoHomeClicked,),
        body: homeView

    );
  }
}
