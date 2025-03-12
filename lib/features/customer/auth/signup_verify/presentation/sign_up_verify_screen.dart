import 'package:barlew_app/gen/colors.gen.dart';
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
import '../../../../../helpers/all_routes.dart';
import '../../../../../helpers/navigation_service.dart';

class SignUpVerifyScreen extends StatefulWidget {
  final String email;
  const SignUpVerifyScreen({super.key, required this.email});

  @override
  State<SignUpVerifyScreen> createState() => _SignUpVerifyScreenState();
}

class _SignUpVerifyScreenState extends State<SignUpVerifyScreen> {
  final otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  Future<void> submitForm() async {
    try {
      if (_formKey.currentState!.validate()) {
        setState(() {
          _isLoading = true; // Show loading indicator
        });
        await customerSignUpOtpVerifyRXObj
            .customerSignUpOtpVerifyRX(
                email: widget.email, otp: otpController.text)
            .then(
          (value) {
            if (value) {
              NavigationService.navigateToUntilReplacement(
                  Routes.navigationsBarScreen);
            } else {
              ToastUtil.showShortToast("Invalid OTP");
            }
          },
        );
      }
    } catch (e) {
      ToastUtil.showShortToast(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: Form(
        key: _formKey,
        child: Padding(
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
                              text: "johndoe@gmail.com.\n",
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
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 3) {
                          return "Enter your 4 Digit Code";
                        } else {
                          return null;
                        }
                      }),
                  UIHelper.verticalSpace(22.h),
                  UIHelper.verticalSpace(325.h),
                  CustomButton(
                    padding: EdgeInsets.symmetric(vertical: 18.h),
                    title: 'Verify Account',
                    style: TextFontStyle.text15cFFFFFF500,
                    color: AppColors.allPrimaryColor,
                    radius: BorderRadius.circular(119.r),
                    onTap: () {
                      submitForm();
                    },
                  ),
                ],
              ),
            ),

            // Loading Indicator
            if (_isLoading)
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
      ),
    );
  }
}
