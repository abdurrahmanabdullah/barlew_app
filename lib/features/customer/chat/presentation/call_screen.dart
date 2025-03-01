import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 410,
            decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.r),
                    topRight: Radius.circular(22.r)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x263B8CDB),
                    blurRadius: 40,
                    offset: Offset(0, -2),
                    spreadRadius: 0,
                  )
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  UIHelper.verticalSpace(24.h),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(150.r),
                      child: Image.asset(
                        Assets.icons.reperMan.path,
                        fit: BoxFit.cover,
                        width: 100.w,
                      )),
                  UIHelper.verticalSpace(16.h),
                  Column(
                    children: [
                      Text(
                        "Milan Jack",
                        style: TextFontStyle.text145192A48w500roboto
                            .copyWith(fontSize: 16.sp),
                      ),
                      Text("Plumber Engineer",
                          style: TextFontStyle.text14c3B4252robotow400),
                    ],
                  ),
                  UIHelper.verticalSpace(34.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        Assets.icons.mute1.path,
                        width: 48.w,
                      ),
                      UIHelper.horizontalSpace(35.w),
                      Image.asset(
                        Assets.icons.riniging.path,
                        width: 115.w,
                      ),
                      UIHelper.horizontalSpace(35.w),
                      Image.asset(
                        Assets.icons.speaker.path,
                        width: 48.w,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
