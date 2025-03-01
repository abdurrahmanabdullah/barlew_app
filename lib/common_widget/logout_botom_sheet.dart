// import 'package:barlew_app/common_widget/custom_button.dart';
// import 'package:barlew_app/constant/text_font_style.dart';
// import 'package:barlew_app/gen/colors.gen.dart';
// import 'package:barlew_app/helpers/navigation_service.dart';
// import 'package:barlew_app/helpers/ui_helpers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: unused_element

import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/constant/app_constants.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_logout/logout_botom_sheet.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/di.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../helpers/all_routes.dart';

// class CustomBottomSheet extends StatefulWidget {
//   const CustomBottomSheet({super.key});

//   @override
//   State<CustomBottomSheet> createState() => _CustomBottomSheetState();
// }

// class _CustomBottomSheetState extends State<CustomBottomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding: EdgeInsets.symmetric(vertical: 15.h),

//       width: double.infinity,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(22.r), topLeft: Radius.circular(22.r))),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 33.h),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 'Log Out',
//                 style: TextFontStyle.text25c192A48w600roboto,
//               ),
//               const Divider(
//                 color: AppColors.cF4F4F4,
//               ),
//               UIHelper.verticalSpace(30.h),
//               Text(
//                 'Are You Sure you Want to log out',
//                 style: TextFontStyle.text16cc373E4Ew500roboto,
//               ),
//               UIHelper.verticalSpace(32.h),
//               Row(
//                 children: [
//                   Expanded(
//                       child: CustomButton(
//                     onTap: () {
//                       NavigationService.goBack;
//                     },
//                     title: 'Cancel',
//                     style: TextFontStyle.text17cc373E4Ew500roboto,
//                     radius: BorderRadius.circular(111.r),
//                     color: AppColors.cFFFFFF,
//                     border: Border.all(color: AppColors.c143D8C, width: 1),
//                     padding: EdgeInsets.symmetric(vertical: 11.h),
//                   )),
//                   UIHelper.horizontalSpace(20.w),
//                   Expanded(
//                     child: CustomButton(
//                       onTap: () {
//                         NavigationService.navigateTo(Routes.loginScreen);
//                       },
//                       title: 'Yes , log out',
//                       style: TextFontStyle.text16cFFFFFF500,
//                       radius: BorderRadius.circular(111.r),
//                       color: AppColors.allprimaryColor2,
//                       padding: EdgeInsets.symmetric(vertical: 13.h),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class _CustomBottomSheetState extends State<CustomBottomSheet> {
//   // ignore: unused_field
//   bool _isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding: EdgeInsets.symmetric(vertical: 15.h),

//       width: double.infinity,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(22.r), topLeft: Radius.circular(22.r))),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18.0.w),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               UIHelper.verticalSpace(30.h),
//               Text(
//                 'Log Out',
//                 style: TextFontStyle.text25c192A48w600roboto,
//               ),
//               const Divider(
//                 color: AppColors.cF4F4F4,
//               ),
//               UIHelper.verticalSpace(30.h),
//               Text(
//                 'Are You Sure you Want to log out',
//                 style: TextFontStyle.text16cc373E4Ew500roboto,
//               ),
//               UIHelper.verticalSpace(32.h),
//               Row(
//                 children: [
//                   Expanded(
//                       child: CustomButton(
//                     onTap: () {
//                       NavigationService.goBack;
//                     },
//                     title: 'Cancel',
//                     style: TextFontStyle.text17cc373E4Ew500roboto,
//                     radius: BorderRadius.circular(111.r),
//                     color: AppColors.cFFFFFF,
//                     border: Border.all(color: AppColors.c143D8C, width: 1),
//                     padding: EdgeInsets.symmetric(vertical: 11.h),
//                   )),
//                   UIHelper.horizontalSpace(20.w),
//                   Expanded(
//                     child: CustomButton(
//                       onTap: () async {
//                         setState(() {
//                           _isLoading = true;
//                         });
//                         customerLogoutRxObj.customerlogoutRx().then(
//                           (value) async {
//                             if (value) {
//                               ToastUtil.showShortToast("Logout successfully.");
//                               await appData.write(kKeyIsLoggedIn, false);
//                               await appData.write(kKeyAccessToken, '');
//                               setState(() {
//                                 _isLoading = true;
//                               });
//                               NavigationService.navigateToUntilReplacement(
//                                   Routes.loginScreen);
//                             } else {
//                               setState(() {
//                                 _isLoading = true;
//                               });
//                               ToastUtil.showShortToast("Failed to logout.");
//                             }
//                           },
//                         );
//                       },
//                       title: 'Yes , log out',
//                       style: TextFontStyle.text16cFFFFFF500,
//                       radius: BorderRadius.circular(111.r),
//                       color: AppColors.allprimaryColor2,
//                       padding: EdgeInsets.symmetric(vertical: 13.h),
//                     ),
//                   ),
//                 ],
//               ),
//               UIHelper.verticalSpace(60.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
