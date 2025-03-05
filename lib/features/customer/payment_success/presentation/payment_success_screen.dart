import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF2F4F7,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.cF2F4F7,
        title: Text(
          "Payment Successful",
          style:
              TextFontStyle.text17c192A48500robotos.copyWith(fontSize: 22.sp),
        ),
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                UIHelper.verticalSpace(150.h),
                Image.asset(
                  Assets.images.paymentSuccess.path,
                  width: 178,
                  height: 142,
                ),
                UIHelper.verticalSpace(16.h),
                Text(
                  "Congratulation",
                  style: TextFontStyle.text22c192A48w600roboto
                      .copyWith(fontSize: 32.sp),
                ),
                UIHelper.verticalSpace(250.h),
                CustomButton(
                  title: "Back to Home",
                  onTap: () {
                    NavigationService.navigateTo(Routes.customerReviewScreen);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
