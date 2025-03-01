import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../gen/colors.gen.dart';

class CustomTextFormFild extends StatelessWidget {
  final String hintText;
  final TextStyle textStyle;
  final bool? obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? maxLength;
  final Color? fillColor;

  const CustomTextFormFild({
    super.key,
    required this.hintText,
    required this.textStyle,
    this.obscureText,
    required this.controller,
    this.validator,
    this.suffixIcon,
    this.maxLines,
    this.maxLength,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // maxLines: (obscureText ?? false) ? 1 : maxLines, // obscureText true হলে maxLines 1 হবে
      // maxLength: maxLength,
      obscureText: obscureText ?? false,
      controller: controller,
      validator: validator,

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textStyle,
        filled: true,
        fillColor: fillColor ?? AppColors.cFFFFFF,
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.broderColor, width: 1.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: AppColors.broderColor, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: AppColors.broderColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
      ),
    );
  }
}
