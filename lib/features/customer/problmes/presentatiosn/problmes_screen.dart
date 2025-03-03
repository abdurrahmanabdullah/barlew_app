// import 'dart:io';
// import 'package:barlew_app/constant/text_font_style.dart';
// import 'package:barlew_app/features/customer/problmes/presentatiosn/widgets/image_picker_controller.dart';
// import 'package:barlew_app/gen/colors.gen.dart';
// import 'package:barlew_app/helpers/all_routes.dart';
// import 'package:barlew_app/helpers/navigation_service.dart';
// import 'package:barlew_app/helpers/toast.dart';
// import 'package:barlew_app/helpers/ui_helpers.dart';
// import 'package:barlew_app/networks/api_access.dart';
// import 'package:barlew_app/provider/selected_answer_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';

// import '../../../../common_widget/custom_button_two.dart';
// import '../../../../gen/assets.gen.dart';

// class ProblemsScreen extends StatefulWidget {
//   const ProblemsScreen({super.key});

//   @override
//   State<ProblemsScreen> createState() => _ProblemsScreenState();
// }

// class _ProblemsScreenState extends State<ProblemsScreen> {
//   final descriptionController = TextEditingController();
//   final ImagePickerController controller = Get.put(ImagePickerController());

//   formSubmit(SelectedAnswersModel selectedAnswersModel) async {
//     final result = await submitProblemRXobj.submitProblemRX(
//         serviceId: selectedAnswersModel.serviceID ?? 0,
//         description: descriptionController.text,
//         questionId: selectedAnswersModel.selectedQuestions,
//         answerId: selectedAnswersModel.selectedAnswers,
//         images: controller.pickedFiles,
//         skills: [7]);

//     if (result) {
//       ToastUtil.showShortToast("submit success");
//     } else {
//       ToastUtil.showShortToast("submit failed");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final selectedAnswers =
//         Provider.of<SelectedAnswersModel>(context).selectedAnswers;
//     final selectedQuestion =
//         Provider.of<SelectedAnswersModel>(context).selectedQuestions;
//     final serviceID =
//         Provider.of<SelectedAnswersModel>(context).serviceID.toString();
//     print("Selected id: $serviceID");
//     // Print the selected answers for debugging
//     print("Selected Answer: $selectedAnswers");
//     print("Selected Question: $selectedQuestion");

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFF5F5F5),
//         centerTitle: true,
//         elevation: 0,
//         title: Text(
//           'Boiler Pressure',
//           style: TextFontStyle.text20cprimarycolorw500,
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       backgroundColor: const Color(0xFFF5F5F5),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.h),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               UIHelper.verticalSpace(9.h),
//               Text(
//                 'Please, Add Your Problem and Picture',
//                 style: TextFontStyle.text20cprimarycolorw500.copyWith(
//                   fontSize: 20.sp,
//                 ),
//               ),
//               UIHelper.verticalSpace(22.h),
//               Text(
//                 'Description',
//                 style: TextFontStyle.text16cc45536Bw500,
//               ),
//               UIHelper.verticalSpace(15.h),

//               // TextFormField for description
//               TextFormField(
//                 maxLines: 5,
//                 maxLength: 15,
//                 controller: descriptionController,
//                 decoration: InputDecoration(
//                   hintText: 'Describe your problem...',
//                   hintStyle: TextFontStyle.text15cc45536Bw400,
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.r),
//                     borderSide:
//                         BorderSide(color: AppColors.broderColor, width: 1.w),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.r),
//                     borderSide:
//                         BorderSide(color: AppColors.broderColor, width: 1.w),
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.r),
//                     borderSide:
//                         BorderSide(color: AppColors.broderColor, width: 1.w),
//                   ),
//                   errorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.r),
//                     borderSide: BorderSide(color: Colors.red, width: 1.w),
//                   ),
//                 ),
//               ),
//               UIHelper.verticalSpace(22.h),

//               // Multi-Image Picker Section
//               Obx(() {
//                 return GridView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                   ),
//                   itemCount: controller.imagePaths.length + 1,
//                   itemBuilder: (context, index) {
//                     if (index == controller.imagePaths.length) {
//                       // Add Image Button
//                       return GestureDetector(
//                         onTap: controller.pickMultipleImages,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: AppColors.c626262,
//                             borderRadius: BorderRadius.circular(8.r),
//                           ),
//                           child: Transform.scale(
//                             scale: 0.4,
//                             child: Image.asset(
//                               Assets.icons.plus.path,
//                             ),
//                           ),
//                         ),
//                       );
//                     }
//                     // Display Selected Image with Remove Icon
//                     return Stack(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(8.r),
//                           child: Image.file(
//                             File(controller.imagePaths[index]),
//                             fit: BoxFit.cover,
//                             width: double.infinity,
//                             height: double.infinity,
//                           ),
//                         ),
//                         Positioned(
//                           top: 5,
//                           right: 5,
//                           child: GestureDetector(
//                             onTap: () => controller.removeImage(index),
//                             child: Container(
//                               decoration: const BoxDecoration(
//                                 color: Colors.black54,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(
//                                 Icons.close,
//                                 color: Colors.white,
//                                 size: 20,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               }),
//               UIHelper.verticalSpace(170.h),

