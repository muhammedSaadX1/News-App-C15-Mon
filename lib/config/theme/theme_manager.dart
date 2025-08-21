import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_c15_mon_offline/core/colors_manager.dart';

class ThemeManager {
  static final ThemeData light = ThemeData();
  static final ThemeData dark = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorsManager.black,
      foregroundColor: ColorsManager.white,
      iconTheme: IconThemeData(color: ColorsManager.white),
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        color: ColorsManager.white,
        fontWeight: FontWeight.w500,
      ),
    ),
    scaffoldBackgroundColor: ColorsManager.black,
    drawerTheme: DrawerThemeData(backgroundColor: ColorsManager.black),

    iconTheme: IconThemeData(color: ColorsManager.white),

    textTheme: TextTheme(
      headlineMedium: GoogleFonts.inter(
        fontSize: 24.sp,
        color: ColorsManager.black,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 20.sp,
        color: ColorsManager.white,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.inter(fontSize: 24, color: ColorsManager.white, fontWeight: FontWeight.w500)
    ),
  );
}
