import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:news_app_c15_mon_offline/data/api_service/api_service.dart';
import 'package:news_app_c15_mon_offline/data/datasource_impl/articles_datasource_impl.dart';
import 'package:news_app_c15_mon_offline/data/datasource_impl/sources_api_datasource_impl.dart';
import 'package:news_app_c15_mon_offline/data/models/articles_response/Article.dart';
import 'package:news_app_c15_mon_offline/data/models/sources_response/Source.dart';
import 'package:news_app_c15_mon_offline/data/repository_impl/articles_repo_impl.dart';
import 'package:news_app_c15_mon_offline/data/repository_impl/sources_repo_impl.dart';
import 'package:news_app_c15_mon_offline/features/articles/article_item.dart';
import 'package:news_app_c15_mon_offline/models/category_model.dart';
import 'package:news_app_c15_mon_offline/providers/articles_provider.dart';
import 'package:news_app_c15_mon_offline/providers/sources_provider.dart';
import 'package:provider/provider.dart';

import '../../core/colors_manager.dart';

class SourcesView extends StatefulWidget {
  SourcesView({super.key, required this.category});

  CategoryModel category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourcesProvider sourcesProvider;
  late ArticlesProvider articlesProvider;

  void fetchData() async {
    sourcesProvider = SourcesProvider(
      sourcesRepo: SourcesRepoImpl(
        sourcesDataSource: SourcesApiDataSourceImpl(apiService: APiService()),
      ),
    );
    articlesProvider = ArticlesProvider(articlesRepo: ArticlesRepoImpl(articlesDataSource: ArticlesApiDataSourceImpl(apiService: APiService())));
    await sourcesProvider.fetchSources(widget.category);
    articlesProvider.fetchArticles(sourcesProvider.sources[0]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // return MultiProvider(providers: [
    //   ChangeNotifierProvider.value(value: sourcesProvider),
    //   ChangeNotifierProvider.value(value: articlesProvider),
    // ],
    //   child: Column(
    //     children: [
    //       Consumer<SourcesProvider>(
    //         builder: (context, sourcesProvider, child) {
    //           return DefaultTabController(
    //             length: sourcesProvider.sources.length,
    //             child: TabBar(
    //               onTap: (index){
    //                 articlesProvider.fetchArticles(sourcesProvider.sources[index]);
    //               },
    //               tabAlignment: TabAlignment.start,
    //               isScrollable: true,
    //               indicatorColor: ColorsManager.white,
    //               dividerColor: Colors.transparent,
    //               unselectedLabelStyle: GoogleFonts.inter(
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.w500,
    //                 fontSize: 14,
    //               ),
    //               labelStyle: GoogleFonts.inter(
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 16,
    //               ),
    //               tabs: sourcesProvider.sources
    //                   .map((source) => Tab(text: source.name))
    //                   .toList(),
    //             ),
    //           );
    //         },
    //       ),
    //       Consumer<ArticlesProvider>(
    //           builder: (context, articlesProvider, child) {
    //             return Expanded(child: ListView.builder(
    //               itemBuilder: (context, index) =>
    //                   ArticleItem(article: articlesProvider.articles[index]),
    //               itemCount: articlesProvider.articles.length,),);
    //           })
    //     ],
    //   ),
    //
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: sourcesProvider),
        ChangeNotifierProvider.value(value: articlesProvider),
      ],
      child: Column(
        children: [
          Consumer<SourcesProvider>(
            builder: (context, sourcesProvider, child) {
              return sourcesProvider.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : DefaultTabController(
                      length: sourcesProvider.sources.length,
                      child: TabBar(
                        onTap: (index) {
                          articlesProvider.fetchArticles(
                            sourcesProvider.sources[index],
                          );
                        },
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        indicatorColor: ColorsManager.white,
                        dividerColor: Colors.transparent,
                        unselectedLabelStyle: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        labelStyle: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        tabs: sourcesProvider.sources
                            .map((source) => Tab(text: source.name))
                            .toList(),
                      ),
                    );
            },
          ),
          Consumer<ArticlesProvider>(
            builder: (context, articlesProvider, child) {
              return Expanded(
                child: articlesProvider.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemBuilder: (context, index) => ArticleItem(
                          article: articlesProvider.articles[index],
                        ),
                        itemCount: articlesProvider.articles.length,
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
