import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.cFFFFFF,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'Task Review',
          style:
              TextFontStyle.text20cprimarycolorw500.copyWith(fontSize: 22.sp),
        ),
      ),
      backgroundColor: AppColors.cFFFFFF,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 330,
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
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(
                          Assets.images.chatScreenHeaderImage.path,
                          width: 60.w,
                        ),
                      ),
                      UIHelper.horizontalSpace(12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Boiler Fault Service",
                            style: TextFontStyle.text145192A48w500roboto
                                .copyWith(fontSize: 16.sp),
                          ),
                          UIHelper.verticalSpace(4.h),
                          Text("26/12/2024 . 17:27h",
                              style: TextFontStyle.text14c3B4252robotow400),
                        ],
                      )
                    ],
                  ),
                  UIHelper.verticalSpace(22.h),
                  Text(
                    "20 min",
                    style: TextFontStyle.text36c1768B7robotow700,
                  ),
                  Text(
                    "Time limit of call",
                    style: TextFontStyle.text16c515868roboto2w400,
                  ),
                  UIHelper.verticalSpace(40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 2.w,
                                    color: AppColors.allPrimaryColor)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.r),
                                child: Image.asset(
                                  Assets.icons.reperMan.path,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          UIHelper.horizontalSpace(12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Refrigerator Repair",
                                style: TextFontStyle.text145192A48w500roboto
                                    .copyWith(fontSize: 16.sp),
                              ),
                              UIHelper.verticalSpace(4.h),
                              Text("Milan Jack",
                                  style: TextFontStyle.text14c3B4252robotow400),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                // NavigationService.navigateTo(Routes.callScreen);
                                NavigationService.navigateTo(
                                    Routes.customerReviewScreen);
                              },
                              child: Image.asset(
                                Assets.icons.audiocallCircle.path,
                                width: 30.w,
                              )),
                          UIHelper.horizontalSpace(10.w),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              Assets.icons.videocallCircle.path,
                              width: 30.w,
                            ),
                          ),
                          UIHelper.horizontalSpace(10.w),
                          GestureDetector(
                            onTap: () {
                              NavigationService.navigateTo(
                                  Routes.messengingScreen);
                            },
                            child: Image.asset(
                              Assets.icons.chatCircle.path,
                              width: 30.w,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
