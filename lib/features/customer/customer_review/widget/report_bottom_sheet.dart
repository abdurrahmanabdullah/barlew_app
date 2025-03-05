// import 'package:barlew_app/common_widget/custom_button.dart';
// import 'package:barlew_app/common_widget/custom_button_two.dart';
// import 'package:barlew_app/common_widget/custom_form_field.dart';
// import 'package:barlew_app/constant/text_font_style.dart';
// import 'package:barlew_app/gen/colors.gen.dart';
// import 'package:barlew_app/helpers/all_routes.dart';
// import 'package:barlew_app/helpers/navigation_service.dart';
// import 'package:barlew_app/helpers/ui_helpers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ReportBottomSheet extends StatefulWidget {
//   const ReportBottomSheet({
//     super.key,
//   });

//   @override
//   State<ReportBottomSheet> createState() => _ReportBottomSheetState();
// }

// class _ReportBottomSheetState extends State<ReportBottomSheet> {
//   double _valeu = 0; // Initial value for radio button
//   int _selectedButtonIndex = -1;
//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.52, // Start height as a fraction of screen height
//       minChildSize: 0.13, // Minimum height as a fraction
//       maxChildSize: 0.52, // Maximum height as a fraction
//       expand: false, // Prevents full-screen expansion
//       shouldCloseOnMinExtent: false,
//       builder: (context, scrollController) {
//         return Container(
//           padding: EdgeInsets.symmetric(horizontal: 20.h),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(
//               top: Radius.circular(20.r),
//             ),
//           ),
//           child: SingleChildScrollView(
//             controller: scrollController, // Attach scroll controller
//             child: Column(
//               children: [
//                 UIHelper.verticalSpace(44.h),
//                 CustomButtonTow(
//                   color: _selectedButtonIndex == 0
//                       ? AppColors.allPrimaryColor
//                       : AppColors.cFFFFFF,
//                   padding: const EdgeInsets.symmetric(vertical: 3),
//                   onTap: () {
//                     setState(() {
//                       _selectedButtonIndex = 0;
//                       _valeu = 1;
//                     });
//                   },
//                   border: Border.all(
//                       width: 1,
//                       color: _selectedButtonIndex == 0
//                           ? Colors.transparent
//                           : AppColors.broderColor),
//                   title: Row(
//                     children: [
//                       Radio<double>(
//                         activeColor: Colors.white,
//                         value: 1,
//                         groupValue: _valeu,
//                         onChanged: (value) {
//                           setState(() {
//                             _valeu = value!;
//                           });
//                         },
//                       ),
//                       Text(
//                         'Report an issue',
//                         style: TextStyle(
//                           color: _selectedButtonIndex == 0
//                               ? Colors.white
//                               : Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 UIHelper.verticalSpace(11.h),
//                 CustomButtonTow(
//                   color: _selectedButtonIndex == 1
//                       ? AppColors.allPrimaryColor
//                       : AppColors.cFFFFFF,
//                   padding: const EdgeInsets.symmetric(vertical: 3),
//                   onTap: () {
//                     setState(() {
//                       _selectedButtonIndex = 1;
//                       _valeu = 2;
//                     });
//                   },
//                   border: Border.all(
//                       width: 1,
//                       color: _selectedButtonIndex == 1
//                           ? Colors.transparent
//                           : AppColors.broderColor),
//                   title: Row(
//                     children: [
//                       Radio<double>(
//                         activeColor: Colors.white,
//                         value: 2,
//                         groupValue: _valeu,
//                         onChanged: (value) {
//                           setState(() {
//                             _valeu = value!;
//                           });
//                         },
//                       ),
//                       Text(
//                         'Some thing else',
//                         style: TextStyle(
//                           color: _selectedButtonIndex == 1
//                               ? Colors.white
//                               : Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 UIHelper.verticalSpace(16.h),
//                 Row(
//                   children: [
//                     Text(
//                       "Describe",
//                       style: TextFontStyle.text14c444B5Bw500,
//                     ),
//                   ],
//                 ),
//                 UIHelper.verticalSpace(8.h),
//                 Container(
//                   height: 120.h,
//                   decoration: BoxDecoration(
//                       color: AppColors.cFFFFFF,
//                       border:
//                           Border.all(width: 1.w, color: AppColors.broderColor),
//                       borderRadius: BorderRadius.circular(12.r)),
//                   child: Padding(
//                     padding: EdgeInsets.all(5.sp),
//                     child: CommonTextFormField(
//                       isPrefixIcon: false,
//                       fillColor: AppColors.cFFFFFF,
//                       borderColor: Colors.transparent,
//                       focusBorderColor: Colors.transparent,
//                       textInputStyle: TextFontStyle.text14c444B5Bw500,
//                       hintText:
//                           "Describe Issue",
//                       maxline: 4,
//                     ),
//                   ),
//                 ),
//                 UIHelper.verticalSpace(40.h),
//                 CustomButton(
//                   title: "Submit",
//                   onTap: () {
//                     NavigationService.navigateTo(Routes.navigationsBarScreen);
//                   },
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
///---------------
import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/common_widget/custom_button_two.dart';
import 'package:barlew_app/common_widget/custom_form_field.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/colors.gen.dart';

