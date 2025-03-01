import 'package:barlew_app/constant/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabWidget extends StatelessWidget {
  final String btnName;
  final void Function() onTap;
  final int curentIndex;
  final int selectedIndex;
  final Widget widget;
  const CustomTabWidget({
    super.key,
    required this.btnName,
    required this.onTap,
    required this.curentIndex,
    required this.selectedIndex,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 80.w,
        height: 30.h,
        child: Column(
          children: [
            Text(
              btnName,
              style: TextFontStyle.text15c192A48400.copyWith(fontSize: 16.sp),
            ),
            widget
          ],
        ),
      ),
    );
  }
}
