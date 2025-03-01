import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final BorderRadius? radius;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final VoidCallback? onTap;
  final TextStyle? style;
  final BoxBorder? border;
  final double? width;

  const CustomButton({
    super.key,
    required this.title,
    this.radius,
    this.padding,
    this.color,
    this.onTap,
    this.style,
    this.border,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: padding ?? EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: color ?? AppColors.allPrimaryColor,
          borderRadius: radius ?? BorderRadius.circular(150.r),
          border: border,
        ),
        child: Center(
          child: Text(
            title,
            style: style ??
                TextFontStyle.text16cFFFFFF500.copyWith(fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
