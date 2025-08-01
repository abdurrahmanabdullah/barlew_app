library;

import 'dart:io';

import 'package:barlew_app/features/engineer/engineer_auth/engineer_register/model/engineer_skill_model.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:barlew_app/provider/image_pick_provider.dart';
import 'package:barlew_app/provider/signup_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../common_widget/custom_button.dart';
import '../../../../../common_widget/custom_text_form_fild.dart';
import '../../../../../constant/text_font_style.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../helpers/all_routes.dart';
import '../../../../../helpers/navigation_service.dart';
import '../../../../../helpers/ui_helpers.dart';

class EngineerRegisterScreen extends StatefulWidget {
  const EngineerRegisterScreen({super.key});

  @override
  State<EngineerRegisterScreen> createState() => _EngineerRegisterScreenState();
}

class _EngineerRegisterScreenState extends State<EngineerRegisterScreen> {
  // ignore: prefer_typing_uninitialized_variables
  late final signupScreenProvider;

  final engineerSkillsController = TextEditingController();

  bool isChecked = false;

  final _formKey = GlobalKey<FormState>();
  XFile? selectedPortfolio;

  List<Datum> skillList = [];

  List<Map<String, dynamic>> selectedSkills = [];

  Map<String, int> skillOptions = {};

  bool _isLoading = false;

  @override
  void dispose() {
    engineerSkillsController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    skillapicall();
    signupScreenProvider =
        Provider.of<SignupScreenProvider>(context, listen: false);
  }

////-------------api  call
  /// Fetch skills from API
  Future<void> skillapicall() async {
    final response = await engineerSkillRXobj.engineerSkillRX();

    if (response != null && response.data != null) {
      setState(() {
        skillList = response.data!;
        skillOptions = {for (var skill in skillList) skill.name!: skill.id!};
      });
    }
  }

