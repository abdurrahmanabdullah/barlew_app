import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EngineerChatScreen extends StatefulWidget {
  const EngineerChatScreen({super.key});

  @override
  State<EngineerChatScreen> createState() => _EngineerChatScreenState();
}

class _EngineerChatScreenState extends State<EngineerChatScreen> {
  String formattedTime = DateFormat('EEEE h:mm a').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF2F4F7,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Chat",
          style:
              TextFontStyle.text145192A48w500roboto.copyWith(fontSize: 24.sp),
        ),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              Assets.icons.search.path,
              width: 24.w,
            ),
          ),
          UIHelper.horizontalSpace(12.w),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              Assets.icons.threedot.path,
              width: 24.w,
            ),
          ),
          UIHelper.horizontalSpace(16.w)
        ],
        backgroundColor: AppColors.cF2F4F7,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 1.h,
              color: AppColors.cDBDBDB,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 24.h),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                NavigationService.navigateTo(
                                    Routes.engineerMessenging);
                              },
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(150.r),
                                    //////////////////     Profile Image    /////////////////////////
                                    child: Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzlgkW4Pw3K12ArgCSBkFdQ3UiDFZFpZ_7Ew&s",
                                      width: 45.w,
                                      height: 45.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  UIHelper.horizontalSpace(20.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Henry Johnson",
                                                style: TextFontStyle
                                                    .text16c192A48inter700,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(
                                              formattedTime,
                                              style: TextFontStyle
                                                  .text12c798090w00,
                                            ),
                                          ],
                                        ),
                                        UIHelper.verticalSpace(5.h),
                                        Text(
                                          "You: Hello Tom ! I will invest \$2000 on your",
                                          style:
                                              TextFontStyle.text14c3D4454w400,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            UIHelper.verticalSpace(16.h),
                            ////////////////////  when connect api please do this for last index divider hide   ///////////////
                            // index == list.length-1
                            //     ? SizedBox()
                            //     :
                            index == 9
                                ? const SizedBox()
                                : Container(
                                    width: double.infinity,
                                    height: 1.h,
                                    color: AppColors.cDBDBDB,
                                  ),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
