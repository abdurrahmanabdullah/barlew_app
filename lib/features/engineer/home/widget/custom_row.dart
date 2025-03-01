import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomRow extends StatelessWidget {
  final String icon;
  final String title;
  final Widget? trailing;
  final void Function() onTap;
  const CustomRow({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(icon),
              UIHelper.horizontalSpace(16.w),
              Text(
                title,
                style: TextFontStyle.text14cFFFFFF400.copyWith(fontSize: 16.sp),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 25.w),
            child: trailing?? SvgPicture.asset(Assets.icons.caretRight),
          )
        ],
      ),
    );
  }
}
