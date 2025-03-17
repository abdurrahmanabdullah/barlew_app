import 'package:barlew_app/features/engineer/engineer_auth/engineer_create_new_password/presentation/engineer_create_new_pass_screen.dart';
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

class EngineerVerifyEmailScreen extends StatefulWidget {
  final String email;
  const EngineerVerifyEmailScreen({super.key, required this.email});

  @override
  State<EngineerVerifyEmailScreen> createState() =>
      _EngineerVerifyEmailScreenState();
}

class _EngineerVerifyEmailScreenState extends State<EngineerVerifyEmailScreen> {
  final otpController = TextEditingController();
  final engineerVerifyEmailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    otpController.dispose();
  }

  Future<void> submitForm() async {
    try {
      if (_formKey.currentState!.validate()) {
        setState(() {
          isLoading = true;
        });
        await engineerForgetPasswordOtpRXobj
            .engineerForgetPasswordOtpRX(
                email: widget.email, otp: otpController.text)
            .then(
          (value) {
            if (value) {
              NavigationService.navigateToWithArgs(
                  Routes.createNewPasswordScreen, {"email": widget.email});
            } else {
              ToastUtil.showShortToast("Invalid OTP");
            }
          },
        );
      }
    } catch (e) {
      ToastUtil.showShortToast(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
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
                    child: Text('Verify Email',
                        textAlign: TextAlign.center, // Text alignment
                        style: TextFontStyle.text25allPrimaryColorTextw700),
                  ),
                  UIHelper.verticalSpace(33.h),
                  const Center(
                      child: Text(
                    'No worries! Enter your email address below and we will send you a code to reset password.',
                    textAlign: TextAlign.center,
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
            if (isLoading)
              const Positioned.fill(
                child: Center(
                  child: SpinKitCircle(
                    color: Colors.yellow,
                    size: 50.0,
                  ),
                ),
              )
          ]),
        ),
      ),
    );
  }
}
