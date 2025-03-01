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

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  bool _isLoading = false;
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> submitForm({required String email}) async {
    try {
      if (_formKey.currentState!.validate()) {
        setState(() {
          _isLoading = true;
        });
        await customerForgetPassRXObj
            .customerForgetPassRX(
          email: emailController.text,
        )
            .then((value) {
          if (value) {
            setState(() {
              _isLoading = false;
            });
            NavigationService.navigateToWithArgs(
                Routes.verifyEmailScreen, {'email': email});
          } else {
            setState(() {
              _isLoading = false;
            });
            ToastUtil.showShortToast("Failed to send OTP");
          }
        });
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
                UIHelper.verticalSpace(42.h),
                Center(
                  child: Text('Forgot Password',
                      textAlign: TextAlign.center, // Text alignment
                      style: TextFontStyle.text25allPrimaryColorTextw700),
                ),
                UIHelper.verticalSpace(33.h),
                Text(
                  'No worries! Enter your email address below and we will send you a code to reset password.',
                  style: TextFontStyle.text13c505767roboto2,
                  textAlign: TextAlign.center,
                ),
                UIHelper.verticalSpace(44.h),
                Text(
                  'E-mail',
                  style: TextFontStyle.text14allPrimaryColorTexts,
                ),
                UIHelper.verticalSpace(8.h),
                CustomTextFormFild(
                  hintText: 'Enter your email',
                  textStyle: TextFontStyle.text15cABABABinter400,
                  controller: emailController,
                  validator: (value) {
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value ?? "");
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    } else if (!emailValid) {
                      return "Please enter a valid email";
                    } else {
                      return null;
                    }
                  },
                ),
                UIHelper.verticalSpace(360.h),
                CustomButton(
                  padding: EdgeInsets.symmetric(vertical: 18.h),
                  title: 'Send Reset Instruction',
                  style: TextFontStyle.text15cFFFFFF500,
                  color: AppColors.allPrimaryColor,
                  radius: BorderRadius.circular(119.r),
                  onTap: () {
                    submitForm(email: emailController.text);
                  },
                ),
                UIHelper.verticalSpace(22.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
