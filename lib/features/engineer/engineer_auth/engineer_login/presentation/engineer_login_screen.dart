import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:barlew_app/provider/engineer_login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../../../common_widget/custom_button.dart';
import '../../../../../common_widget/custom_button_two.dart';
import '../../../../../common_widget/custom_text_form_fild.dart';
import '../../../../../constant/text_font_style.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../helpers/all_routes.dart';
import '../../../../../helpers/navigation_service.dart';
import '../../../../../helpers/ui_helpers.dart';

class EngineerLoginScreen extends StatefulWidget {
  const EngineerLoginScreen({super.key});

  @override
  State<EngineerLoginScreen> createState() => _EngineerLoginScreenState();
}

class _EngineerLoginScreenState extends State<EngineerLoginScreen> {
  bool isLoading = false;

  Future<void> signinSubmitForm(BuildContext context) async {
    final provider = Provider.of<EngineerLoginProvider>(context, listen: false);

    // Only proceed if the form is valid
    if (provider.formKey.currentState!.validate()) {
      setState(() {
        isLoading = true; // Start loading when form submission begins
      });

      try {
        // Perform the login API call
        final isSuccess = await engineerLoginRxObj.getLoginRX(
          email: provider.loginEmailController.text,
          password: provider.logInPassController.text,
        );

        if (isSuccess) {
          NavigationService.navigateToUntilReplacement(
              Routes.engineerNavigationsBarScreen);
        } else {
          ToastUtil.showShortToast("Invalid Credentials");
        }
      } catch (e) {
        ToastUtil.showShortToast(e.toString());
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EngineerLoginProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Form(
                key: provider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.verticalSpace(83.h),

                    // Splash Image
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

                    UIHelper.verticalSpace(50.h),

                    // Login Text
                    Center(
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextFontStyle.text25allPrimaryColorTextw700,
                      ),
                    ),
                    UIHelper.verticalSpace(20.h),

                    // Email Text
                    Text(
                      'E-mail',
                      style: TextFontStyle.text14allPrimaryColorTexts,
                    ),
                    UIHelper.verticalSpace(18.h),
                    CustomTextFormFild(
                      hintText: 'Enter your email',
                      textStyle: TextFontStyle.text15cgrayrobotoText,
                      controller: provider.loginEmailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    UIHelper.verticalSpace(18.h),

                    // Password Field
                    Text(
                      'Password',
                      style: TextFontStyle.text14allPrimaryColorTexts,
                    ),
                    UIHelper.verticalSpace(11.h),
                    CustomTextFormFild(
                      obscureText: provider.obscureEngineerPassword,
                      suffixIcon: IconButton(
                        icon: Image.asset(
                          provider.obscureEngineerPassword
                              ? Assets.icons.eyeOff.path
                              : Assets.icons.eyeOpen.path,
                          height: 25.h,
                        ),
                        onPressed: () {
                          provider.togglePasswordVisibility();
                        },
                      ),
                      hintText: 'Enter your Password',
                      textStyle: TextFontStyle.text15cgrayrobotoText,
                      controller: provider.logInPassController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ),

                    UIHelper.verticalSpace(8.h),

                    // Save Information and Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              activeColor: AppColors.allPrimaryColor,
                              side: const BorderSide(
                                color: AppColors.allPrimaryColor,
                              ),
                              value: provider.value,
                              onChanged: (value) {
                                provider.toggleSaveInfo(value!);
                              },
                            ),
                            Text(
                              'Save Information',
                              style: TextFontStyle.text12cprimarycolorw500
                                  .copyWith(
                                      color: AppColors.c000000,
                                      fontSize: 14.sp),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                NavigationService.navigateTo(
                                    Routes.engineerForgotPasswordScreen);
                              },
                              child: Text('Forgot Password?',
                                  style: TextFontStyle
                                      .text14callprimarycolrosw500
                                      .copyWith(fontSize: 14.sp)),
                            ),
                          ],
                        ),
                      ],
                    ),

                    UIHelper.verticalSpace(11.h),

                    // Login Button
                    CustomButton(
                      padding: EdgeInsets.symmetric(vertical: 18.h),
                      title: 'Login',
                      style: TextFontStyle.text15cFFFFFF500,
                      color: AppColors.allPrimaryColor,
                      radius: BorderRadius.circular(119.r),
                      onTap: () {
                        signinSubmitForm(context);
                      },
                    ),

                    UIHelper.verticalSpace(22),

                    // Divider
                    Row(
                      children: [
                        const Expanded(child: Divider(color: Colors.grey)),
                        UIHelper.horizontalSpace(11.w),
                        Text('Log In with ',
                            style: TextFontStyle.text16cprimarycolorw500),
                        UIHelper.horizontalSpace(11.w),
                        const Expanded(child: Divider(color: Colors.grey)),
                      ],
                    ),

                    UIHelper.verticalSpace(33.h),

                    // Google Login Button
                    CustomButtonTow(
                      radius: BorderRadius.circular(111.r),
                      color: AppColors.cFFFFFF,
                      border:
                          Border.all(color: AppColors.broderColor, width: 1),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Image.asset(Assets.icons.google2png.path,
                                height: 31),
                          ),
                          UIHelper.horizontalSpace(11.w),
                          Text('Login with Google',
                              style: TextFontStyle.text14cprimarycolorw500),
                        ],
                      ),
                    ),

                    UIHelper.verticalSpace(30.h),

                    // Don't have an account row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don’t have an account?',
                            style: TextFontStyle.text14cprimarycolorw500),
                        UIHelper.horizontalSpace(5.w),
                        GestureDetector(
                          onTap: () {
                            NavigationService.navigateTo(
                                Routes.engineerRegisterScreen);
                          },
                          child: Text(
                            ' Sign Up',
                            style: TextFontStyle.text32allPrimaryColorw600
                                .copyWith(fontSize: 15.sp),
                          ),
                        ),
                      ],
                    ),

                    UIHelper.verticalSpace(20.h),
                  ],
                ),
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
              ),
          ],
        ),
      ),
    );
  }
}
