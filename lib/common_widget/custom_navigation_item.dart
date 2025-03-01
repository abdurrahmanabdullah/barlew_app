
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/text_font_style.dart';
import '../helpers/ui_helpers.dart';

class CustomNavigationItem extends StatelessWidget {
  final void Function() onTap;
  final Color ontapColor;
  final Color iconColor;
  final String lebel;
  final String icon;
  const CustomNavigationItem(
      {super.key,
      required this.onTap,
      required this.ontapColor,
      required this.lebel,
      required this.icon,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 60,
                height: 35,
                decoration: BoxDecoration(
                    color: ontapColor,
                    borderRadius: BorderRadius.circular(24.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Image.asset(
                    icon,
                    color: iconColor,
                  ),
                )),
                UIHelper.verticalSpace(4.h),
            Text(
              lebel,
              style: TextFontStyle.text12cFFFFFFw500,
            )
          ],
        ));
  }
}
