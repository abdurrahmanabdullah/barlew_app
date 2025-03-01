import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Notification',
          style: TextFontStyle.text22c192A48w600roboto,
        ),
      ),
      backgroundColor: AppColors.cFFFFFF,
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 11,
          itemBuilder: (_,indext){
        return    Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(Assets.images.boy.path),
                        radius: 25,
                      ),
                      const Positioned(
                        right: 0, // Adjusted for better alignment
                        top: 0, // Position at bottom-right
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: AppColors.c35BA0C,
                        ),
                      ),
                    ],
                  ),
                  UIHelper.horizontalSpace(11.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ralph Edwards',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextFontStyle.text145192A48w500roboto,
                        ),
                        UIHelper.verticalSpace(5.h),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elitdolor sit amet, consectetur adipiscing elit.0 hi my name  ',
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: TextFontStyle.text11c9499A6w400roboto,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            UIHelper.horizontalSpace(18.w),
            Expanded(
              flex: 1,
              child: Text(
                '26/9/2024',
                overflow: TextOverflow.ellipsis,
                style: TextFontStyle.text12cAFB3BCw400roboto,
              ),
            ),
          ],
        );
      }, separatorBuilder: (BuildContext context, int index) {
          return UIHelper.verticalSpace(15.h);
      },),

    );
  }
}
