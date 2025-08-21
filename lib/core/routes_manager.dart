import 'package:flutter/cupertino.dart';
import 'package:news_app_c15_mon_offline/features/home/home_screen.dart';

class RoutesManager{
  static const String home ="/route";


  static Map<String, WidgetBuilder> routes = {
    home : (_)=> HomeScreen()
  };
}