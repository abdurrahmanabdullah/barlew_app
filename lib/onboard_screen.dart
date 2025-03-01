import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'common_widget/custom_button.dart';
import 'constant/text_font_style.dart';
import 'gen/assets.gen.dart';
import 'helpers/ui_helpers.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ////// <<<<<<<<<<<<<<Splash Image start here >>>>>>>>>>>>>>>>>>>>>>>>>>>?//////
            Container(
              width: 127.w,
              height: 127.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.images.splashImage.path),
                    fit: BoxFit.cover),
              ),
            ),
            ////// <<<<<<<<<<<<<<Splash Image end here >>>>>>>>>>>>>>>>>>>>>>>>>>>?//////

            UIHelper.verticalSpace(60.h),
            //// <<<<<<<<<<<<  mane text start here >>>>>>>>>>>>>>>//////////////////////////
            Center(
              child: Text('Are you Engineer or Customer?',
                  textAlign: TextAlign.center, // Text alignment
                  style: TextFontStyle.text25allPrimaryColorTextw700),
            ),
            //// <<<<<<<<<<<<  mane text end here >>>>>>>>>>>>>>>//////////////////////////

            UIHelper.verticalSpace(32.h),
            //////// Customer Button start here ///////////////
            CustomButton(
              onTap: () {
                NavigationService.navigateTo(Routes.loginScreen);
              },
              title: 'Customer',
              style: TextFontStyle.text15cFFFFFF500,
              color: AppColors.allPrimaryColor,
              radius: BorderRadius.circular(222.r),
              padding: EdgeInsets.symmetric(vertical: 19.h),
            ),
            //////// Customer Button start here ///////////////

            UIHelper.verticalSpace(18.h),

            // Engineer Button
            CustomButton(
              onTap: () {
                NavigationService.navigateTo(Routes.engineerLoginScreen);
              },
              title: 'Engineer',
              style: TextFontStyle.text15callprimaryColors500
                  .copyWith(color: const Color(0xFF192A48)),
              border: Border.all(color: AppColors.allPrimaryColor, width: 1),
              color: AppColors.cFFFFFF,
              radius: BorderRadius.circular(222.r),
              padding: EdgeInsets.symmetric(vertical: 18.h),
            ),
          ],
        ),
      ),
    );
  }
}
