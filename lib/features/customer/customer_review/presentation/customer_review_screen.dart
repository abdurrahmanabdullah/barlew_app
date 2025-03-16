// ignore_for_file: deprecated_member_use, avoid_print

import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/common_widget/custom_form_field.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/customer/customer_review/widget/report_bottom_sheet.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CustomerReviewScreen extends StatefulWidget {
  const CustomerReviewScreen({super.key});

  @override
  State<CustomerReviewScreen> createState() => _CustomerReviewScreenState();
}

class _CustomerReviewScreenState extends State<CustomerReviewScreen> {
  bool isLoading = false;
  double _selectedRating = 0.0;
  final TextEditingController reviewcontroller = TextEditingController();
  Future<bool> submitreview() async {
    try {
      setState(() {
        isLoading = true; // Start loading when form submission begins
      });
      await customerRatingRXobj
          .customerRatingRX(
              userID: 3,
              rating: _selectedRating.toInt(),
              review: reviewcontroller.text)
          .then((value) {
        setState(() {
          isLoading = false;
        });
      });
      return true;
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ToastUtil.showShortToast(e.toString());
      return false;
    }
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
                  // _showExpandedBottomSheet();
                  Get.bottomSheet(
                    const ReportBottomSheet(),
                  );
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
        child: Stack(children: [
          SingleChildScrollView(
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
                  initialRating: 0,
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
                    setState(() {
                      _selectedRating = rating; // Store the selected rating
                    });
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
                      controller: reviewcontroller,
                      isPrefixIcon: false,
                      fillColor: AppColors.cFFFFFF,
                      borderColor: Colors.transparent,
                      focusBorderColor: Colors.transparent,
                      textInputStyle: TextFontStyle.text14c444B5Bw500,
                      hintText: "Write Review.....",
                      maxline: 4,
                    ),
                  ),
                ),
                UIHelper.verticalSpace(200.h),

                // const ReportBottomSheet(),
                CustomButton(
                  title: "Submit",
                  onTap: () async {
                    if (_selectedRating < 1) {
                      ToastUtil.showShortToast(
                          "Please select minimum one rating.");
                      return;
                    }

                    bool isSuccess = await submitreview();
                    if (isSuccess) {
                      // Show success message
                      ToastUtil.showShortToast(
                          "Review submitted successfully!");
                      NavigationService.navigateTo(Routes.navigationsBarScreen);
                    }
                  },
                )
              ],
            ),
          ),
          if (isLoading)
            const Positioned.fill(
              child: Center(
                child: SpinKitCircle(
                  color: Colors.yellow,
                  size: 50.0,
                ),
              ),
            ),
        ]),
      ),
    );
  }
}