import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportBottomSheet extends StatefulWidget {
  const ReportBottomSheet({super.key});

  @override
  State<ReportBottomSheet> createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends State<ReportBottomSheet> {
  double _valeu = 0; // Initial value for radio button
  int _selectedButtonIndex = -1;
////// submit the issue
  bool _isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();
  Future<void> submitreportissue() async {
    try {
      print("Submitting description: ${_descriptionController.text}");
      await engineerReportRXobj
          .engineerReportRX(
        discussionrequestid: 43,
        type: 'issues',
        description: _descriptionController.text.trim(),
      )
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ToastUtil.showShortToast(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1.0,
      minChildSize: 1.0, // Keeps it at the same height as max
      maxChildSize: 1.0, // Fully expanded bottom sheet
      expand: true, // Automatically expands
      builder: (context, scrollController) {
        return SingleChildScrollView(
          child: Container(
            height: 500.w,
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.r),
              ),
            ),
            child: Column(
              children: [
                UIHelper.verticalSpace(44.h),
                CustomButtonTow(
                  color: _selectedButtonIndex == 0
                      ? AppColors.allPrimaryColor
                      : AppColors.cFFFFFF,
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  onTap: () {
                    setState(() {
                      _selectedButtonIndex = 0;
                      _valeu = 1;
                    });
                  },
                  border: Border.all(
                    width: 1,
                    color: _selectedButtonIndex == 0
                        ? Colors.transparent
                        : AppColors.broderColor,
                  ),
                  title: Row(
                    children: [
                      Radio<double>(
                        activeColor: Colors.white,
                        value: 1,
                        groupValue: _valeu,
                        onChanged: (value) {
                          setState(() {
                            _valeu = value!;
                          });
                        },
                      ),
                      Text(
                        'Report an issue',
                        style: TextStyle(
                          color: _selectedButtonIndex == 0
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(11.h),
                CustomButtonTow(
                  color: _selectedButtonIndex == 1
                      ? AppColors.allPrimaryColor
                      : AppColors.cFFFFFF,
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  onTap: () {
                    setState(() {
                      _selectedButtonIndex = 1;
                      _valeu = 2;
                    });
                  },
                  border: Border.all(
                    width: 1,
                    color: _selectedButtonIndex == 1
                        ? Colors.transparent
                        : AppColors.broderColor,
                  ),
                  title: Row(
                    children: [
                      Radio<double>(
                        activeColor: Colors.white,
                        value: 2,
                        groupValue: _valeu,
                        onChanged: (value) {
                          setState(() {
                            _valeu = value!;
                          });
                        },
                      ),
                      Text(
                        'Something else',
                        style: TextStyle(
                          color: _selectedButtonIndex == 1
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Row(
                  children: [
                    Text(
                      "Describe",
                      style: TextFontStyle.text14c444B5Bw500,
                    ),
                  ],
                ),
                UIHelper.verticalSpace(8.h),
                Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: AppColors.cFFFFFF,
                    border:
                        Border.all(width: 1.w, color: AppColors.broderColor),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: CommonTextFormField(
                      controller: _descriptionController,
                      isPrefixIcon: false,
                      fillColor: AppColors.cFFFFFF,
                      borderColor: Colors.transparent,
                      focusBorderColor: Colors.transparent,
                      textInputStyle: TextFontStyle.text14c444B5Bw500,
                      hintText: "Describe Issue",
                      maxline: 4,
                    ),
                  ),
                ),
                UIHelper.verticalSpace(40.h),
                CustomButton(
                  title: "Submit",
                  onTap: () {
                    // NavigationService.navigateTo(Routes.navigationsBarScreen);
                    submitreportissue();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
