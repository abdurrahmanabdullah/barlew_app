import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/customer/auth/logout/widget/customer_logout_bottom_sheet.dart';
import 'package:barlew_app/features/customer/home/presentation/customer_home_service_screen.dart';
import 'package:barlew_app/features/engineer/home/presentatiosn/widget/custom_row.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/global_variable.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomerDrawer extends StatefulWidget {
  const CustomerDrawer({super.key});

  @override
  State<CustomerDrawer> createState() => _CustomerDrawerState();
}

class _CustomerDrawerState extends State<CustomerDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.zero, borderSide: BorderSide.none),
      width: 350.w,
      backgroundColor: AppColors.allPrimaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
            child: Column(
          children: [
            UIHelper.verticalSpace(80.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /// Profile Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(150.r),
                      child: GlobalProfile.avatar != null &&
                              GlobalProfile.avatar!.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: GlobalProfile.avatar!,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Image.asset(
                                Assets.images.profileAvatar.path,
                                width: 50.w,
                                height: 50.h,
                                fit: BoxFit.cover,
                              ),
                              width: 50.w,
                              height: 50.h,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              Assets.images.profileAvatar.path,
                              width: 50.w,
                              height: 50.h,
                              fit: BoxFit.cover,
                            ),
                    ),

                    UIHelper.horizontalSpace(12.w),

                    /// User Name & Email
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${GlobalProfile.firstName ?? 'Loading...'} ${GlobalProfile.lastName ?? ''}",
                          style: TextFontStyle.text18cFFFFFFw500
                              .copyWith(fontSize: 16.sp),
                        ),
                        UIHelper.verticalSpace(12.w),
                        Text(
                          GlobalProfile.email ?? "No Email",
                          style: TextFontStyle.text14cFFFFFF400
                              .copyWith(fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            UIHelper.verticalSpace(20.h),

            /// Divider
            Container(
              width: double.infinity,
              height: 1.h,
              color: AppColors.c8A8A8A,
            ),

            UIHelper.verticalSpace(26.h),

            /// Task History Option
            CustomRow(
              icon: Assets.icons.icon2,
              title: "Task History",
              onTap: () {
                NavigationService.navigateTo(Routes.workHistoryScreen);
              },
            ),

            UIHelper.verticalSpace(30.h),

            /// Logout Option
            CustomRow(
              icon: Assets.icons.icon5,
              title: "Logout",
              onTap: () {
                Get.bottomSheet(
                  const CustomerLogoutBottomSheet(),
                  backgroundColor: Colors.white,
                );
              },
              trailing: const SizedBox(),
            ),
          ],
        )),
      ),
    );
  }
}
