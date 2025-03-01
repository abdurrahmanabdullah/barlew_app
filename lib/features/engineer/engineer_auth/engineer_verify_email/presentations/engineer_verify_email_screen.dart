import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common_widget/custom_button.dart';
import '../../../../../common_widget/custom_text_form_fild.dart';
import '../../../../../constant/text_font_style.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../helpers/navigation_service.dart';

class EngineerVerifyEmailScreen extends StatefulWidget {
  const EngineerVerifyEmailScreen({super.key});

  @override
  State<EngineerVerifyEmailScreen> createState() =>
      _EngineerVerifyEmailScreenState();
}

class _EngineerVerifyEmailScreenState extends State<EngineerVerifyEmailScreen> {
  final engineerVerifyEmailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    engineerVerifyEmailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpace(42.h),
              GestureDetector(
                onTap: () {
                  NavigationService.goBack;
                },
                child: Image.asset(
                  Assets.icons.arraytow.path,
                  height: 34.h,
                ),
              ),
              UIHelper.verticalSpace(22.h),

              /// this is a text for verify email ///
              Center(
                child: Text('Verify Email',
                    textAlign: TextAlign.center, // Text alignment
                    style: TextFontStyle.text25allPrimaryColorTextw700),
              ),
              ////<<<<<< end here />>>>>>>>>>>>>?/ /

              UIHelper.verticalSpace(33.h),
              Center(
                  child: Text(
                'Enter the code to verify your account.Enter the code to verify your account.',
                textAlign: TextAlign.center,
                style: TextFontStyle.text13c505767roboto2
                    .copyWith(fontSize: 15.sp),
              )),
              UIHelper.verticalSpace(44.h),

              Text(
                'Enter Code',
                style: TextFontStyle.text14allPrimaryColorTexts,
              ),
              UIHelper.verticalSpace(8.h),
              CustomTextFormFild(
                hintText: '4 Digit Code',
                textStyle: TextFontStyle.text15cABABABinter400,
                controller: engineerVerifyEmailController,
              ),
              UIHelper.verticalSpace(22.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Didn’t Receive Code?',
                  ),
                  UIHelper.horizontalSpace(9.w),
                  Text(
                    'Resend Code',
                    style: TextFontStyle.text15cFFFFFF500
                        .copyWith(color: AppColors.allPrimaryColor),
                  ),
                ],
              ),
              UIHelper.verticalSpace(325.h),
              CustomButton(
                padding: EdgeInsets.symmetric(vertical: 18.h),
                title: 'Verify Account',
                style: TextFontStyle.text15cFFFFFF500,
                color: AppColors.allPrimaryColor,
                radius: BorderRadius.circular(119.r),
                onTap: () {
                  NavigationService.navigateTo(
                      Routes.engineerCreateNewPassword);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
