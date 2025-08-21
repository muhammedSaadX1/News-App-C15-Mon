import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c15_mon_offline/core/colors_manager.dart';
import 'package:news_app_c15_mon_offline/models/category_model.dart';

import 'category_Item.dart';

class CategoriesView extends StatelessWidget {
   CategoriesView({super.key, required
  this.onCategoryClicked});

  Function onCategoryClicked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Good Morning\nHere is Some News For You", style: Theme
            .of(context)
            .textTheme
            .titleMedium,),
        SizedBox(height: 16.h,),


        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index)=> SizedBox(height: 8.h,),
            itemBuilder: (context, index) =>
              InkWell(
                  onTap: (){
                    onCategoryClicked(CategoryModel.categories[index]);
                  },
                  child: CategoryItem(category: CategoryModel.categories[index], )),
            itemCount: CategoryModel.categories.length,),
        )
      ],
    );
  }
}
