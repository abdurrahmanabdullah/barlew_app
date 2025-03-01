import 'dart:io';

import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/common_widget/custom_text_form_fild.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../gen/assets.gen.dart';

// ignore: must_be_immutable
class EditProfileScreen extends StatefulWidget {
  var snap;
  EditProfileScreen({super.key, required this.snap});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    super.initState();
    fastNameController.text = widget.snap.firstName ?? '';
    lastNameController.text = widget.snap.lastName ?? '';
    addressController.text = widget.snap.address ?? '';
  }

  /// all controller start here /////
  final fastNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();

  /// end here /////

  /// dispose all controller ///
  @override
  void dispose() {
    super.dispose();
    fastNameController.dispose();
    lastNameController.dispose();

    /// dispose all controller ///
  }

  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  XFile? _selectedProfileImage;
  bool _isPickerActive = false;

  Future<void> _pickProfileImage() async {
    if (_isPickerActive)
      return; // If picker is active, don't allow another pick

    setState(() {
      _isPickerActive =
          true; // Set the flag to true to indicate picker is active
    });

    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _selectedProfileImage = pickedFile;
        });
      } else {
        // Handle the case where the user cancels the picker
        print("No image selected.");
      }
    } catch (e) {
      print("Error picking image: $e");
    } finally {
      setState(() {
        _isPickerActive =
            false; // Reset the flag when the picker operation is complete
      });
    }
  }

  Future<void> submitForm() async {
    try {
      if (_formKey.currentState!.validate()) {
        setState(() {
          _isLoading = true;
        });
        final success = await customerEditProfileRXObj.customerEditProfileRX(
            firstName: fastNameController.text,
            lastName: lastNameController.text,
            address: addressController.text,
            avatar: _selectedProfileImage!);

        if (success) {
          setState(() {
            _isLoading = false;
          });
          NavigationService.navigateToReplacement(Routes.navigationsBarScreen);
        } else {
          setState(() {
            _isLoading = false;
          });
        }
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      ToastUtil.showShortToast("change your previus image");
    }
  }

  // ignore: unused_field
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: TextFontStyle.text20cprimarycolorw500,
        ),
        backgroundColor: AppColors.cFFFFFF,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: AppColors.cFFFFFF,
      body: Stack(children: [
        Form(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.verticalSpace(10.h),

                  ///<<<<<<<<<<<<<<<<<<<<  profile  image start here >>>>>>>>>>>>>>>>>> ////////////
                  Center(
                    child: GestureDetector(
                      onTap: _pickProfileImage,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(150.r),
                            child: CircleAvatar(
                              radius: 60.r,
                              backgroundImage: _selectedProfileImage != null
                                  ? FileImage(File(_selectedProfileImage!.path))
                                  : (widget.snap.avatar != null &&
                                          widget.snap.avatar!.isNotEmpty)
                                      ? NetworkImage(widget.snap.avatar!)
                                      : AssetImage(Assets
                                          .icons
                                          .personPlaceholder
                                          .path) as ImageProvider,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                enableFeedback: false,
                                onPressed: _pickProfileImage,
                                icon: Image.asset(
                                  Assets.icons.eddit.path,
                                  height: 30.h,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///<<<<<<<<<<<<<<<<<<<<  profile  image end here >>>>>>>>>>>>>>>>>> ////////////

                  UIHelper.verticalSpace(23.h),
                  Text(
                    'First Name',
                    style: TextFontStyle.text15c192A48400roboto,
                  ),

                  /// text ////
                  UIHelper.verticalSpace(10.h),

                  /// name FormFild start here ///
                  CustomTextFormFild(
                      hintText: 'Enter Name',
                      textStyle: TextFontStyle.text15cgrayrobotoText,
                      controller: fastNameController),
                  //// end here //////

                  UIHelper.verticalSpace(10.h),
                  Text(
                    'Last Name',
                    style: TextFontStyle.text15c192A48400roboto,
                  ),
                  UIHelper.verticalSpace(10.h),
                  CustomTextFormFild(
                      hintText: 'Enter Name',
                      textStyle: TextFontStyle.text15cgrayrobotoText,
                      controller: lastNameController),
                  //// last Name fild //////

                  // //// Phone Number fild end here //////////////

                  UIHelper.verticalSpace(10.h),
                  Text(
                    'Address',
                    style: TextFontStyle.text15c192A48400roboto,
                  ),
                  UIHelper.verticalSpace(10.h),
                  CustomTextFormFild(
                    hintText: '',
                    textStyle: TextFontStyle.text15cgrayrobotoText,
                    controller: addressController,
                  ),
                  //// Address fild end here /////

                  UIHelper.verticalSpace(150.h),

                  /// customButton for next /////

                  CustomButton(
                    onTap: () {
                      submitForm();
                    },
                    title: 'Save',
                    style: TextFontStyle.text15cFFFFFF500,
                    radius: BorderRadius.circular(222.r),
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    color: AppColors.allPrimaryColor,
                  ),

                  /// end here ////

                  UIHelper.verticalSpace(21.h),
                ],
              ),
            ),
          ),
        ),
        if (_isLoading)
          const SpinKitCircle(
            color: Colors.yellow,
            size: 50.0,
          ),
      ]),
    );
  }
}
