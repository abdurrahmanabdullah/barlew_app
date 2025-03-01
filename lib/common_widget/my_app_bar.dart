
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

import '../constant/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import '../helpers/ui_helpers.dart';

class MyAppBar extends StatelessWidget {
  final void Function() notificationTap;
  final void Function() chatTap;
  final void Function() languageTap;
  const MyAppBar(
      {super.key,
      required this.notificationTap,
      required this.chatTap,
      required this.languageTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.cC3E5AE,
              borderRadius: BorderRadius.circular(4.41.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
            child: Column(
              children: [
                Text(
                  "อบต.รอ่ งเคาะ",
                  style: TextFontStyle.text32allPrimaryColorw600
                      .copyWith(fontSize: 18.sp),
                ),
                Text(
                  "Waste Bank Tool".tr,
                  style:
                      TextFontStyle.text20c34A353w600.copyWith(fontSize: 10.sp),
                )
              ],
            ),
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: notificationTap,
              child: Container(
                width: 38.w,
                height: 36.h,
                decoration: const BoxDecoration(
                    color: AppColors.allPrimaryColor, shape: BoxShape.circle),
                child: Padding(
                  padding: EdgeInsets.all(6.sp),
                  child: Center(
                    child: Image.asset(
                      Assets.icons.notification.path,
                    ),
                  ),
                ),
              ),
            ),
            UIHelper.horizontalSpace(10.w),
            GestureDetector(
              onTap: chatTap,
              child: Container(
                width: 38.w,
                height: 36.h,
                decoration: const BoxDecoration(
                    color: AppColors.allPrimaryColor, shape: BoxShape.circle),
                child: Padding(
                  padding: EdgeInsets.all(6.sp),
                  child: Center(
                    child: Image.asset(
                      Assets.icons.chat.path,
                    ),
                  ),
                ),
              ),
            ),
            UIHelper.horizontalSpace(10.w),
            GestureDetector(
              onTap: languageTap,
              child: Container(
                width: 70.w,
                height: 36.h,
                decoration: BoxDecoration(
                    color: AppColors.allPrimaryColor,
                    borderRadius: BorderRadius.circular(60.r)),
                child: Padding(
                  padding: EdgeInsets.all(6.sp),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.icons.internet.path,
                        ),
                        UIHelper.horizontalSpace(4.w),
                        Text(
                          "En",
                          style: TextFontStyle.text16cFFFFFFw600,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
