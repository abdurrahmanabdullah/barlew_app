// import 'package:barlew_app/common_widget/custom_button.dart';
// import 'package:barlew_app/common_widget/custom_form_field.dart';
// import 'package:barlew_app/constant/text_font_style.dart';
// import 'package:barlew_app/gen/colors.gen.dart';
// import 'package:barlew_app/helpers/all_routes.dart';
// import 'package:barlew_app/helpers/navigation_service.dart';
// import 'package:barlew_app/helpers/toast.dart';
// import 'package:barlew_app/helpers/ui_helpers.dart';
// import 'package:barlew_app/networks/api_access.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CardInfoBottomSheet extends StatefulWidget {
//   const CardInfoBottomSheet({
//     super.key,
//   });

//   @override
//   State<CardInfoBottomSheet> createState() => _CardInfoBottomSheetState();
// }

// class _CardInfoBottomSheetState extends State<CardInfoBottomSheet> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController numberController = TextEditingController();
//   TextEditingController expiryDateController = TextEditingController();
//   TextEditingController cvvController = TextEditingController();
//   TextEditingController amountController = TextEditingController();
//   @override
//   void dispose() {
//     nameController.dispose();
//     numberController.dispose();
//     expiryDateController.dispose();
//     cvvController.dispose();
//     amountController.dispose();
//     super.dispose();
//   }

// Future<void> engineersignupMethod({required int bankDetails, required double amount}) async {
//   try {
//     // Call the API with the dynamic parameters (e.g., bankDetails, amount)
//     bool isSignedUp = await engineerWithdrawlRequestRXobj.engineerWithdrawlRequestRX(
//       bankDetails: 6,
//       amount: 9,
//     );

//     if (isSignedUp) {
//       ToastUtil.showShortToast("Signup successful!");
//     } else {
//       ToastUtil.showShortToast("Signup failed. Please try again.");
//     }
//   } catch (e) {
//     ToastUtil.showShortToast("Signup failed: ${e.toString()}");
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.72, // Start height as a fraction of screen height
//       minChildSize: 0.13, // Minimum height as a fraction
//       maxChildSize: 0.72, // Maximum height as a fraction
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
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 UIHelper.verticalSpace(33.h),
//                 Text(
//                   "Card Holder",
//                   style:
//                       TextFontStyle.text15c192A48400.copyWith(fontSize: 16.sp),
//                 ),
//                 UIHelper.verticalSpace(8.h),
//                 CommonTextFormField(
//                   controller: nameController,
//                   isPrefixIcon: false,
//                   fillColor: AppColors.cFFFFFF,
//                   borderRadius: 8.r,
//                   borderColor: AppColors.broderColor,
//                   focusBorderColor: AppColors.broderColor,
//                   textInputStyle: TextFontStyle.text145192A48w500roboto
//                       .copyWith(fontSize: 16.sp),
//                 ),
//                 UIHelper.verticalSpace(12.h),
//                 Text(
//                   "Card Number",
//                   style:
//                       TextFontStyle.text15c192A48400.copyWith(fontSize: 16.sp),
//                 ),
//                 UIHelper.verticalSpace(8.h),
//                 CommonTextFormField(
//                   controller: numberController,
//                   isPrefixIcon: false,
//                   fillColor: AppColors.cFFFFFF,
//                   borderRadius: 8.r,
//                   borderColor: AppColors.broderColor,
//                   focusBorderColor: AppColors.broderColor,
//                   textInputStyle: TextFontStyle.text145192A48w500roboto
//                       .copyWith(fontSize: 16.sp),
//                 ),
//                 UIHelper.verticalSpace(12.h),
//                 Text(
//                   "Expiry Date",
//                   style:
//                       TextFontStyle.text15c192A48400.copyWith(fontSize: 16.sp),
//                 ),
//                 UIHelper.verticalSpace(8.h),
//                 CommonTextFormField(
//                   controller: expiryDateController,
//                   isPrefixIcon: false,
//                   fillColor: AppColors.cFFFFFF,
//                   borderRadius: 8.r,
//                   borderColor: AppColors.broderColor,
//                   focusBorderColor: AppColors.broderColor,
//                   textInputStyle: TextFontStyle.text145192A48w500roboto
//                       .copyWith(fontSize: 16.sp),
//                 ),
//                 UIHelper.verticalSpace(12.h),
//                 Text(
//                   "CVV",
//                   style:
//                       TextFontStyle.text15c192A48400.copyWith(fontSize: 16.sp),
//                 ),
//                 UIHelper.verticalSpace(8.h),
//                 CommonTextFormField(
//                   controller: cvvController,
//                   isPrefixIcon: false,
//                   fillColor: AppColors.cFFFFFF,
//                   borderRadius: 8.r,
//                   borderColor: AppColors.broderColor,
//                   focusBorderColor: AppColors.broderColor,
//                   textInputStyle: TextFontStyle.text145192A48w500roboto
//                       .copyWith(fontSize: 16.sp),
//                 ),
//                 UIHelper.verticalSpace(12.h),
//                 Text(
//                   "Amount",
//                   style:
//                       TextFontStyle.text15c192A48400.copyWith(fontSize: 16.sp),
//                 ),
//                 UIHelper.verticalSpace(8.h),
//                 CommonTextFormField(
//                   controller: amountController,
//                   isPrefixIcon: false,
//                   fillColor: AppColors.cFFFFFF,
//                   borderRadius: 8.r,
//                   borderColor: AppColors.broderColor,
//                   focusBorderColor: AppColors.broderColor,
//                   textInputStyle: TextFontStyle.text145192A48w500roboto
//                       .copyWith(fontSize: 16.sp),
//                 ),
//                 UIHelper.verticalSpace(32.h),
//                 CustomButton(
//                   title: "Confirm",
//                   onTap: () {
//                     NavigationService.navigateTo(Routes.withdrawsuccess);
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
///--------------------------
import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/common_widget/custom_form_field.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardInfoBottomSheet extends StatefulWidget {
  const CardInfoBottomSheet({
    super.key,
  });

  @override
  State<CardInfoBottomSheet> createState() => _CardInfoBottomSheetState();
}

