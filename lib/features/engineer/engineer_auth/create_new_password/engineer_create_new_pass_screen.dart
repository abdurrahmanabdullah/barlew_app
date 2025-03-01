import 'package:barlew_app/constant/app_constants.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common_widget/custom_button.dart';
import '../../../../../common_widget/custom_text_form_fild.dart';
import '../../../../../constant/text_font_style.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../helpers/all_routes.dart';
import '../../../../../helpers/navigation_service.dart';

class EngineerCreateNewPassScreen extends StatefulWidget {
  final String email;
  const EngineerCreateNewPassScreen({super.key, required this.email});

  @override
  State<EngineerCreateNewPassScreen> createState() =>
      _EngineerCreateNewPassScreenState();
}

class _EngineerCreateNewPassScreenState
    extends State<EngineerCreateNewPassScreen> {
  final conformPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscurePassword = true; // For password visibility toggle
  bool _obscurePasswordTow = true; // For confirm password visibility toggle

  @override
  void dispose() {
    passwordController.dispose();
    conformPasswordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  Future<void> submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {});
        final success = await engineerResetPassRXobj.engineerResetPassRX(
            email: widget.email,
            password: passwordController.text,
            passwordConfirmation: conformPasswordController.text,
            token: otpVerifyToken);

        if (success) {
          setState(() {});
          ToastUtil.showShortToast("Success");
          NavigationService.navigateToReplacement(Routes.engineerLoginScreen);
        } else {
          setState(() {});
          ToastUtil.showShortToast("Reset password failed: Unknown error");
        }
      } catch (error) {
        setState(() {});
        ToastUtil.showShortToast("Reset password failed: ${error.toString()}");
      }
    } else {
      setState(() {});
      ToastUtil.showShortToast("Invalid form data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
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
                //// create neww password
                child: Text(
                  'Create New Password',
                  textAlign: TextAlign.center, // Text alignment
                  style: TextFontStyle.text25allPrimaryColorTextw700,
                ),
              ),
              UIHelper.verticalSpace(33.h),
              const Center(
                child: Text(
                  'Please enter and confirm your new password.',
                  textAlign: TextAlign.center,
                ),
              ),
              const Center(
                child: Text(
                  'You will need to login after you reset.',
                  textAlign: TextAlign.center,
                ),
              ),
              UIHelper.verticalSpace(44.h),
              Text('Password', style: TextFontStyle.text14allPrimaryColorTexts),
              UIHelper.verticalSpace(9.h),
              CustomTextFormFild(
                obscureText: _obscurePassword, // For password visibility toggle
                suffixIcon: IconButton(
                  icon: Image.asset(
                    _obscurePassword
                        ? Assets.icons.eyeOff.path
                        : Assets.icons.eyeOpen.path, // Toggle icon
                    height: 25.h,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword; // Toggle visibility
                    });
                  },
                ),
                hintText: '*********',
                textStyle: TextFontStyle.text15cABABABinter400,
                controller: passwordController,
              ),
              UIHelper.verticalSpace(8.h),
              Text(
                'Password must contain at least 8 characters.',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),

              /// confirm password
              UIHelper.verticalSpace(29.h),
              Text('Confirm Password',
                  style: TextFontStyle.text14allPrimaryColorTexts),
              UIHelper.verticalSpace(10.h),
              CustomTextFormFild(
                obscureText:
                    _obscurePasswordTow, // For confirm password visibility toggle
                suffixIcon: IconButton(
                  icon: Image.asset(
                    _obscurePasswordTow
                        ? Assets.icons.eyeOff.path
                        : Assets.icons.eyeOpen.path, // Toggle icon
                    height: 25.h,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePasswordTow =
                          !_obscurePasswordTow; // Toggle visibility
                    });
                  },
                ),
                hintText: '*********',
                textStyle: TextFontStyle.text15cABABABinter400,
                controller: conformPasswordController,
              ),
              UIHelper.verticalSpace(225.h),
              CustomButton(
                padding: EdgeInsets.symmetric(vertical: 18.h),
                title: 'Verify Account',
                style: TextFontStyle.text15cFFFFFF500,
                color: AppColors.allPrimaryColor,
                radius: BorderRadius.circular(119.r),
                onTap: () {
                  // Navigate to customer home screen
                  // NavigationService.navigateTo(Routes.engineerLoginScreen);
                  submitForm();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
