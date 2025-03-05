// ignore_for_file: deprecated_member_use, avoid_print

import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/common_widget/custom_form_field.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/customer/customer_review/widget/report_bottom_sheet.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomerReviewScreen extends StatefulWidget {
  const CustomerReviewScreen({super.key});

  @override
  State<CustomerReviewScreen> createState() => _CustomerReviewScreenState();
}

class _CustomerReviewScreenState extends State<CustomerReviewScreen> {
  void _showExpandedBottomSheet() {
    showModalBottomSheet(
      backgroundColor: AppColors.cFFFFFF,
      context: context,
      isScrollControlled: true, // Makes the bottom sheet expandable
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20), // Rounded top corners
        ),
      ),
      builder: (context) {
        return const ReportBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF2F4F7,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.cF2F4F7,
        title: Text(
          "Task Review",
          style:
              TextFontStyle.text17c192A48500robotos.copyWith(fontSize: 22.sp),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
                onTap: () {
                  _showExpandedBottomSheet();
                },
                child: Image.asset(
                  Assets.icons.flagCircle.path,
                  width: 35.w,
                )),
          )
        ],
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              UIHelper.verticalSpace(45.h),
              Text(
                "Thank You For Using OK!",
                style: TextFontStyle.text14c798090w500,
              ),
              UIHelper.verticalSpace(6.h),
              Text(
                "Give a Review",
                style: TextFontStyle.text16c192A48inter700
                    .copyWith(fontSize: 24.sp),
              ),
              UIHelper.verticalSpace(15.h),
              RatingBar.builder(
                unratedColor: AppColors.c000000.withOpacity(0.1),
                initialRating: 3,
                itemSize: 25.sp,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 6,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: AppColors.cFDB022,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              UIHelper.verticalSpace(30.h),
              Row(
                children: [
                  Text(
                    "Detail Review",
                    style: TextFontStyle.text14c444B5Bw500,
                  ),
                ],
              ),
              UIHelper.verticalSpace(8.h),
              Container(
                height: 120.h,
                decoration: BoxDecoration(
                    color: AppColors.cFFFFFF,
                    border:
                        Border.all(width: 1.w, color: AppColors.broderColor),
                    borderRadius: BorderRadius.circular(12.r)),
                child: Padding(
                  padding: EdgeInsets.all(5.sp),
                  child: CommonTextFormField(
                    isPrefixIcon: false,
                    fillColor: AppColors.cFFFFFF,
                    borderColor: Colors.transparent,
                    focusBorderColor: Colors.transparent,
                    textInputStyle: TextFontStyle.text14c444B5Bw500,
                    hintText:
                        "Great job, my boiler pressure problem has been resolved, so I keep coming back to this company!",
                    maxline: 4,
                  ),
                ),
              ),
              UIHelper.verticalSpace(200.h),

              CustomButton(
                onTap: () {
                  Get.bottomSheet(
                    const ReportBottomSheet(),
                  );
                },
                // radius: BorderRadius.circular(111.r),
                // padding: EdgeInsets.symmetric(vertical: 17.h),
                title: 'Discuss issue',
                style: TextFontStyle.text15cFFFFFF500,
                color: AppColors.allPrimaryColor,
              ),
              UIHelper.verticalSpace(80.h),
              // const ReportBottomSheet(),
              CustomButton(
                title: "Submit",
                onTap: () {
                  // NavigationService.navigateTo(Routes.navigationsBarScreen);
                  NavigationService.navigateTo(Routes.navigationsBarScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
