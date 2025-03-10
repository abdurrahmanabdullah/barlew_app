import 'package:barlew_app/common_widget/custom_button_two.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common_widget/custom_button.dart';
import '../../../../../common_widget/custom_text_form_fild.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../helpers/all_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //// <<<<<<<<<<< controller start here >>>>>>>>>>> //////
  bool isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscurePassword = true; // By default, password is hidden
  // bool _value = true; // By default, password is hidden
  //// <<<<<<<<<<< controller end here >>>>>>>>>>> //////
  final _formKey = GlobalKey<FormState>();

  Future<void> submitForm() async {
    try {
      if (_formKey.currentState!.validate()) {
        await customerSignInRXObj
            .customerSignInRX(
          email: emailController.text,
          password: passwordController.text,
        )
            .then((value) {
          if (value) {
            NavigationService.navigateToReplacement(
                Routes.navigationsBarScreen);
          } else {
            ToastUtil.showShortToast("Invalid Credentials");
          }
          // value.
          // getOwnProfileRxObj.getOwnProfileRx();
        });
      }
    } catch (e) {
      ToastUtil.showShortToast(e.toString());
    }
  }

  /// this is a dispose session start here ///
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
//// end here //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// no appBar i use ////
      backgroundColor: AppColors.cFFFFFF,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.verticalSpace(60.h),
                ////// <<<<<<<<<<<<<<Splash Image start here >>>>>>>>>>>>>>>>>>>>>>>>>>>?//////
                Center(
                  child: Container(
                    width: 127.w,
                    height: 127.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.images.splashImage.path),
                      ),
                    ),
                  ),
                ),
                ////// <<<<<<<<<<<<<<Splash Image end here >>>>>>>>>>>>>>>>>>>>>>>>>>>?//////
                UIHelper.verticalSpace(50.h),
                //// this is a login text start here ////////////////
                Center(
                  child: Text('Login',
                      textAlign: TextAlign.center, // Text alignment
                      style: TextFontStyle.text25allPrimaryColorTextw700),
                ),
                //// this is a login text end here ////////////////
                UIHelper.verticalSpace(20.h),

                /// email text ///
                Text(
                  'E-mail',
                  style: TextFontStyle.text14allPrimaryColorTexts,
                ),
                UIHelper.verticalSpace(18.h),
                CustomTextFormFild(
                  hintText: 'Enter your email',
                  textStyle: TextFontStyle.text15cgrayrobotoText,
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
                UIHelper.verticalSpace(18.h),
                //// <<<<<<<<<<<<<<<< Password fild start hare >>>>>>>>>>>>>>> /////////////////
                Text(
                  'Password',
                  style: TextFontStyle.text14allPrimaryColorTexts,
                ),
                UIHelper.verticalSpace(11.h),
                CustomTextFormFild(
                  obscureText: _obscurePassword, // This will toggle visibility
                  suffixIcon: IconButton(
                    icon: Image.asset(
                      _obscurePassword
                          ? Assets.icons.eyeOff.path
                          : Assets
                              .icons.eyeOpen.path, // Change icon based on state
                      height: 25.h,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword =
                            !_obscurePassword; // Toggle the password visibility
                      });
                    },
                  ),
                  hintText: 'Enter your Password',
                  textStyle: TextFontStyle.text15cgrayrobotoText,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 8) {
                      return "Enter Minimum 8 Digit";
                    } else {
                      return null;
                    }
                  },
                ),
                // Customer Button
                UIHelper.verticalSpace(24.h),
                //// <<<<<<<<<< this is a forgot session start here >>>>>>>>>>>>>> ////
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Checkbox(
                    //         activeColor: AppColors.allPrimaryColor,
                    //         side: const BorderSide(
                    //             color: AppColors.allPrimaryColor),
                    //         value: _value,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             _value = value!;
                    //           });
                    //         }),
                    //     Text(
                    //       'Save Information',
                    //       style: TextFontStyle.text12cprimarycolorw500.copyWith(
                    //           color: AppColors.c000000, fontSize: 14.sp),
                    //     ),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              NavigationService.navigateTo(
                                  Routes.forgotPasswordScreen);
                            },
                            child: Text('Forgot Password ? ',
                                style: TextFontStyle.text14callprimarycolrosw500
                                    .copyWith(fontSize: 14.sp))),
                      ],
                    )
                  ],
                ),
                //// <<<<<<<<<< this is a forgot session end  here >>>>>>>>>>>>>> ////
                UIHelper.verticalSpace(24.h),
                //// this is a login button start here ////
                CustomButton(
                  padding: EdgeInsets.symmetric(vertical: 18.h),
                  title: 'Login',
                  style: TextFontStyle.text15cFFFFFF500,
                  color: AppColors.allPrimaryColor,
                  radius: BorderRadius.circular(119.r),
                  onTap: () {
                    submitForm();
                  },
                ),
                ////<<<<<<<<<<<  end here>>>>>>>>>>>>> //////////
                UIHelper.verticalSpace(22),
                //// this is log in with  row for divider  start here //// //
                Row(
                  children: [
                    const Expanded(
                        child: Divider(
                      color: Colors.grey,
                    )),
                    UIHelper.horizontalSpace(11.w),
                    Text(
                      'Log In with ',
                      style: TextFontStyle.text16cprimarycolorw500,
                    ),
                    UIHelper.horizontalSpace(11.w),
                    const Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),
                ///// end here //////////
                UIHelper.verticalSpace(33.h),

                /// customButton for login with google ///
                CustomButtonTow(
                    radius: BorderRadius.circular(111.r),
                    color: AppColors.cFFFFFF,
                    border: Border.all(color: AppColors.broderColor, width: 1),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.icons.google2png.path,
                          height: 31,
                        ),
                        UIHelper.horizontalSpace(11.w),
                        Text(
                          'Login with Google',
                          style: TextFontStyle.text14cprimarycolorw500,
                        ),
                      ],
                    )),

                /// google login end here //////////
                UIHelper.verticalSpace(30.h),

                /// this row for don't have an account start here //////
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Don’t have an account?',
                        style: TextFontStyle.text14cprimarycolorw500),
                    UIHelper.horizontalSpace(5.w),
                    GestureDetector(
                        onTap: () {
                          NavigationService.navigateTo(Routes.registerScreen);
                        },
                        child: Text(
                          ' Sign Up',
                          style: TextFontStyle.text32allPrimaryColorw600
                              .copyWith(fontSize: 15.sp),
                        ))
                  ],
                ),
                //// end account row here ////
                UIHelper.verticalSpace(20.h),
                // Engineer Button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
