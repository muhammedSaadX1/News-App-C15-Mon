import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_c15_mon_offline/core/assets_manager.dart';
import 'package:news_app_c15_mon_offline/core/colors_manager.dart';
import 'package:news_app_c15_mon_offline/models/article.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem({super.key, required this.article});

  Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorsManager.white, width: 2)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(ImageAssets.entertainment),
            SizedBox(height: 10.h,),
            Text(article.title, style: GoogleFonts.inter(fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.white),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(article.author, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: ColorsManager.grey),)
               , Text(article.publishedAt, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: ColorsManager.grey),)
              ],
            )
          ]

      ),
    );
  }
}
