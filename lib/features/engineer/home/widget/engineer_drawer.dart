import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_logout/logout_botom_sheet.dart';
import 'package:barlew_app/features/engineer/home/widget/custom_row.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:barlew_app/provider/profile_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

////-----------------
class EngineerDrawer extends StatefulWidget {
  const EngineerDrawer({super.key});

  @override
  State<EngineerDrawer> createState() => _EngineerDrawerState();
}

class _EngineerDrawerState extends State<EngineerDrawer> {
  @override
  void initState() {
    super.initState();

    apiCall();
  }

  apiCall() async {
    final profileData = await engineerProfileRXObj.engineerProfileRX();

    /// If the profile data is not null, update the profile provider
    if (mounted && profileData != null) {
      /// Use the ProfileProvider to set the profile data
      Provider.of<ProfileProvider>(context, listen: false)
          .setProfile(profileData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide.none,
      ),
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(150.r),
                        child: Consumer<ProfileProvider>(
                          builder: (context, profileProvider, child) {
                            final profile = profileProvider.profile?.data;

                            return ClipOval(
                              child: profile?.avatar == null
                                  ? Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      direction: ShimmerDirection.ltr,
                                      child: Container(
                                        width: 50.w,
                                        height: 50.h,
                                        color: Colors.white,
                                      ),
                                    )
                                  : CachedNetworkImage(
                                      width: 50.w,
                                      height: 50.h,
                                      imageUrl: profile?.avatar ?? ' ',
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        direction: ShimmerDirection.ltr,
                                        child: Container(
                                          width: 50.w,
                                          height: 50.h,
                                          color: Colors.white,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                        Icons.person,
                                        size: 50.sp,
                                      ),
                                      fadeInDuration:
                                          const Duration(milliseconds: 500),
                                    ),
                            );
                          },
                        ),
                      ),
                      UIHelper.horizontalSpace(12.w),
                      Consumer<ProfileProvider>(
                        builder: (context, profileProvider, child) {
                          final profile = profileProvider.profile?.data;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${profile?.firstName ?? 'Unknown'} ${profile?.lastName ?? ''}"
                                    .trim(),
                                style: TextFontStyle.text18cFFFFFFw500
                                    .copyWith(fontSize: 16.sp),
                              ),
                              Text(
                                profile?.email ?? "example@gmail.com",
                                style: TextFontStyle.text14cFFFFFF400
                                    .copyWith(fontSize: 16.sp),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: GestureDetector(
                      onTap: () {
                        NavigationService.navigateTo(
                            Routes.engineerEditProfile);
                      },
                      child: Image.asset(
                        Assets.icons.editProfileOption12.path,
                        width: 35.w,
                      ),
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(20.h),
              Container(
                width: double.infinity,
                height: 1.h,
                color: AppColors.c8A8A8A,
              ),
              UIHelper.verticalSpace(26.h),
              CustomRow(
                icon: Assets.icons.icon2,
                title: "Income History",
                onTap: () {
                  NavigationService.navigateTo(Routes.incomeHistoryScreen);
                },
              ),
              UIHelper.verticalSpace(30.h),
              CustomRow(
                icon: Assets.icons.icon,
                title: "Setting",
                onTap: () {
                  NavigationService.navigateTo(Routes.engineerSettingScreen);
                },
              ),
              UIHelper.verticalSpace(30.h),
              CustomRow(
                icon: Assets.icons.icon4,
                title: "Policy",
                onTap: () {
                  NavigationService.navigateTo(Routes.engineerPrivacyPolicy);
                },
              ),
              UIHelper.verticalSpace(30.h),
              CustomRow(
                icon: Assets.icons.icon5,
                title: "Logout",
                onTap: () {
                  Get.bottomSheet(
                    const CustomBottomSheet(),
                    backgroundColor: Colors.white,
                  );
                },
                trailing: const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
