import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../helpers/all_routes.dart';

class TaskHistoryScreen extends StatefulWidget {
  const TaskHistoryScreen({super.key});

  @override
  State<TaskHistoryScreen> createState() => _TaskHistoryScreenState();
}

class _TaskHistoryScreenState extends State<TaskHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(
          'History',
          style: TextFontStyle.text20cprimarycolorw500,
        ),


      ),
      ///////<<<<<<<<<<<<<< APPBar End here >>>>>>>>>>>>>>>>>>>>>>>>>>>>>///////
      backgroundColor: AppColors.cFFFFFF,
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 22,horizontal: 12),

        scrollDirection: Axis.vertical,
        shrinkWrap: true,

        itemBuilder: (_,indext){

        return             Container(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(11.r),
            border: Border.all(color: AppColors.broderColor, width: 1),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Repair and Service Plumbers',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:  TextFontStyle.text16c192A48inter700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(Assets.icons.group10.path,height: 22.h,),
                    ),

                  ],
                ),
                /// Repair and Service Plumbers:: end  here//////

                UIHelper.verticalSpace(16.h),
                Row(
                  children: [

                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        Assets.icons.clender.path,
                        height: 22.h,
                      ),
                    ),


                    Expanded(
                      child: Text(
                          '5.00 PM - 11.00 PM, Jan 1',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextFontStyle.text14c192A48400
                      ),
                    ),
                    CustomButton(
                      // color: AppColors.allPrimaryColor,
                      color: const Color(0xFF104190),
                      onTap: (){
                        NavigationService.navigateTo(Routes.historyDetailsScreen);
                      },
                      title: 'DETAILS',
                      style: TextFontStyle.text15cFFFFFF500,
                      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 11.w),
                      radius:BorderRadius.circular(11.r),)
                  ],
                ),


              ],
            ),
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) {
        return UIHelper.verticalSpace(17.h);
      }, itemCount: 22,
                  ////<<<<<<<<<<<<<<<<  mane container end here >>>>>>>>>>>>>>>>>>>>>>>  /////
      ),
    );
  }
}