//               // Next Button to trigger submission
//               Consumer<SelectedAnswersModel>(
//                 builder: (BuildContext context, provider, Widget? child) {
//                   return CustomButtonTow(
//                     onTap: () {
//                       formSubmit(provider);

//                       NavigationService.navigateTo(Routes.engineerLevelScreen);
//                     }, // Call the method here
//                     title: Text(
//                       'Next',
//                       style: TextFontStyle.text15cFFFFFF500,
//                     ),
//                     color: AppColors.allPrimaryColor,
//                     padding: EdgeInsets.symmetric(vertical: 18.h),
//                     radius: BorderRadius.circular(111.r),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
///----------------------

import 'dart:io';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/customer/problmes/presentatiosn/widgets/image_picker_controller.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/provider/selected_answer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../common_widget/custom_button_two.dart';
import '../../../../gen/assets.gen.dart';

class ProblemsScreen extends StatefulWidget {
  const ProblemsScreen({super.key});

  @override
  State<ProblemsScreen> createState() => _ProblemsScreenState();
}

class _ProblemsScreenState extends State<ProblemsScreen> {
  final descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ImagePickerController controller = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    final selectedAnswers =
        Provider.of<SelectedAnswersModel>(context).selectedAnswers;
    final selectedQuestion =
        Provider.of<SelectedAnswersModel>(context).selectedQuestions;
    final serviceID =
        Provider.of<SelectedAnswersModel>(context).serviceID.toString();
    print("Selected id: $serviceID");
    // Print the selected answers for debugging
    print("Selected Answer: $selectedAnswers");
    print("Selected Question: $selectedQuestion");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Boiler Pressure',
          style: TextFontStyle.text20cprimarycolorw500,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.h),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.verticalSpace(9.h),
                Text(
                  'Please, Add Your Problem and Picture',
                  style: TextFontStyle.text20cprimarycolorw500.copyWith(
                    fontSize: 20.sp,
                  ),
                ),
                UIHelper.verticalSpace(22.h),
                Text(
                  'Description',
                  style: TextFontStyle.text16cc45536Bw500,
                ),
                UIHelper.verticalSpace(15.h),

                // TextFormField for description
                TextFormField(
                  maxLines: 5,
                  maxLength: 15,
                  controller: descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Describe your problem...',
                    hintStyle: TextFontStyle.text15cc45536Bw400,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide:
                          BorderSide(color: AppColors.broderColor, width: 1.w),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide:
                          BorderSide(color: AppColors.broderColor, width: 1.w),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide:
                          BorderSide(color: AppColors.broderColor, width: 1.w),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: Colors.red, width: 1.w),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(22.h),

                // Multi-Image Picker Section
                Obx(() {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: controller.imagePaths.length + 1,
                    itemBuilder: (context, index) {
                      if (index == controller.imagePaths.length) {
                        // Add Image Button
                        return GestureDetector(
                          onTap: controller.pickMultipleImages,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.c626262,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Transform.scale(
                              scale: 0.4,
                              child: Image.asset(
                                Assets.icons.plus.path,
                              ),
                            ),
                          ),
                        );
                      }
                      // Display Selected Image with Remove Icon
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Image.file(
                              File(controller.imagePaths[index]),
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: GestureDetector(
                              onTap: () => controller.removeImage(index),
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
                }),
                UIHelper.verticalSpace(170.h),

                // Next Button to trigger submission
                Consumer<SelectedAnswersModel>(
                  builder: (BuildContext context, provider, Widget? child) {
                    return CustomButtonTow(
                      onTap: () {
                        if (_formKey.currentState?.validate() == true &&
                            controller.pickedFiles.isNotEmpty) {
                          NavigationService.navigateToWithArgs(
                            Routes.engineerLevelScreen,
                            {
                              "imageList": controller.pickedFiles,
                              "description": descriptionController.text,
                            },
                          );
                        } else {
                          ToastUtil.showShortToast("please select image");
                        }
                      },
                      title: Text(
                        'Next',
                        style: TextFontStyle.text15cFFFFFF500,
                      ),
                      color: AppColors.allPrimaryColor,
                      padding: EdgeInsets.symmetric(vertical: 18.h),
                      radius: BorderRadius.circular(111.r),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
