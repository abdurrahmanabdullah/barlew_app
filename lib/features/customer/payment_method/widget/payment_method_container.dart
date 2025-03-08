import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodContainer extends StatelessWidget {
  final String logo;
  final String? cardNumber;
  final String? validate;
  final int currentIndex;
  final int selectedIndex;
  final void Function() onTap;
  final Color containerColor;
  final Color borderColor;
  const PaymentMethodContainer({
    super.key,
    required this.logo,
    this.cardNumber,
    this.validate,
    required this.currentIndex,
    required this.selectedIndex,
    required this.onTap,
    required this.containerColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(width: 1, color: borderColor)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    logo,
                    width: 90,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
                  UIHelper.horizontalSpace(30.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cardNumber ?? "",
                        style: TextFontStyle.text14c3B475Ew600,
                      ),
                      Text(
                        validate ?? "",
                        style: TextFontStyle.text12c798090w600,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
