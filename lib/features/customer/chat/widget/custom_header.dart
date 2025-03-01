import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHeader extends StatelessWidget {
  final String profileImage;
  final String name;
  final String lastSeen;
  final Widget? videoCallIcon;
  final void Function()? videoCallTap;
  final void Function() audioCallTap;
  const CustomHeader({
    super.key,
    required this.profileImage,
    required this.name,
    required this.lastSeen,
    this.videoCallTap,
    required this.audioCallTap,
    this.videoCallIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    NavigationService.goBack;
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.c192A48,
                  )),
              UIHelper.horizontalSpace(16.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(150.r),
                child: Image.network(
                  profileImage,
                  width: 48.w,
                  height: 48.h,
                  fit: BoxFit.cover,
                ),
              ),
              UIHelper.horizontalSpace(16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: TextFontStyle.text20c192A48400
                            .copyWith(fontSize: 16.sp),
                      ),
                      UIHelper.horizontalSpace(10.w),
                      Container(
                        height: 8.h,
                        width: 8.w,
                        decoration: const BoxDecoration(
                            color: AppColors.c17CA7E, shape: BoxShape.circle),
                      )
                    ],
                  ),
                  Text(lastSeen, style: TextFontStyle.text14c5F554Broboto2w400)
                ],
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: videoCallTap,
                child: videoCallIcon ??
                    Image.asset(
                      Assets.icons.videocallCircle.path,
                      width: 30.w,
                    ),
              ),
              UIHelper.horizontalSpace(18.w),
              GestureDetector(
                onTap: audioCallTap,
                child: Image.asset(
                  Assets.icons.calling.path,
                  width: 30.w,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
