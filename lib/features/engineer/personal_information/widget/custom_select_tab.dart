import 'package:barlew_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSelectTab extends StatelessWidget {
  const CustomSelectTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: 75,
      decoration: BoxDecoration(
          color: AppColors.allPrimaryColor,
          borderRadius: BorderRadius.circular(100.r)),
    );
  }
}