import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c15_mon_offline/core/colors_manager.dart';

class HomeDrawer extends StatelessWidget {
   HomeDrawer({super.key, required this.onGotoHomeClicked});
  Function onGotoHomeClicked;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 166,
            color: ColorsManager.white,
            child: Text(
              "News App",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding:  REdgeInsets.all(14.0),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    onGotoHomeClicked();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.home_filled, color: ColorsManager.white),
                      SizedBox(width: 4.w),
                      Text(
                        "Go to home",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h,),
                Divider(thickness: 1.h, color: ColorsManager.white),
                SizedBox(height: 24.h,),


                Row(
                  children: [
                    Text("Dark", style: Theme.of(context).textTheme.headlineSmall,),
                    Spacer(),
                    Switch(value: true, onChanged: (isDark){

                    })
                  ],
                ),

                SizedBox(height: 24.h,),
                Divider(thickness: 1.h, color: ColorsManager.white),
                SizedBox(height: 24.h,),

                Row(
                  children: [
                    Text("English", style: Theme.of(context).textTheme.headlineSmall,),
                    Spacer(),
                    Switch(value: true, onChanged: (isEnglish){

                    })
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
