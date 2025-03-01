// import 'dart:developer';
// import 'dart:io';
// import 'package:barlew_app/helpers/toast.dart';
// import 'package:barlew_app/networks/api_access.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../../../../common_widget/custom_button.dart';
// import '../../../../../common_widget/custom_text_form_fild.dart';
// import '../../../../../constant/text_font_style.dart';
// import '../../../../../gen/assets.gen.dart';
// import '../../../../../gen/colors.gen.dart';
// import '../../../../../helpers/navigation_service.dart';
// import '../../../../../helpers/ui_helpers.dart';
// import 'package:barlew_app/features/engineer/engineer_auth/engineer_register/model/engineer_skill_model.dart';

// class EngineerEditProfileScreen extends StatefulWidget {
//   const EngineerEditProfileScreen({super.key});

//   @override
//   State<EngineerEditProfileScreen> createState() =>
//       _EngineerEditProfileScreenState();
// }

// class _EngineerEditProfileScreenState extends State<EngineerEditProfileScreen> {
//   final engineerFastNameController = TextEditingController();
//   final engineerLastNameController = TextEditingController();
//   final engineerAboutController = TextEditingController();
//   final engineerServiceController = TextEditingController();

//   List<Data> skillList = [];
//   List<Map<String, dynamic>> selectedSkills = [];
//   Map<String, int> skillOptions = {};
//   final ImagePicker _picker = ImagePicker();
//   final ImagePicker portfoliopicked = ImagePicker();
//   File? _pickedImage;
//   List<File> _portfolioImages = [];
//   // Default image if profile picture is unavailable

//   @override
//   void initState() {
//     super.initState();
//     skillapicall();
//   }

//   ///delete portfoilio-----------------------
//   Future<void> deletePortfolioImage(int portfolioId) async {
//     try {
//       bool isDeleted = await engineerPortfolioDeleteRXobj
//           .engineerPortfolioDeleteRX(id: portfolioId);

//       if (isDeleted) {
//         setState(() {});
//         ToastUtil.showShortToast("Portfolio deleted successfully");
//       } else {
//         ToastUtil.showShortToast("Failed to delete portfolio");
//       }
//     } catch (e) {
//       log("Error deleting portfolio: $e");
//       ToastUtil.showShortToast(
//           "An error occurred while deleting the portfolio.");
//     }
//   }

//   void removePortfolioImage(int index) {
//     setState(() {
//       _portfolioImages.removeAt(index); // Remove image from the list
//     });
//   }

// ////skill api call call ---------------------
//   Future<void> skillapicall() async {
//     final response = await engineerSkillRXobj.engineerSkillRX();

//     if (response != null && response.data != null) {
//       setState(() {
//         skillList = response.data!;
//         skillOptions = {for (var skill in skillList) skill.name!: skill.id!};
//       });
//     }
//   }

//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _pickedImage = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> portfoliopickImage() async {
//     final portfoliopickedFile =
//         await portfoliopicked.pickImage(source: ImageSource.gallery);

//     if (portfoliopickedFile != null) {
//       setState(() {});
//     }
//   }

//   formSubmit() async {
//     try {
//       selectedSkills.map((skill) => skill['id'] as int).toList();

//       final result = await engineerEditProfileRXobj.engineerEditProfileRX(
//         firstName: engineerFastNameController.text,
//         lastName: engineerLastNameController.text,
//         avatar: _pickedImage != null ? XFile(_pickedImage!.path) : null,
//         service: engineerServiceController.text,
//         about: engineerAboutController.text,
//         // skills: skillIds,
//       );

//       if (result) {
//         ToastUtil.showShortToast("Profile Updated");
//       } else {
//         ToastUtil.showShortToast("Failed to Update");
//       }
//     } catch (e) {
//       log("Error during profile update: $e");
//       ToastUtil.showShortToast(
//           "An error occurred while updating your profile.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.cFFFFFF,
//       body: StreamBuilder(
//         // engineerProfileRXObj.engineerProfileRX();
//         stream: engineerProfileRXObj.dataFetcher,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return const Center(child: Text("Error loading profile data"));
//           }

