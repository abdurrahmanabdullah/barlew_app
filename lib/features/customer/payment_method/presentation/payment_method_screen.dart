import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/customer/payment_method/widget/payment_method_container.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<IndexProviders>(context);
    return Scaffold(
      backgroundColor: AppColors.cF2F4F7,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.cF2F4F7,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Done",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              UIHelper.verticalSpace(50.h),
              Text("Payment Method",
                  style: TextFontStyle.text22c192A48w600roboto
                      .copyWith(fontSize: 24.sp)),
              UIHelper.verticalSpace(12.h),
              Text(
                "Choose desired vesired type. We offer cars suitable for most every day needs.",
                style: TextFontStyle.text14c4A5161w400,
                textAlign: TextAlign.center,
              ),
              UIHelper.verticalSpace(50.h),
              PaymentMethodContainer(
                logo: Assets.images.paypelWithBackground.path,
                cardNumber: "****  ****  ****  5963",
                validate: "Expires 09/30",
                containerColor: provider.selectedPaymentMethodIndex == 0
                    ? Colors.transparent
                    : AppColors.cFFFFFF,
                borderColor: provider.selectedPaymentMethodIndex == 0
                    ? AppColors.allPrimaryColor
                    : Colors.transparent,
                currentIndex: 0,
                selectedIndex: provider.selectedPaymentMethodIndex,
                onTap: () {
                  provider.selectMethodTab(0);
                },
              ),
              UIHelper.verticalSpace(16.h),
              PaymentMethodContainer(
                logo: Assets.images.visaWithBackground.path,
                cardNumber: "****  ****  ****  5963",
                validate: "Expires 09/30",
                containerColor: provider.selectedPaymentMethodIndex == 1
                    ? Colors.transparent
                    : AppColors.cFFFFFF,
                borderColor: provider.selectedPaymentMethodIndex == 1
                    ? AppColors.allPrimaryColor
                    : Colors.transparent,
                currentIndex: 1,
                selectedIndex: provider.selectedPaymentMethodIndex,
                onTap: () {
                  provider.selectMethodTab(1);
                },
              ),
              UIHelper.verticalSpace(16.h),
              PaymentMethodContainer(
                logo: Assets.images.mastercardWithBackground.path,
                cardNumber: "****  ****  ****  5963",
                validate: "Expires 09/30",
                containerColor: provider.selectedPaymentMethodIndex == 2
                    ? Colors.transparent
                    : AppColors.cFFFFFF,
                borderColor: provider.selectedPaymentMethodIndex == 2
                    ? AppColors.allPrimaryColor
                    : Colors.transparent,
                currentIndex: 2,
                selectedIndex: provider.selectedPaymentMethodIndex,
                onTap: () {
                  provider.selectMethodTab(2);
                },
              ),
              UIHelper.verticalSpace(140.h),
              CustomButton(
                title: "Payment",
                onTap: () {
                  NavigationService.navigateTo(Routes.paymentInformation);
                },
              ),
              UIHelper.verticalSpace(20.h),
              CustomButton(
                title: "ADD Payment Method",
                onTap: () {
                  NavigationService.navigateTo(Routes.addCard);
                },
                color: AppColors.cFFFFFF,
                style: TextFontStyle.text16cprimarycolorw500
                    .copyWith(fontSize: 14.sp),
                border:
                    Border.all(width: 1.w, color: AppColors.allPrimaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
