// ignore_for_file: deprecated_member_use

import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../common_widget/custom_button.dart';
import '../../../../../common_widget/custom_text_form_fild.dart';
import '../../../../../constant/text_font_style.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../helpers/all_routes.dart';
import '../../../../../helpers/navigation_service.dart';
import '../../../../../helpers/ui_helpers.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  /// this is all controller start here ////
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fastNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final conformPasswordController = TextEditingController();
  final addressController = TextEditingController();
  bool isChecked = false;
  bool _obscurePassword = true;
  bool _confirmObscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  /// this is a dispose start here /////
  ///
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fastNameController.dispose();
    lastNameController.dispose();
    conformPasswordController.dispose();
    addressController.dispose();
    super.dispose();
  }

  Future<void> signupMethod() async {
    try {
      if (_formKey.currentState!.validate()) {
        setState(() {
          _isLoading = true; // Show loading indicator
        });
        await customerSignUpRxObj
            .customerSignUpRx(
                firstName: fastNameController.text,
                lasttName: lastNameController.text,
                email: emailController.text,
                role: "customer",
                address: addressController.text,
                password: passwordController.text,
                passwordConfirmation: conformPasswordController.text)
            .then(
          (value) {
            if (value) {
              NavigationService.navigateToWithArgs(
                  Routes.signupVerifyScreen, {"email": emailController.text});
            } else {
              ToastUtil.showShortToast("Failed to sign up");
            }
          },
        );
      }
    } catch (e) {
      ToastUtil.showShortToast(e.toString());
    }
  }

  ///<<<<<<<<<<<<<  end here >>>>>>>>>>>>>>>>>>>> ////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///<<<<<<<<<<<<<  i don't use appBar >>>>>>>>>>> //////////////////
      backgroundColor: AppColors.cFFFFFF,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0.w),
          child: Form(
            key: _formKey,
            child: Stack(children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.verticalSpace(60.h),
                    ////<<<<<<<<<<<<<<<<  back icon start here >>>>>>>>>>>>>> ////////////////
                    GestureDetector(
                      onTap: () {
                        NavigationService.goBack;
                      },
                      child: Image.asset(
                        Assets.icons.arraytow.path,
                        height: 34.h,
                      ),
                    ),
                    ////<<<<<<<<<<<<<<<<  back icon end  here >>>>>>>>>>>>>> ////////////////
                    UIHelper.verticalSpace(20.h),
                    Center(
                      child: Text(
                        'Register',
                        textAlign: TextAlign.center,
                        style: TextFontStyle.text25allPrimaryColorTextw700,
                      ),
                    ),
                    UIHelper.verticalSpace(33.h),

                    ///<<<<<<<<<<<<  First name Last Name  Row star there >>>>>>>>>>>> /////////
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'First Name',
                            style: TextFontStyle.text14allPrimaryColorTexts,
                          ),
                        ),
                        UIHelper.horizontalSpace(15.w),
                        Expanded(
                          child: Text(
                            'Last Name',
                            style: TextFontStyle.text14allPrimaryColorTexts,
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(7.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomTextFormFild(
                              hintText: 'John',
                              textStyle: TextFontStyle.text15cABABABinter400,
                              controller: fastNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "First name is required";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        UIHelper.horizontalSpace(15.w),
                        Expanded(
                          flex: 1,
                          child: CustomTextFormFild(
                              hintText: 'Doe',
                              textStyle: TextFontStyle.text15cABABABinter400,
                              controller: lastNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Last name is required";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                      ],
                    ),
                    ////<<<<<<<<<<<<<<<<  end here >>>>>>>>>>>>>> /////////////////
                    UIHelper.verticalSpace(17.h),
                    Text(
                      'E-mail',
                      style: TextFontStyle.text14allPrimaryColorTexts,
                    ),
                    UIHelper.verticalSpace(18.h),
                    ///// this is emil fild ///////////////
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
                        }),
                    //// end here //////////
                    UIHelper.verticalSpace(8.h),
                    //// password fild start here /////////
                    Text(
                      'Password',
                      style: TextFontStyle.text14allPrimaryColorTexts,
                    ),
                    UIHelper.verticalSpace(11.h),
                    CustomTextFormFild(
                        obscureText: _obscurePassword,
                        suffixIcon: IconButton(
                          highlightColor: Colors.transparent,
                          icon: Image.asset(
                            _obscurePassword
                                ? Assets.icons.eyeOff.path
                                : Assets.icons.eyeOpen.path,
                            height: 25.h,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        hintText: 'Enter your Password',
                        textStyle: TextFontStyle.text15cABABABinter400,
                        controller: passwordController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return "Enter Minimum 8 Digit";
                          } else {
                            return null;
                          }
                        }),

                    /// <<<<<<<<<< end here >>>>>>>>>>>>> ////////////
                    UIHelper.verticalSpace(11.h),

                    /// <<<<<<<<<<<<<<< confirm password fild start here >>>>>>>>>>>>>> //////////
                    Text(
                      'Confirm Password',
                      style: TextFontStyle.text14allPrimaryColorTexts,
                    ),
                    UIHelper.verticalSpace(11.h),
                    CustomTextFormFild(
                        obscureText: _confirmObscurePassword,
                        suffixIcon: IconButton(
                          highlightColor: Colors.transparent,
                          icon: Image.asset(
                            _confirmObscurePassword
                                ? Assets.icons.eyeOff.path
                                : Assets.icons.eyeOpen.path,
                            height: 25.h,
                          ),
                          onPressed: () {
                            setState(() {
                              _confirmObscurePassword =
                                  !_confirmObscurePassword;
                            });
                          },
                        ),
                        hintText: 'Confirm your Password',
                        textStyle: TextFontStyle.text15cABABABinter400,
                        controller: conformPasswordController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return "Enter Minimum 8 Digit";
                          } else {
                            return null;
                          }
                        }),

                    ///<<<<<<<<<<<<<  end here >>>>>>>>>>>>>>  /////////
                    UIHelper.verticalSpace(10.h),
                    ////<<<<<<<<<<<<< this is Address start here >>>>>>>>>>>>>>> ///
                    Text(
                      'Address',
                      style: TextFontStyle.text14allPrimaryColorTexts,
                    ),
                    UIHelper.verticalSpace(11.h),
                    CustomTextFormFild(
                        hintText: 'Enter Your Address',
                        textStyle: TextFontStyle.text15cABABABinter400,
                        controller: addressController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Address is required";
                          } else {
                            return null;
                          }
                        }),
                    //// <<<<<<<<<<<<<<< end here >>>>>>>>>>>>>>>>>>>> ////
                    UIHelper.verticalSpace(22.h),

                    /// this is a main row fro checkbox start here  ///
                    Row(
                      children: [
                        Checkbox(
                          side: const BorderSide(
                              color: AppColors.allPrimaryColor),
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),

                        /// end here
                        //// <<<<<<<<<<<<<<  Terms of & service and policy session  start here J>>>>>>>>>>>> ////
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              text: 'By continuing, you agree to our ',
                              style: TextFontStyle.text13c475569400roboto2
                                  .copyWith(fontSize: 12.sp),
                              children: [
                                TextSpan(
                                    text: 'Terms of Service',
                                    style:
                                        TextFontStyle.text13c3B8CDB400roboto),
                                TextSpan(
                                  text: ' and ',
                                  style: TextFontStyle.text13c475569400roboto2,
                                ),
                                TextSpan(
                                  text: 'Privacy Policy.',
                                  style: TextFontStyle.text13c3B8CDB400roboto,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    /// main row end here
                    //// <<<<<<<<<<<<<<  Terms of & service and policy session  start here J>>>>>>>>>>>> ////
                    UIHelper.verticalSpace(22.h),
                    /////<<<<<<<<<<<<<<<   Create Account button start here >>>>>>>>>>>>>>>>> //////
                    CustomButton(
                      padding: EdgeInsets.symmetric(vertical: 18.h),
                      title: 'Create Account',
                      style: TextFontStyle.text15cFFFFFF500,
                      color: isChecked
                          ? AppColors.allPrimaryColor
                          : AppColors.allPrimaryColor.withOpacity(0.5),
                      radius: BorderRadius.circular(119.r),
                      onTap: () {
                        if (isChecked) {
                          signupMethod();
                        } else {
                          ToastUtil.showLongToast(
                              "Please accept Termsd and Policy");
                        }
                      },
                    ),
                    /////<<<<<<<<<<<<<<<   Create Account button end here >>>>>>>>>>>>>>>>> //////
                    UIHelper.verticalSpace(21.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'have an account?',
                          style: TextFontStyle.text15c192A48400.copyWith(
                              color: AppColors.broderColor, fontSize: 15.sp),
                        ),
                        UIHelper.horizontalSpace(5.w),
                        GestureDetector(
                          onTap: () {
                            NavigationService.navigateTo(Routes.loginScreen);
                          },
                          child: Text(
                            ' Sign in here',
                            style: TextFontStyle.text14allPrimaryColorTexts
                                .copyWith(color: AppColors.c3B8CDB),
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(24.h),
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
                ))
            ]),
          ),
        ),
      ),
    );
  }
}