//           if (!snapshot.hasData || snapshot.data == null) {
//             return const Center(child: Text("No profile data available"));
//           }

//           final profileData = snapshot.data;
//           final profileImageUrl = profileData?.data?.avatar ?? '';
//           final firstName = profileData?.data?.firstName ?? "";
//           final lastName = profileData?.data?.lastName ?? "";
//           final service = profileData?.data?.service ?? "";
//           final about = profileData?.data?.about ?? "";
// //// porfolio image  from api
//           // Extract portfolio images
//           final portfolioImages = profileData?.data?.portfolios
//                   ?.map((portfolio) =>
//                       portfolio.image ?? Assets.icons.personPlaceholder.path)
//                   .toList() ??
//               [];

//           // Populate text controllers
//           engineerFastNameController.text = firstName;
//           engineerLastNameController.text = lastName;
//           engineerServiceController.text = service;
//           engineerAboutController.text = about;
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 22.0.w),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   UIHelper.verticalSpace(60.h),

//                   Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           NavigationService.goBack;
//                         },
//                         child: Image.asset(
//                           Assets.icons.arraytow.path,
//                           height: 34.h,
//                         ),
//                       ),
//                       UIHelper.horizontalSpace(86.w),
//                       Center(
//                         child: Text(
//                           'Edit Profile',
//                           textAlign: TextAlign.center,
//                           style: TextFontStyle.text25allPrimaryColorTextw700
//                               .copyWith(fontSize: 22.sp),
//                         ),
//                       ),
//                     ],
//                   ),
//                   UIHelper.verticalSpace(33.h),

//                   /// Profile Image Section
//                   Center(
//                     child: GestureDetector(
//                       onTap: _pickImage,
//                       child: Stack(
//                         children: [
//                           CircleAvatar(
//                             radius: 60.r,
//                             backgroundImage: _pickedImage != null
//                                 ? FileImage(_pickedImage!)
//                                 : (profileImageUrl != null &&
//                                         profileImageUrl!.isNotEmpty)
//                                     ? NetworkImage(profileImageUrl!)
//                                     : AssetImage(
//                                         Assets.icons.personPlaceholder.path),
//                           ),

//                           //  profileImageUrl
//                           Positioned(
//                             bottom: 0,
//                             right: 0,
//                             child: Container(
//                               padding: const EdgeInsets.all(6),
//                               decoration: const BoxDecoration(
//                                 color: Colors.white,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(
//                                 Icons.camera_alt,
//                                 color: Colors.black54,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),

//                   UIHelper.verticalSpace(33.h),

//                   Row(
//                     children: [
//                       Text('First Name',
//                           style: TextFontStyle.text14allPrimaryColorTexts),
//                       UIHelper.horizontalSpace(110.w),
//                       Text('Last Name',
//                           style: TextFontStyle.text14allPrimaryColorTexts),
//                     ],
//                   ),
//                   UIHelper.verticalSpace(7.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: CustomTextFormFild(
//                           hintText: "Enter First Name",
//                           textStyle: TextFontStyle.text15cABABABinter400,
//                           controller: engineerFastNameController,
//                         ),
//                       ),
//                       UIHelper.horizontalSpace(15.w),
//                       Expanded(
//                         flex: 1,
//                         child: CustomTextFormFild(
//                           hintText: "Enter Last Name",
//                           textStyle: TextFontStyle.text15cABABABinter400,
//                           controller: engineerLastNameController,
//                         ),
//                       ),
//                     ],
//                   ),
//                   UIHelper.verticalSpace(20.h),

