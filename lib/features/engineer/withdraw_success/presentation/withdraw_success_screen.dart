import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithdrawSuccessScreen extends StatefulWidget {
  const WithdrawSuccessScreen({super.key});

  @override
  State<WithdrawSuccessScreen> createState() => _WithdrawSuccessScreenState();
}

class _WithdrawSuccessScreenState extends State<WithdrawSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF2F4F7,
      
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
                    NavigationService.navigateTo(Routes.engineerNavigationsBarScreen);
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
