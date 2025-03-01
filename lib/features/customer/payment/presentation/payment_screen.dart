import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment",
          style:
              TextFontStyle.text17c192A48500robotos.copyWith(fontSize: 22.sp),
        ),
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            UIHelper.verticalSpace(60.h),
            ////////////////////           Paypal Logo             ///////////////////////////
            Container(
              decoration: BoxDecoration(
                  color: AppColors.cEAF3FC,
                  borderRadius: BorderRadius.circular(12.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Assets.images.paypalLogo.path,
                          width: 48.w,
                          height: 12.h,
                        ),
                        UIHelper.horizontalSpace(10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Paypal",
                              style: TextFontStyle.text14c171725w600,
                            ),
                            Text(
                              "********90989",
                              style: TextFontStyle.text14c171725w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Radio<double>(
                      activeColor: AppColors.allPrimaryColor,
                      value: 1,
                      onChanged: (value) {},
                      groupValue: 1,
                    ),
                  ],
                ),
              ),
            ),
            UIHelper.verticalSpace(420.h),
            ////////////////////////<<<<<<<<<<<   Total Service Fee   >>>>>>>>>>>>>>///////////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Service Fee",
                  style: TextFontStyle.text22c192A48w600roboto
                      .copyWith(fontSize: 18.sp),
                ),
                Row(
                  children: [
                    Text(
                      "\$",
                      style: TextFontStyle.text22c192A48w600roboto
                          .copyWith(fontSize: 18.sp),
                    ),
                    Text(
                      "40",
                      style: TextFontStyle.text145192A48w500roboto
                          .copyWith(fontSize: 16.sp),
                    ),
                  ],
                ),
              ],
            ),
            UIHelper.verticalSpace(25.h),
            /////////////////////////<<<<<<<<<<   Proceed to Checkout   >>>>>>>>>>>>>//////////////////////////////////////////
            CustomButton(
              title: "Proceed to Checkout",
              onTap: () {
                NavigationService.navigateTo(Routes.paymentMethod);
              },
            )
          ],
        ),
      ),
    );
  }
}