//                   Text('Service',
//                       style: TextFontStyle.text14allPrimaryColorTexts),
//                   UIHelper.verticalSpace(11.h),
//                   CustomTextFormFild(
//                     hintText: "Service",
//                     textStyle: TextFontStyle.text15cABABABinter400,
//                     controller: engineerServiceController,
//                   ),
//                   UIHelper.verticalSpace(20.h),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Skills',
//                         style: TextFontStyle.text14allPrimaryColorTexts,
//                       ),
//                       UIHelper.verticalSpace(11.h),
//                       DropdownButtonFormField<String>(
//                         isExpanded: true,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         hint: Text(
//                           selectedSkills.isEmpty
//                               ? 'Select Skills'
//                               : selectedSkills
//                                   .map((skill) => skill['name'])
//                                   .join(', '),
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                         items: skillOptions.keys.map((skill) {
//                           return DropdownMenuItem<String>(
//                             value: skill,
//                             enabled:
//                                 false, // Prevent default selection behavior
//                             child: StatefulBuilder(
//                               builder: (context, setStateDropdown) {
//                                 return Row(
//                                   children: [
//                                     Checkbox(
//                                       value: selectedSkills.any((s) =>
//                                           s['id'] == skillOptions[skill]),
//                                       onChanged: (isSelected) {
//                                         setState(() {
//                                           if (isSelected == true) {
//                                             selectedSkills.add({
//                                               "id": skillOptions[skill]!,
//                                               "name": skill
//                                             });
//                                           } else {
//                                             selectedSkills.removeWhere((s) =>
//                                                 s['id'] == skillOptions[skill]);
//                                           }
//                                         });
//                                         setStateDropdown(() {});
//                                       },
//                                     ),
//                                     Text(skill),
//                                   ],
//                                 );
//                               },
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: (_) {}, // Not needed
//                       ),
//                     ],
//                   ),
//                   UIHelper.verticalSpace(20.h),
//                   Text(
//                     'About',
//                     style: TextFontStyle.text14allPrimaryColorTexts,
//                   ),
//                   UIHelper.verticalSpace(8.h),
//                   TextFormField(
//                     maxLines: 5,
//                     maxLength: 30,
//                     controller: engineerAboutController,
//                     decoration: InputDecoration(
//                       hintText: 'About ',
//                       hintStyle: TextFontStyle.text15cc45536Bw400,
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.r),
//                         borderSide: BorderSide(
//                             color: AppColors.broderColor, width: 1.w),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.r),
//                         borderSide: BorderSide(
//                             color: AppColors.broderColor, width: 1.w),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.r),
//                         borderSide: BorderSide(
//                             color: AppColors.broderColor, width: 1.w),
//                       ),
//                       errorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.r),
//                         borderSide: BorderSide(color: Colors.red, width: 1.w),
//                       ),
//                     ),
//                   ),

// ////----Service
//                   UIHelper.verticalSpace(8.h),

//                   UIHelper.verticalSpace(40.h),

// ////----------------portfolio part

//                   Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Portfolio',
//                           style: TextFontStyle.text14allPrimaryColorTexts,
//                         ),
//                         UIHelper.verticalSpace(10.h),

//                         GridView.builder(
//                           padding: EdgeInsets.zero,
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 3,
//                             crossAxisSpacing: 10,
//                             mainAxisSpacing: 10,
//                           ),
//                           itemCount: portfolioImages.length +
//                               1, // Extra item for "Add" button
//                           itemBuilder: (context, index) {
//                             if (index == portfolioImages.length) {
//                               // "Add" button at the end
//                               return GestureDetector(
//                                 onTap: portfoliopickImage,
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8.r),
//                                     border: Border.all(color: Colors.grey),
//                                     color: Colors.grey[200],
//                                   ),
//                                   child: const Center(
//                                     child: Icon(Icons.add,
//                                         size: 40, color: Colors.black54),
//                                   ),
//                                 ),
//                               );
//                             }

