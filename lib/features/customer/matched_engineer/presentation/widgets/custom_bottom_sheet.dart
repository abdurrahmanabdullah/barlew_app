import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/common_widget/custom_button_two.dart';
import 'package:barlew_app/features/customer/matched_engineer/model/customer_service_fee_model.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../../constant/text_font_style.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../helpers/ui_helpers.dart';

class CustomBottomSheetTwo extends StatefulWidget {
  const CustomBottomSheetTwo({super.key});

  @override
  State<CustomBottomSheetTwo> createState() => _CustomBottomSheetTwoState();
}

class _CustomBottomSheetTwoState extends State<CustomBottomSheetTwo> {
  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() async {
    await engineerServiceFeeRXobj.engineerServiceFeeRX();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x263B8CDB),
            blurRadius: 40,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 33.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 11.r),
              decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(11.r),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Container
                    Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.r),
                        image: DecorationImage(
                          image: AssetImage(Assets.images.imageFour.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    UIHelper.horizontalSpace(9.w),

                    // Details Section
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UIHelper.verticalSpace(16.h),
                          Text(
                            'Boiler Fault Service ',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            style: TextFontStyle.text17c192A48500robotos
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          UIHelper.verticalSpace(5.h),
                          Text(
                            '26/12/2024 . 17:27h',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            style: TextFontStyle.text15c484F5Froboto,
                          ),
                          UIHelper.verticalSpace(5.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            UIHelper.verticalSpace(30.h),
            CustomButtonTow(
                padding: EdgeInsets.symmetric(vertical: 19.h),
                border: Border.all(color: AppColors.c192A48),
                color: AppColors.c192A48,
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: StreamBuilder<ServiceFeeResponseModel>(
                      stream: engineerServiceFeeRXobj.dataFetcher,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50.0),
                            child: Row(
                              children: [
                                Text(
                                  "service fee ",
                                  style: TextFontStyle.text15cFFFFFF500,
                                ),
                                const Spacer(), // This is fine since Spacer() is a constant
                                Text(
                                  "120",
                                  style: TextFontStyle
                                      .text15cFFFFFF500, // Removed `const`
                                ),
                              ],
                            ),
                          );

                          // return const SpinKitCircle(
                          //   color: AppColors.allPrimaryColor,
                          //   size: 50.0,
                          // );
                        }
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text("Snapshot has error"),
                          );
                        }
                        if (snapshot.hasData) {
                          final serviceFeeList = snapshot.data?.data;
                          final String fee = serviceFeeList?.isNotEmpty == true
                              ? serviceFeeList!.first.fee ?? "N/A"
                              : "N/A";

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Service fee',
                                style: TextFontStyle.text20cFFFFFF500,
                              ),
                              Text(
                                '0.0',
                                style: TextFontStyle.text20cFFFFFF500,
                              ),
                            ],
                          );
                        } else {
                          return const Center(child: Text("No data available"));
                        }
                      }),
                )),
            UIHelper.verticalSpace(22.h),
            CustomButton(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              radius: BorderRadius.circular(111.r),
              onTap: () {
                NavigationService.navigateTo(Routes.payment);
              },
              title: 'Proceed To Payment',
              style: TextFontStyle.text15cFFFFFF500,
              color: AppColors.allPrimaryColor,
            ),
            UIHelper.verticalSpace(22.h),
            CustomButton(
              padding: EdgeInsets.symmetric(vertical: 18.h),
              radius: BorderRadius.circular(111.r),
              onTap: () {
                NavigationService.goBack;
              },
              title: 'Cancel',
              style: TextFontStyle.text14callprimaryColor2w400
                  .copyWith(fontSize: 16.sp),
              color: AppColors.cFFFFFF,
              border: Border.all(color: AppColors.allPrimaryColor, width: 1),
            ),
          ],
        ),
      ),
    );
  }
}
