import 'package:barlew_app/common_widget/custom_button_two.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant/text_font_style.dart';

class EngineerSettingScreen extends StatefulWidget {
  const EngineerSettingScreen({super.key});

  @override
  State<EngineerSettingScreen> createState() => _EngineerSettingScreenState();
}

class _EngineerSettingScreenState extends State<EngineerSettingScreen> {
  bool notification = true;
  bool microphone = false;
  bool camera = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cFFFFFF,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Settings',
          style: TextFontStyle.text20cprimarycolorw500,
        ),
      ),
      backgroundColor: AppColors.cFFFFFF,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 22.w),
        child: Column(
          children: [
            //// this is a notification  button start here ////
            CustomButtonTow(
                color: AppColors.cFFFFFF,
                padding: EdgeInsets.symmetric(vertical: 5.h),
                border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Notification',
                        style: TextFontStyle.text18cFFFFFFw500
                            .copyWith(color: AppColors.allPrimaryColorText),
                      ),
                      Switch(
                          activeColor: AppColors.cFFFFFF,
                          activeTrackColor: AppColors.allPrimaryColor,
                          inactiveTrackColor: AppColors.c898989,
                          inactiveThumbColor: AppColors.cFFFFFF,
                          trackOutlineColor:
                              const WidgetStatePropertyAll(Colors.transparent),
                          value: notification,
                          onChanged: (value) {
                            setState(() {
                              notification = value;
                            });
                          })
                    ],
                  ),
                )),

            ///<<<<<<<<<<<<<  end here >>>>>>>>>>>>>>>>> //////////
            UIHelper.verticalSpace(14.h),
            CustomButtonTow(
                color: AppColors.cFFFFFF,
                padding: EdgeInsets.symmetric(vertical: 5.h),
                border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Microphone',
                        style: TextFontStyle.text18cFFFFFFw500
                            .copyWith(color: AppColors.allPrimaryColorText),
                      ),
                      Switch(
                          activeColor: AppColors.cFFFFFF,
                          activeTrackColor: AppColors.allPrimaryColor,
                          inactiveTrackColor: AppColors.c898989,
                          inactiveThumbColor: AppColors.cFFFFFF,
                          trackOutlineColor:
                              const WidgetStatePropertyAll(Colors.transparent),
                          value: microphone,
                          onChanged: (value) {
                            setState(() {
                              microphone = value;
                            });
                          })
                    ],
                  ),
                )),
            UIHelper.verticalSpace(16.h),
            CustomButtonTow(
                color: AppColors.cFFFFFF,
                padding: EdgeInsets.symmetric(vertical: 5.h),
                border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Camera',
                        style: TextFontStyle.text18cFFFFFFw500
                            .copyWith(color: AppColors.allPrimaryColorText),
                      ),
                      Switch(
                          activeColor: AppColors.cFFFFFF,
                          activeTrackColor: AppColors.allPrimaryColor,
                          inactiveTrackColor: AppColors.c898989,
                          inactiveThumbColor: AppColors.cFFFFFF,
                          trackOutlineColor:
                              const WidgetStatePropertyAll(Colors.transparent),
                          value: camera,
                          onChanged: (value) {
                            setState(() {
                              camera = value;
                            });
                          })
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