//                             // Portfolio image
//                             return ClipRRect(
//                               borderRadius: BorderRadius.circular(8.r),
//                               child: Image.network(
//                                 portfolioImages[index],
//                                 fit: BoxFit.cover,
//                                 width: double.infinity,
//                                 height: double.infinity,
//                                 errorBuilder: (context, error, stackTrace) =>
//                                     const Icon(Icons.image_not_supported),
//                               ),
//                             );
//                           },
//                         ),
//                       ]),
// ////portfolio part end
//                   UIHelper.verticalSpace(40.h),
//                   CustomButton(
//                     padding: EdgeInsets.symmetric(vertical: 18.h),
//                     title: 'Save',
//                     style: TextFontStyle.text15cFFFFFF500,
//                     color: AppColors.allPrimaryColor,
//                     radius: BorderRadius.circular(119.r),
//                     onTap: () {
//                       formSubmit();
//                     },
//                   ),
//                   UIHelper.verticalSpace(30.h),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
///------------------------
import 'dart:developer';
import 'dart:io';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../common_widget/custom_button.dart';
import '../../../../../common_widget/custom_text_form_fild.dart';
import '../../../../../constant/text_font_style.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../helpers/navigation_service.dart';
import '../../../../../helpers/ui_helpers.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_register/model/engineer_skill_model.dart';

class EngineerEditProfileScreen extends StatefulWidget {
  const EngineerEditProfileScreen({super.key});

  @override
  State<EngineerEditProfileScreen> createState() =>
      _EngineerEditProfileScreenState();
}

class _EngineerEditProfileScreenState extends State<EngineerEditProfileScreen> {
  final engineerFastNameController = TextEditingController();
  final engineerLastNameController = TextEditingController();
  final engineerAboutController = TextEditingController();
  final engineerServiceController = TextEditingController();

  List<Data> skillList = [];
  List<Map<String, dynamic>> selectedSkills = [];
  Map<String, int> skillOptions = {};
  final ImagePicker _picker = ImagePicker();
  final ImagePicker portfoliopicked = ImagePicker();
  final List<File> _portfolioImages = [];
  // Default image if profile picture is unavailable

  @override
  void initState() {
    super.initState();
    skillapicall();
  }

  ///delete portfoilio-----------------------
  Future<bool> deletePortfolioImage(int portfolioId) async {
    try {
      bool isDeleted = await engineerPortfolioDeleteRXobj
          .engineerPortfolioDeleteRX(id: portfolioId);

      if (isDeleted) {
        ToastUtil.showShortToast("Portfolio deleted successfully");
        return true; // Return success
      } else {
        ToastUtil.showShortToast("Failed to delete portfolio");
        return false;
      }
    } catch (e) {
      log("Error deleting portfolio: $e");
      ToastUtil.showShortToast(
          "An error occurred while deleting the portfolio.");
      return false;
    }
  }

