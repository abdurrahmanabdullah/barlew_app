import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.searchController,
    this.onChanged,
    this.prefixIcon,
    this.prefixIconColor,
    this.hintText,
    this.fillColor,
    this.hintStyle,
    this.suffixIcon,
    this.width,
    this.height,
    this.iconSize,
  });

  final TextEditingController searchController;
  final Function(String)? onChanged;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final String? hintText;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final double? width;
  final double? height;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1.w,
          //  color: AppColors.cEFEFEF,
           )),
      child: TextField(
        onChanged: onChanged,
        controller: searchController,
        decoration: InputDecoration(
            fillColor: fillColor,
            filled: true,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon ??
                Icon(
                  Icons.search,
                  color: prefixIconColor ,
                  // ?? 
                  // AppColors.c2D264B,
                  size: iconSize ?? 35.w,
                ),
            hintText: hintText,
            hintStyle: hintStyle 
            // ?? TextFontStyle.text14c414141w400
            ,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.r))),
      ),
    );
  }
}
