import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/common_widget/custom_form_field.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentInformationScreen extends StatefulWidget {
  const PaymentInformationScreen({super.key});

  @override
  State<PaymentInformationScreen> createState() => _PaymentInformationScreenState();
}

class _PaymentInformationScreenState extends State<PaymentInformationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF2F4F7,
      appBar: AppBar(
        backgroundColor: AppColors.cF2F4F7,
        title: Text(
          "Payment",
          style:
              TextFontStyle.text17c192A48500robotos.copyWith(fontSize: 22.sp),
        ),
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpace(50.h),
              Text(
                "Card Number",
                style: TextFontStyle.text15c192A48400.copyWith(fontSize: 16.sp),
              ),
              UIHelper.verticalSpace(10.h),
              CommonTextFormField(
                controller: numberController,
                isPrefixIcon: false,
                fillColor: AppColors.cFFFFFF,
                borderRadius: 8.r,
                borderColor: AppColors.broderColor,
                focusBorderColor: AppColors.broderColor,
                textInputStyle: TextFontStyle.text145192A48w500roboto
                    .copyWith(fontSize: 16.sp),
              ),
              UIHelper.verticalSpace(20.h),
              Text(
                "Cardholder Name",
                style: TextFontStyle.text15c192A48400.copyWith(fontSize: 16.sp),
              ),
              UIHelper.verticalSpace(10.h),
              CommonTextFormField(
                controller: nameController,
                isPrefixIcon: false,
                fillColor: AppColors.cFFFFFF,
                borderRadius: 8.r,
                borderColor: AppColors.broderColor,
                focusBorderColor: AppColors.broderColor,
                textInputStyle: TextFontStyle.text145192A48w500roboto
                    .copyWith(fontSize: 16.sp),
              ),
              UIHelper.verticalSpace(20.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expiry Date",
                          style: TextFontStyle.text15c192A48400
                              .copyWith(fontSize: 16.sp),
                        ),
                        UIHelper.verticalSpace(10.h),
                        CommonTextFormField(
                          controller: expiryDateController,
                          isPrefixIcon: false,
                          fillColor: AppColors.cFFFFFF,
                          borderRadius: 8.r,
                          borderColor: AppColors.broderColor,
                          focusBorderColor: AppColors.broderColor,
                          textInputStyle: TextFontStyle.text145192A48w500roboto
                              .copyWith(fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                  UIHelper.horizontalSpace(20.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "3-Digit CVV",
                          style: TextFontStyle.text15c192A48400
                              .copyWith(fontSize: 16.sp),
                        ),
                        UIHelper.verticalSpace(10.h),
                        CommonTextFormField(
                          controller: cvvController,
                          isPrefixIcon: false,
                          fillColor: AppColors.cFFFFFF,
                          borderRadius: 8.r,
                          borderColor: AppColors.broderColor,
                          focusBorderColor: AppColors.broderColor,
                          textInputStyle: TextFontStyle.text145192A48w500roboto
                              .copyWith(fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(290.h),
              CustomButton(
                title: "Payment",
                onTap: () {
                  NavigationService.navigateTo(Routes.paymentSuccess);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
