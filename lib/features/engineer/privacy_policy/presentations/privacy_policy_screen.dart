import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  List policy = [
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Privacy Policy',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: AppColors.cFFFFFF,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView.builder(
            padding: EdgeInsets.only(top: 24.h),
              itemCount: policy.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${index+1}. ",style: TextFontStyle.text16c464D5Dinter400,),
                      Expanded(child: Text(policy[index],style: TextFontStyle.text16c464D5Dinter400,)),
                    ],
                  ),
                );
              })),
    );
  }
}