class _CardInfoBottomSheetState extends State<CardInfoBottomSheet> {
  TextEditingController bankDetailsController = TextEditingController();

  TextEditingController amountController = TextEditingController();
  @override
  void dispose() {
    bankDetailsController.dispose();

    amountController.dispose();
    super.dispose();
  }

  Future<bool> engineersWithDrawalRequest() async {
    try {
      bool isWithdrawl =
          await engineerWithdrawlRequestRXobj.engineerWithdrawlRequestRX(
        bankDetails: int.parse(bankDetailsController.text),
        amount: int.parse(amountController.text),
      );

      if (isWithdrawl) {
        ToastUtil.showShortToast("Withdrawal successful!");
        return true; // Return true if withdrawal is successful
      } else {
        ToastUtil.showShortToast("Withdrawal failed. Please try again.");
        return false; // Return false if withdrawal fails
      }
    } catch (e) {
      // Handle errors and return false
      ToastUtil.showShortToast("Withdrawal failed: ${e.toString()}");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.72, // Start height as a fraction of screen height
      minChildSize: 0.13, // Minimum height as a fraction
      maxChildSize: 0.72, // Maximum height as a fraction
      expand: false, // Prevents full-screen expansion
      shouldCloseOnMinExtent: false,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.r),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController, // Attach scroll controller
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.verticalSpace(33.h),
                Text(
                  "Bank  Details",
                  style:
                      TextFontStyle.text15c192A48400.copyWith(fontSize: 16.sp),
                ),
                UIHelper.verticalSpace(8.h),
                CommonTextFormField(
                  controller: bankDetailsController,
                  isPrefixIcon: false,
                  fillColor: AppColors.cFFFFFF,
                  borderRadius: 8.r,
                  borderColor: AppColors.broderColor,
                  focusBorderColor: AppColors.broderColor,
                  textInputStyle: TextFontStyle.text145192A48w500roboto
                      .copyWith(fontSize: 16.sp),
                ),
                UIHelper.verticalSpace(12.h),
                Text(
                  "Amount",
                  style:
                      TextFontStyle.text15c192A48400.copyWith(fontSize: 16.sp),
                ),
                UIHelper.verticalSpace(8.h),
                CommonTextFormField(
                  controller: amountController,
                  isPrefixIcon: false,
                  fillColor: AppColors.cFFFFFF,
                  borderRadius: 8.r,
                  borderColor: AppColors.broderColor,
                  focusBorderColor: AppColors.broderColor,
                  textInputStyle: TextFontStyle.text145192A48w500roboto
                      .copyWith(fontSize: 16.sp),
                ),
                UIHelper.verticalSpace(32.h),
                CustomButton(
                  title: "Confirm",
                  onTap: () async {
                    // Call the withdrawal request method
                    bool isWithdrawl = await engineersWithDrawalRequest();

                    // Check if the withdrawal was successful
                    if (isWithdrawl) {
                      // If successful, navigate to the withdrawal success page
                      NavigationService.navigateTo(Routes.withdrawsuccess);
                    } else {
                      // Show a failure message if the withdrawal failed
                      ToastUtil.showShortToast(
                          "Withdrawal failed. Please try again.");
                    }
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