  void removePortfolioImage(int index) {
    setState(() {
      _portfolioImages.removeAt(index); // Remove image from the list
    });
  }

////skill api call call ---------------------
  Future<void> skillapicall() async {
    final response = await engineerSkillRXobj.engineerSkillRX();

    if (response != null && response.data != null) {
      setState(() {
        skillList = response.data!;
        skillOptions = {for (var skill in skillList) skill.name!: skill.id!};
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {});
    }
  }

  Future<void> portfoliopickImage() async {
    final pickedFiles =
        await portfoliopicked.pickMultiImage(); // Allow multiple image picking

    if (pickedFiles != null) {
      setState(() {
        _portfolioImages.addAll(pickedFiles.map((file) => File(file.path)));
      });
    }
  }

  XFile? _selectedProfileImage;
  Future<void> _pickProfileImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedProfileImage = pickedFile;
      });
    }
  }

  formSubmit() async {
    try {
      List<int> skillIds =
          selectedSkills.map((skill) => skill['id'] as int).toList();

      List<XFile> portfolioFiles =
          _portfolioImages.map((image) => XFile(image.path)).toList();
      log(" this is controller ${engineerFastNameController.text}");
      final result = await engineerEditProfileRXobj.engineerEditProfileRX(
        firstName: engineerFastNameController.text,
        lastName: engineerLastNameController.text,
        avatar: _selectedProfileImage!,
        service: engineerServiceController.text,
        about: engineerAboutController.text,
        skills: skillIds,
        portfolio: portfolioFiles,
      );

      if (result) {
        ToastUtil.showShortToast("Profile Updated");
      } else {
        ToastUtil.showShortToast("Failed to Update");
      }
    } catch (e) {
      log("Error during profile update: $e");
      ToastUtil.showShortToast(
          "An error occurred while updating your profile.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: StreamBuilder(
          stream: engineerProfileRXObj.dataFetcher,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(child: Text("Error loading profile data"));
            }

            if (snapshot.hasData) {
              final profileData = snapshot.data;
              final profileImageUrl = profileData?.data?.avatar ?? '';
              final firstName = profileData?.data?.firstName ?? "";
              final lastName = profileData?.data?.lastName ?? "";

              final service = profileData?.data?.service ?? "";
              final about = profileData?.data?.about ?? "";

              final portfolioImages = profileData?.data?.portfolios
                      ?.map((portfolio) =>
                          portfolio.image ??
                          Assets.icons.personPlaceholder.path)
                      .toList() ??
                  [];

              // Populate text controllers
              engineerFastNameController.text = firstName;
              engineerLastNameController.text = lastName;
              engineerServiceController.text = service;
              engineerAboutController.text = about;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIHelper.verticalSpace(60.h),

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
                              'Edit Profile',
                              textAlign: TextAlign.center,
                              style: TextFontStyle.text25allPrimaryColorTextw700
                                  .copyWith(fontSize: 22.sp),
                            ),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpace(33.h),

                      /// Profile Image Section
                      Center(
                        child: GestureDetector(
                          onTap:
                              _pickProfileImage, // Use the _pickProfileImage method here
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 60.r,
                                backgroundImage: _selectedProfileImage != null
                                    ? FileImage(File(_selectedProfileImage!
                                        .path)) // Ensure it uses the correct path
                                    : (profileImageUrl != null &&
                                            profileImageUrl!.isNotEmpty)
                                        ? NetworkImage(profileImageUrl!)
                                        : AssetImage(Assets
                                            .icons.personPlaceholder.path),
                              ),

                              // Profile Image Edit Icon
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      UIHelper.verticalSpace(33.h),

                      Row(
                        children: [
                          Text('First Name',
                              style: TextFontStyle.text14allPrimaryColorTexts),
                          UIHelper.horizontalSpace(110.w),
                          Text('Last Name',
                              style: TextFontStyle.text14allPrimaryColorTexts),
                        ],
                      ),
                      UIHelper.verticalSpace(7.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: CustomTextFormFild(
                              hintText: "Enter First Name",
                              textStyle: TextFontStyle.text15cABABABinter400,
                              controller: engineerFastNameController,
                            ),
                          ),
                          UIHelper.horizontalSpace(15.w),
                          Expanded(
                            flex: 1,
                            child: CustomTextFormFild(
                              hintText: "Enter Last Name",
                              textStyle: TextFontStyle.text15cABABABinter400,
                              controller: engineerLastNameController,
                            ),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpace(20.h),

                      Text('Service',
                          style: TextFontStyle.text14allPrimaryColorTexts),
                      UIHelper.verticalSpace(11.h),
                      CustomTextFormFild(
                        hintText: "Service",
                        textStyle: TextFontStyle.text15cABABABinter400,
                        controller: engineerServiceController,
                      ),
                      UIHelper.verticalSpace(20.h),
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
                                enabled: false,
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
                            onChanged: (_) {}, // Not needed
                          ),
                        ],
                      ),
                      UIHelper.verticalSpace(20.h),
                      Text(
                        'About',
                        style: TextFontStyle.text14allPrimaryColorTexts,
                      ),
                      UIHelper.verticalSpace(8.h),
                      TextFormField(
                        maxLines: 5,
                        maxLength: 30,
                        controller: engineerAboutController,
                        decoration: InputDecoration(
                          hintText: 'About ',
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
                      ),

////----Service
                      UIHelper.verticalSpace(8.h),

                      UIHelper.verticalSpace(40.h),

////----------------portfolio part

                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Portfolio',
                              style: TextFontStyle.text14allPrimaryColorTexts,
                            ),
                            UIHelper.verticalSpace(10.h),
                            GridView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: portfolioImages.length +
                                  _portfolioImages.length +
                                  1,
                              itemBuilder: (context, index) {
                                if (index ==
                                    portfolioImages.length +
                                        _portfolioImages.length) {
                                  // "Add" button at the end
                                  return GestureDetector(
                                    onTap: portfoliopickImage,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(color: Colors.grey),
                                        color: Colors.grey[200],
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.add,
                                            size: 40, color: Colors.black54),
                                      ),
                                    ),
                                  );
                                }

                                bool isFromApi = index < portfolioImages.length;
                                String imageUrl = isFromApi
                                    ? portfolioImages[index] // API Image
                                    : _portfolioImages[
                                            index - portfolioImages.length]
                                        .path; // Local Image

                                return Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: isFromApi
                                          ? Image.network(
                                              imageUrl,
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  const Icon(Icons
                                                      .image_not_supported),
                                            )
                                          : Image.file(
                                              File(imageUrl),
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                            ),
                                    ),

                                    // Positioned(
                                    //   top: 5,
                                    //   right: 5,
                                    //   child: GestureDetector(
                                    //     onTap: () {
                                    //       if (index < portfolioImages.length) {
                                    //         // Get the portfolio ID from API data
                                    //         int? portfolioId = profileData
                                    //             ?.data?.portfolios?[index].id;
                                    //         if (portfolioId != null) {
                                    //           log("Deleting API image with index: $index, ID: $portfolioId");

                                    //           deletePortfolioImage(
                                    //               portfolioId);
                                    //         }
                                    //       } else {
                                    //         int localImageIndex =
                                    //             index - portfolioImages.length;
                                    //         log("Deleting local image with index: $localImageIndex");
                                    //         setState(() {
                                    //           removePortfolioImage(localImageIndex);
                                    //         });
                                    //       }
                                    //     },
                                    //     child: const CircleAvatar(
                                    //       radius: 12,
                                    //       backgroundColor: Colors.red,
                                    //       child: Icon(Icons.close,
                                    //           size: 14, color: Colors.white),
                                    //     ),
                                    //   ),
                                    // ),

                                    Positioned(
                                      top: 5,
                                      right: 5,
                                      child: GestureDetector(
                                        onTap: () async {
                                          if (index < portfolioImages.length) {
                                            int? portfolioId = profileData
                                                ?.data?.portfolios?[index].id;
                                            if (portfolioId != null) {
                                              log("Deleting API image with index: $index, ID: $portfolioId");

                                              bool isDeleted =
                                                  await deletePortfolioImage(
                                                      portfolioId);
                                              if (isDeleted) {
                                                setState(() {
                                                  profileData?.data?.portfolios
                                                      ?.removeAt(index);
                                                  portfolioImages
                                                      .removeAt(index);
                                                });
                                              }
                                            }
                                          } else {
                                            int localImageIndex =
                                                index - portfolioImages.length;
                                            log("Deleting local image with index: $localImageIndex");
                                            setState(() {
                                              removePortfolioImage(
                                                  localImageIndex);
                                            });
                                          }
                                        },
                                        child: const CircleAvatar(
                                          radius: 12,
                                          backgroundColor: Colors.red,
                                          child: Icon(Icons.close,
                                              size: 14, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ]),
////portfolio part end
                      UIHelper.verticalSpace(40.h),
                      CustomButton(
                        padding: EdgeInsets.symmetric(vertical: 18.h),
                        title: 'Save',
                        style: TextFontStyle.text15cFFFFFF500,
                        color: AppColors.allPrimaryColor,
                        radius: BorderRadius.circular(119.r),
                        onTap: () {
                          formSubmit();
                        },
                      ),
                      UIHelper.verticalSpace(30.h),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                  child: Text(
                'Error: No data',
              ));
            }
          }),
    );
  }
}