  Future<void> engineersignupMethod() async {
    try {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      if (signupScreenProvider.passwordController.text !=
          signupScreenProvider.confirmPasswordController.text) {
        ToastUtil.showShortToast("Passwords do not match");
        return;
      }

      final imagePickerProvider =
          Provider.of<ImagePickerProvider>(context, listen: false);

      // Check if portfolio images are selected
      if (imagePickerProvider.pickedFiles2.isEmpty) {
        ToastUtil.showShortToast("Please select a portfolio file.");
        return;
      }
      setState(() {
        _isLoading = true;
      });
      // Only send skill IDs, not the entire object
      List<int> skillIds =
          selectedSkills.map((skill) => skill['id'] as int).toList();

      // print("Sending skill IDs: $skillIds");

      bool isSignedUp = await engineerSignUpRxObj.engineerSignUpRx(
        firstName: signupScreenProvider.firstnameController.text,
        lastName: signupScreenProvider.lastnameController.text,
        email: signupScreenProvider.emailController.text,
        role: "engineer",
        address: signupScreenProvider.addressController.text,
        password: signupScreenProvider.passwordController.text,
        passwordConfirmation:
            signupScreenProvider.confirmPasswordController.text,
        service: signupScreenProvider.serviceController.text,
        about: signupScreenProvider.aboutController.text,
        skills: skillIds,

        // level: engineerLevelController.text,
        portfolio: imagePickerProvider.pickedFiles2,
      );

      if (isSignedUp) {
        setState(() {
          _isLoading = false;
        });
        NavigationService.navigateToWithArgs(
          Routes.engineerSignupVerifyScreen,
          {"email": signupScreenProvider.emailController.text},
        );
      } else {
        setState(() {
          _isLoading = false;
        });
        ToastUtil.showShortToast("Failed to Create Account");
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ToastUtil.showShortToast("Signup failed: ${e.toString()}");
    }
  }

  ///<<<<<<<<<<<<<  end here >>>>>>>>>>>>>>>>>>>> ////

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupScreenProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0.w),
            child: Stack(children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.verticalSpace(53.h),
                    ////<<<<<<<<<<<<<<<<  back icon start here >>>>>>>>>>>>>> ////////////////

                    // UIHelper.verticalSpace(20.h),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            NavigationService.goBack;
                          },
                          child: Image.asset(
                            Assets.icons.arraytow.path,
                            height: 34.h,
                          ),
                        ),
                        UIHelper.horizontalSpace(86.w),
                        Center(
                          child: Text(
                            'Register',
                            textAlign: TextAlign.center,
                            style: TextFontStyle.text25allPrimaryColorTextw700,
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(33.h),

                    ///<<<<<<<<<<<<  First name Last Name  Row star there >>>>>>>>>>>> /////////
                    Row(
                      children: [
                        Text(
                          'First Name',
                          style: TextFontStyle.text14allPrimaryColorTexts,
                        ),
                        UIHelper.horizontalSpace(110.w),
                        Text(
                          'Last Name',
                          style: TextFontStyle.text14allPrimaryColorTexts,
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
                              controller: provider.firstnameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "First Name is required";
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
                              controller: provider.lastnameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Last Name  is required";
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
                        controller: provider.emailController,
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
                    ///

                    ///address fiels is
                    UIHelper.verticalSpace(17.h),
                    Text(
                      'Address',
                      style: TextFontStyle.text14allPrimaryColorTexts,
                    ),
                    UIHelper.verticalSpace(18.h),
                    CustomTextFormFild(
                        hintText: 'Enter your Address',
                        textStyle: TextFontStyle.text15cABABABinter400,
                        controller: provider.addressController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Address is required";
                          } else {
                            return null;
                          }
                        }),

                    UIHelper.verticalSpace(17.h),

                    //// password fild start here /////////
                    Text(
                      'Password',
                      style: TextFontStyle.text14allPrimaryColorTexts,
                    ),
                    UIHelper.verticalSpace(11.h),
                    CustomTextFormFild(
                        obscureText: provider.obscurePassword,
                        suffixIcon: IconButton(
                          highlightColor: Colors.transparent,
                          icon: Image.asset(
                            provider.obscurePassword
                                ? Assets.icons.eyeOff.path
                                : Assets.icons.eyeOpen.path,
                            height: 25.h,
                          ),
                          onPressed: () {
                            provider
                                .togglePasswordVisibility(); // Toggling visibility through provider
                          },
                        ),
                        hintText: 'Enter your Password',
                        textStyle: TextFontStyle.text15cABABABinter400,
                        controller: provider.passwordController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return "Enter Minimum 8 Digit";
                          } else {
                            return null;
                          }
                        }
                        // Using the provider's controller
                        ),

                    UIHelper.verticalSpace(5.h),
                    Text(
                      'must contain 8 char.',
                      style: TextFontStyle.text15cABABABinter400,
                    ),

                    /// <<<<<<<<<< end here >>>>>>>>>>>>> ////////////
                    UIHelper.verticalSpace(11.h),

                    /// <<<<<<<<<<<<<<< confirm password fild start here >>>>>>>>>>>>>> //////////
                    Text(
                      'Confirm Password',
                      style: TextFontStyle.text14allPrimaryColorTexts,
                    ),
                    UIHelper.verticalSpace(11.h),
                    CustomTextFormFild(
                        obscureText: provider.confirmObscurePassword,
                        suffixIcon: IconButton(
                          highlightColor: Colors.transparent,
                          icon: Image.asset(
                            provider.confirmObscurePassword
                                ? Assets.icons.eyeOff.path
                                : Assets.icons.eyeOpen.path,
                            height: 25.h,
                          ),
                          onPressed: () {
                            provider
                                .toggleConfirmPasswordVisibility(); // Toggling visibility through provider
                          },
                        ),
                        hintText: 'Confirm your Password',
                        textStyle: TextFontStyle.text15cABABABinter400,
                        controller: provider.confirmPasswordController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return "Enter Minimum 8 Digit";
                          } else {
                            return null;
                          }
                        }

                        // Using the provider's controller
                        ),

                    ///<<<<<<<<<<<<<  end here >>>>>>>>>>>>>>  /////////

                    UIHelper.verticalSpace(10.h),
                    ////<<<<<<<<<<<<< this is Address start here >>>>>>>>>>>>>>> ///
                    Text(
                      'Service',
                      style: TextFontStyle.text14allPrimaryColorTexts,
                    ),
                    UIHelper.verticalSpace(11.h),
                    CustomTextFormFild(
                        hintText: 'Enter Your provide service ',
                        textStyle: TextFontStyle.text15cABABABinter400,
                        controller: provider.serviceController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Service is required";
                          } else {
                            return null;
                          }
                        }),

                    /// this is a skills fild start here
                    UIHelper.verticalSpace(10.h),
                    ////<<<<<<<<<<<<< this is Address start here >>>>>>>>>>>>>>> ///

                    UIHelper.verticalSpace(11.h),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Skills',
                          style: TextFontStyle.text14allPrimaryColorTexts,
                        ),
                        UIHelper.verticalSpace(11.h),
                        DropdownButtonFormField<String>(
                            isExpanded: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            hint: Text(
                              selectedSkills.isEmpty
                                  ? 'Select Skills'
                                  : selectedSkills
                                      .map((skill) => skill['name'])
                                      .join(', '),
                              style: const TextStyle(fontSize: 16),
                            ),
                            items: skillOptions.keys.map((skill) {
                              return DropdownMenuItem<String>(
                                value: skill,
                                enabled:
                                    false, // Prevent default selection behavior
                                child: StatefulBuilder(
                                  builder: (context, setStateDropdown) {
                                    return Row(
                                      children: [
                                        Checkbox(
                                          value: selectedSkills.any((s) =>
                                              s['id'] == skillOptions[skill]),
                                          onChanged: (isSelected) {
                                            setState(() {
                                              if (isSelected == true) {
                                                selectedSkills.add({
                                                  "id": skillOptions[skill]!,
                                                  "name": skill
                                                });
                                              } else {
                                                selectedSkills.removeWhere(
                                                    (s) =>
                                                        s['id'] ==
                                                        skillOptions[skill]);
                                              }
                                            });
                                            setStateDropdown(() {});
                                          },
                                        ),
                                        Text(skill),
                                      ],
                                    );
                                  },
                                ),
                              );
                            }).toList(),
                            onChanged: (_) {},
                            validator: (value) {
                              if (selectedSkills.isEmpty) {
                                return "Please select at least one skill";
                              } else {
                                return null;
                              }
                            }
                            // Not needed
                            ),
                      ],
                    ),

                    UIHelper.verticalSpace(17.h),

                    UIHelper.verticalSpace(17.h),

                    ///<<<<<<<<<<<<<  end here >>>>> /////////////////
                    UIHelper.verticalSpace(11.h),
                    Text(
                      'About',
                      style: TextFontStyle.text14allPrimaryColorTexts,
                    ),
                    UIHelper.verticalSpace(11.h),
                    TextFormField(
                        maxLines: 5,
                        maxLength: 60,
                        controller: provider.aboutController,
                        decoration: InputDecoration(
                          hintText: 'About',
                          hintStyle: TextFontStyle.text15cc45536Bw400,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                                color: AppColors.broderColor, width: 1.w),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                                color: AppColors.broderColor, width: 1.w),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                                color: AppColors.broderColor, width: 1.w),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.w),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "About is required";
                          } else {
                            return null;
                          }
                        }),

                    //// <<<<<<<<<<<<<<< end here >>>>>>>>>>>>>>>>>>>> ////
                    Text(
                      'Portfolio',
                      style: TextFontStyle.text14allPrimaryColorTexts,
                    ),
                    UIHelper.verticalSpace(10.h),

                    Consumer<ImagePickerProvider>(
                      builder: (context, imagePickerProvider, child) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Number of columns in the grid
                            crossAxisSpacing: 10, // Spacing between columns
                            mainAxisSpacing: 10, // Spacing between rows
                          ),
                          itemCount: imagePickerProvider.pickedFiles2.length +
                              1, // Total number of items
                          itemBuilder: (context, index) {
                            if (index ==
                                imagePickerProvider.pickedFiles2.length) {
                              // Add Image Button
                              return GestureDetector(
                                onTap: imagePickerProvider.pickMultipleImages2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.c626262,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            }

                            // Display Selected Image with Remove Icon
                            return Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    File(imagePickerProvider
                                        .pickedFiles2[index].path),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: GestureDetector(
                                    onTap: () =>
                                        imagePickerProvider.removeImage(index),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.black54,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),

                    UIHelper.verticalSpace(22.h),

                    //// <<<<<<<<<<<<<<  Terms of & service and policy session  start here J>>>>>>>>>>>> ////
                    UIHelper.verticalSpace(22.h),

                    Row(
                      children: [
                        Checkbox(
                          side: const BorderSide(
                              color: AppColors.allPrimaryColor),
                          value: isChecked,
                          activeColor: AppColors.allPrimaryColor,
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
                    UIHelper.verticalSpace(22.h),

                    /////<<<<<<<<<<<<<<<   Create Account button start here >>>>>>>>>>>>>>>>> //////
                    CustomButton(
                      padding: EdgeInsets.symmetric(vertical: 18.h),
                      title: 'Create Account',
                      style: TextFontStyle.text15cFFFFFF500,
                      color: isChecked
                          ? AppColors.allPrimaryColor
                          : AppColors.c3B8CDB,
                      radius: BorderRadius.circular(119.r),
                      onTap: isChecked
                          ? () {
                              engineersignupMethod();
                            }
                          : () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Please check the Terms and Conditions.'),
                                  backgroundColor: Colors.blue,
                                ),
                              );
                            },
                    ),

                    /////<<<<<<<<<<<<<<<   Create Account button end here >>>>>>>>>>>>>>>>> //////

                    UIHelper.verticalSpace(20.h),
                  ],
                ),
              ),
              //<<----------- loading indicator ------------->>
              if (_isLoading)
                const SpinKitCircle(
                  color: Colors.yellow,
                  size: 50.0,
                ),
            ])),
      ),
    );
  }
}
