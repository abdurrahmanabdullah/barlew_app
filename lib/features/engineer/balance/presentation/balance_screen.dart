import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/engineer/balance/model/engineer_balance_details_model.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() async {
    await engineerBalanceDetailsRXobj.engineerBalanceDetailsRX();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BalanceDetailsResponseModel>(
        stream: engineerBalanceDetailsRXobj.dataFetcher,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SpinKitCircle(
                color: AppColors.allPrimaryColor,
                size: 70,
              ),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("Snapshot has error"),
            );
          }

          if (snapshot.hasData) {
            final engineerBalanceDetailsData = snapshot.data!.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.cECF4FC,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Column(
                      children: [
                        Text(
                          "Task Completed",
                          style: TextFontStyle.text145192A48w500roboto
                              .copyWith(fontSize: 16.sp),
                        ),
                        UIHelper.verticalSpace(6.h),
                        Text(
                          "${engineerBalanceDetailsData.totalCompletedTaskCount}",
                          style: TextFontStyle.text16c192A48inter700
                              .copyWith(fontSize: 24.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.cECF4FC,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10.w, right: 10.w, top: 10.h, bottom: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Earnings",
                          style: TextFontStyle.text25c192A48w600roboto
                              .copyWith(fontSize: 24.sp),
                        ),
                        UIHelper.verticalSpace(16.h),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Available for withdrawal",
                                    style: TextFontStyle.text20c192A48400
                                        .copyWith(fontSize: 14.sp),
                                  ),
                                  UIHelper.verticalSpace(6.h),
                                  Text(
                                    "${engineerBalanceDetailsData.availableForWithDraw}",
                                    style: TextFontStyle.text16c192A48inter700
                                        .copyWith(fontSize: 20.sp),
                                  ),
                                  UIHelper.verticalSpace(24.h),
                                  Text(
                                    "Avg selling price",
                                    style: TextFontStyle.text20c192A48400
                                        .copyWith(fontSize: 14.sp),
                                  ),
                                  UIHelper.verticalSpace(6.h),
                                  Text(
                                    "${engineerBalanceDetailsData.avgSellingPrice}",
                                    style: TextFontStyle.text16c192A48inter700
                                        .copyWith(fontSize: 20.sp),
                                  ),
                                ],
                              ),
                            ),
                            UIHelper.horizontalSpace(16.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Earnings in September",
                                    style: TextFontStyle.text20c192A48400
                                        .copyWith(fontSize: 14.sp),
                                  ),
                                  UIHelper.verticalSpace(6.h),
                                  Text(
                                    "${engineerBalanceDetailsData.currentMonthEarning}",
                                    style: TextFontStyle.text16c192A48inter700
                                        .copyWith(fontSize: 20.sp),
                                  ),
                                  UIHelper.verticalSpace(24.h),
                                  Text(
                                    "Payment being cleared",
                                    style: TextFontStyle.text20c192A48400
                                        .copyWith(fontSize: 14.sp),
                                  ),
                                  UIHelper.verticalSpace(6.h),
                                  Text(
                                    "${engineerBalanceDetailsData.paymentBeingCleared}",
                                    style: TextFontStyle.text16c192A48inter700
                                        .copyWith(fontSize: 20.sp),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpace(32.h),
                CustomButton(
                  title: "Withdraw",
                  onTap: () {
                    NavigationService.navigateTo(Routes.engineerPaymentMethod);
                  },
                ),
                UIHelper.verticalSpace(40.h),
                Text(
                  "Payment Method",
                  style: TextFontStyle.text145192A48w500roboto
                      .copyWith(fontSize: 24.sp),
                ),
                UIHelper.verticalSpace(16.h),
                CustomButton(
                  title: "Add Payment Method",
                  onTap: () {
                    NavigationService.navigateTo(Routes.addCard);
                  },
                )
              ],
            );
          } else {
            return const Center(
              child: Text("No data available"),
            );
          }
        });
  }
}
