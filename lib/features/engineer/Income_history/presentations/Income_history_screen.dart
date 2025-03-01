// ignore_for_file: file_names

import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncomeHistoryScreen extends StatefulWidget {
  const IncomeHistoryScreen({super.key});

  @override
  State<IncomeHistoryScreen> createState() => _IncomeHistoryScreenState();
}

class _IncomeHistoryScreenState extends State<IncomeHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          'Income History',
          style: TextFontStyle.text25allPrimaryColorTextw700,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView.builder(
              padding: EdgeInsets.only(top: 16.h),
              itemCount: 20,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.cFFFFFF,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Padding(
                      padding: EdgeInsets.all(12.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(150.r),
                                //////////////////     Profile Image    /////////////////////////
                                child: Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzlgkW4Pw3K12ArgCSBkFdQ3UiDFZFpZ_7Ew&s",
                                  width: 44.w,
                                  height: 44.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              UIHelper.horizontalSpace(16.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("#ORD1234",
                                      style: TextFontStyle.text14c000000w500),
                                  UIHelper.verticalSpace(2.h),
                                  Text("Jhon Deo // 16-12-2024",
                                      style: TextFontStyle.text12c3F3F3Fw400),
                                ],
                              ),
                            ],
                          ),
                          Text("\$1200.00",
                              style: TextFontStyle.text14c000000w500)
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
