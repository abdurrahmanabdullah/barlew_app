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

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController banknameController = TextEditingController();
  TextEditingController accountnumberController = TextEditingController();
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController banceNameController = TextEditingController();
  TextEditingController swiftController = TextEditingController();
  TextEditingController ifcController = TextEditingController();
  @override
  void dispose() {
    banknameController.dispose();
    accountnumberController.dispose();

    accountHolderNameController.dispose();
    banceNameController.dispose();
    swiftController.dispose();
    ifcController.dispose();
    super.dispose();
  }

  /// post the balance details
  Future<bool> engineerBankDetailspostMethod() async {
    if (_formKey.currentState!.validate()) {
      try {
        await engineerBankDetailsRXobj.engineerBankDetailsRX(
            bankName: banknameController.text,
            accountNumber: accountnumberController.text,
            accountHolderName: accountHolderNameController.text,
            branchname: banceNameController.text,
            swiftCode: swiftController.text,
            ifscCode: ifcController.text);

        // Clear fields upon success
        banknameController.clear();
        accountnumberController.clear();
        accountHolderNameController.clear();
        banceNameController.clear();
        swiftController.clear();
        ifcController.clear();

        ToastUtil.showShortToast("Bank Details posted successfully!");
        return true; // Indicating success
      } catch (e) {
        ToastUtil.showShortToast("Bank Details post failed: ${e.toString()}");
        return false; // Indicating failure
      }
    } else {
      ToastUtil.showShortToast("Please fill all fields correctly.");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cF2F4F7,
        title: Text(
          "ADD Card",
          style:
              TextFontStyle.text17c192A48500robotos.copyWith(fontSize: 22.sp),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      backgroundColor: AppColors.cF2F4F7,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.verticalSpace(50.h),
                Text(
                  "Bank Name",
                  style:
                      TextFontStyle.text15c192A48400.copyWith(fontSize: 16.sp),
                ),

                UIHelper.verticalSpace(10.h),
                CommonTextFormField(
                  controller: banknameController,
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
                  "Account Number",
                  style:
                      TextFontStyle.text15c192A48400.copyWith(fontSize: 16.sp),
                ),
                ////------
                UIHelper.verticalSpace(10.h),
                CommonTextFormField(
                  controller: accountnumberController,
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
                  "Account Holder Name",
                  style:
                      TextFontStyle.text15c192A48400.copyWith(fontSize: 16.sp),
                ),

                UIHelper.verticalSpace(10.h),
                CommonTextFormField(
                  controller: accountHolderNameController,
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
                  "Branch Name",
                  style:
                      TextFontStyle.text15c192A48400.copyWith(fontSize: 16.sp),
                ),

                UIHelper.verticalSpace(10.h),
                CommonTextFormField(
                  controller: banceNameController,
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
                            "Swift code ",
                            style: TextFontStyle.text15c192A48400
                                .copyWith(fontSize: 16.sp),
                          ),
                          UIHelper.verticalSpace(10.h),
                          CommonTextFormField(
                            controller: swiftController,
                            isPrefixIcon: false,
                            fillColor: AppColors.cFFFFFF,
                            borderRadius: 8.r,
                            borderColor: AppColors.broderColor,
                            focusBorderColor: AppColors.broderColor,
                            textInputStyle: TextFontStyle
                                .text145192A48w500roboto
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
                            "Ifsc code ",
                            style: TextFontStyle.text15c192A48400
                                .copyWith(fontSize: 16.sp),
                          ),
                          UIHelper.verticalSpace(10.h),
                          CommonTextFormField(
                            controller: ifcController,
                            isPrefixIcon: false,
                            fillColor: AppColors.cFFFFFF,
                            borderRadius: 8.r,
                            borderColor: AppColors.broderColor,
                            focusBorderColor: AppColors.broderColor,
                            textInputStyle: TextFontStyle
                                .text145192A48w500roboto
                                .copyWith(fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(100.h),
                CustomButton(
                  title: "Save",
                  onTap: () async {
                    if (banknameController.text.isNotEmpty &&
                        accountnumberController.text.isNotEmpty &&
                        accountHolderNameController.text.isNotEmpty &&
                        banceNameController.text.isNotEmpty &&
                        swiftController.text.isNotEmpty &&
                        ifcController.text.isNotEmpty) {
                      try {
                        await engineerBankDetailspostMethod();

                        // Navigate only after a successful API response
                        NavigationService.navigateTo(Routes.withdrawsuccess);
                      } catch (e) {
                        ToastUtil.showShortToast(
                            "Bank Details post failed: ${e.toString()}");
                      }
                    } else {
                      ToastUtil.showShortToast(
                          "Please fill all fields before  withdrawal .");
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
