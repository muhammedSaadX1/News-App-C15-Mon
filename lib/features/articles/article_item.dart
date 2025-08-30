import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_c15_mon_offline/core/assets_manager.dart';
import 'package:news_app_c15_mon_offline/core/colors_manager.dart';
import 'package:news_app_c15_mon_offline/data/models/articles_response/Article.dart' show Article;

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
            CachedNetworkImage(
              imageUrl:article.urlToImage ?? "",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(height: 10.h,),
            Text(article.title ?? "", style: GoogleFonts.inter(fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.white),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text(article.author ?? "", textAlign: TextAlign.start,style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: ColorsManager.grey),))
               , Expanded(child: Text(article.publishedAt ?? "", textAlign: TextAlign.end,style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: ColorsManager.grey),))
              ],
            )
          ]

      ),
    );
  }
}
