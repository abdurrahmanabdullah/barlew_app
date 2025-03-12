// ignore_for_file: avoid_print

import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../../common_widget/custom_button.dart';
import '../../../../../common_widget/custom_text_form_fild.dart';
import '../../../../../constant/text_font_style.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../helpers/navigation_service.dart';

class EngineerSignUpOtpVerifyScreen extends StatefulWidget {
  final String email;
  const EngineerSignUpOtpVerifyScreen({super.key, required this.email});

  @override
  State<EngineerSignUpOtpVerifyScreen> createState() =>
      _EngineerSignUpOtpVerifyScreenState();
}

class _EngineerSignUpOtpVerifyScreenState
    extends State<EngineerSignUpOtpVerifyScreen> {
  final otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  late int otpDigits;
  bool _isLoading = false;

  ///------------------
  Future<void> submitForm() async {
    if (otpController.text.length == 4) {
      setState(() {
        _isLoading = true;
      });
      final result = await postVerifyOTPRxObj.postVerifyOTPRx(
        email: widget.email,
        otp: int.parse(otpController.text),
      );
      print("API response: $result");
      if (result) {
        setState(() {
          _isLoading = false;
        });
        ToastUtil.showShortToast("Verify success");
        NavigationService.navigateToUntilReplacement(
            Routes.engineerNavigationsBarScreen);
      } else {
        setState(() {
          _isLoading = false;
        });
        ToastUtil.showShortToast("Verify failed");
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      ToastUtil.showShortToast("Please fill up all otp");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.verticalSpace(60.h),
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
                Center(
                  child: Text('Verify Account',
                      textAlign: TextAlign.center, // Text alignment
                      style: TextFontStyle.text25allPrimaryColorTextw700),
                ),
                UIHelper.verticalSpace(33.h),
                Center(
                    child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Code has been send to ',
                      style: TextFontStyle.text14c2D3444w400,
                      children: [
                        TextSpan(
                            // text: "johndoe@gmail.com.\n",
                            text: widget.email,
                            style: TextFontStyle.text14c000000w500),
                        TextSpan(
                            text: "Enter the code to verify your account.",
                            style: TextFontStyle.text14c2D3444w400)
                      ]),
                )),
                UIHelper.verticalSpace(44.h),
                Text(
                  'Enter Codel',
                  style: TextFontStyle.text14allPrimaryColorTexts,
                ),
                UIHelper.verticalSpace(8.h),
                CustomTextFormFild(
                  hintText: '4 Digit Code',
                  textStyle: TextFontStyle.text15cABABABinter400,
                  controller: otpController,
                ),
                UIHelper.verticalSpace(22.h),
                UIHelper.verticalSpace(8.h),
                UIHelper.verticalSpace(325.h),
                CustomButton(
                  padding: EdgeInsets.symmetric(vertical: 18.h),
                  title: 'Verify Account',
                  style: TextFontStyle.text15cFFFFFF500,
                  color: AppColors.allPrimaryColor,
                  radius: BorderRadius.circular(119.r),
                  onTap: () {
                    submitForm();
                    // NavigationService.navigateTo(
                    //     Routes.engineerNavigationsBarScreen);
                  },
                ),
              ],
            ),
          ),

          //<<----------- loading indicator ------------->>
          if (_isLoading)
            const SpinKitCircle(
              color: Colors.black,
              size: 50.0,
            ),
        ]),
      ),
    );
  }
}
