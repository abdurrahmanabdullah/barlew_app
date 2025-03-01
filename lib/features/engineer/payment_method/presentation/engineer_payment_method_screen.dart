import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/engineer/payment_method/widget/card_info_bottom_sheet.dart';
import 'package:barlew_app/features/customer/payment_method/widget/payment_method_container.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EngineerPaymentMethodScreen extends StatefulWidget {
  const EngineerPaymentMethodScreen({super.key});

  @override
  State<EngineerPaymentMethodScreen> createState() =>
      _EngineerPaymentMethodScreenState();
}

class _EngineerPaymentMethodScreenState
    extends State<EngineerPaymentMethodScreen> {
  void _showExpandedBottomSheet() {
    showModalBottomSheet(
      backgroundColor: AppColors.cFFFFFF,
      context: context,
      isScrollControlled: true, // Makes the bottom sheet expandable
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20), // Rounded top corners
        ),
      ),
      builder: (context) {
        return const CardInfoBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<IndexProviders>(context);
    return Scaffold(
      backgroundColor: AppColors.cF2F4F7,
      appBar: AppBar(
        backgroundColor: AppColors.cF2F4F7,
        scrolledUnderElevation: 0,
        centerTitle: true,
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
              UIHelper.verticalSpace(160.h),
              CustomButton(
                title: "Continue",
                onTap: () {
                  NavigationService.goBack;
                  _showExpandedBottomSheet();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
