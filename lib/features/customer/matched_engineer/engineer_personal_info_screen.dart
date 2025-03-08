import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/engineer/about/presentation/about_screen.dart';
import 'package:barlew_app/features/engineer/balance/presentation/balance_screen.dart';
import 'package:barlew_app/features/engineer/personal_information/model/engineer_profile_model.dart';
import 'package:barlew_app/features/engineer/personal_information/widget/custom_select_tab.dart';
import 'package:barlew_app/features/engineer/personal_information/widget/custom_tab_widget.dart';
import 'package:barlew_app/features/engineer/engineer_review/presentation/engineer_review_screen.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:barlew_app/provider/profile_provider.dart';
import 'package:barlew_app/provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class EngineerPersonalInfoScreen extends StatefulWidget {
  const EngineerPersonalInfoScreen({super.key});

  @override
  State<EngineerPersonalInfoScreen> createState() =>
      _EngineerPersonalInfoScreenState();
}

class _EngineerPersonalInfoScreenState
    extends State<EngineerPersonalInfoScreen> {
  @override
  void initState() {
    super.initState();
    apiCall();
  }

  // apiCall() async {
  //   await engineerProfileRXObj.engineerProfileRX();
  // }
  apiCall() async {
    final profileData = await engineerProfileRXObj.engineerProfileRX();
    if (profileData != null) {
      Provider.of<ProfileProvider>(context, listen: false)
          .setProfile(profileData);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<IndexProviders>(context);
    return Scaffold(
        backgroundColor: AppColors.cFFFFFF,
        body: StreamBuilder<EngineerProfileModel>(
            stream: engineerProfileRXObj.dataFetcher,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SpinKitCircle(
                  color: AppColors.allPrimaryColor,
                  size: 50.0,
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Snapshot has error"),
                );
              }

              if (snapshot.hasData) {
                final engineerprofileSnap = snapshot.data!.data!;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        UIHelper.verticalSpace(85.h),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(150.r),
                            child: CachedNetworkImage(
                              width: 60.w,
                              height: 60.w,
                              fit: BoxFit.cover,
                              imageUrl: engineerprofileSnap.avatar ?? "N/A",
                              placeholder: (context, url) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(150.r),
                                  child: Image.asset(
                                    Assets.images.profileAvatar.path,
                                    width: 60.w,
                                    height: 60.w,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                              errorWidget: (context, url, error) {
                                return ClipRRect(
                                    borderRadius: BorderRadius.circular(150.r),
                                    child: Image.asset(
                                      Assets.images.profileAvatar.path,
                                      width: 60.w,
                                      height: 60.w,
                                      fit: BoxFit.cover,
                                    ));
                              },
                            ),
                          ),
                        ),

                        UIHelper.verticalSpace(12.h),
                        /////////////////////////     Profile name        ///////////////////////
                        Text(
                          "${engineerprofileSnap.firstName ?? ''} ${engineerprofileSnap.lastName ?? ''}"
                              .trim(),
                          style: TextFontStyle.text17c192A48w600
                              .copyWith(fontSize: 20.sp),
                        ),

                        UIHelper.verticalSpace(5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Assets.icons.strat.path, height: 14.h),
                            UIHelper.horizontalSpace(6.w),
                            /////////////////////////      rating value        ///////////////////////
                            Text(
                              '4.9',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextFontStyle.text14c9198A6roboto,
                            ),
                            UIHelper.horizontalSpace(5.w),
                            /////////////////////////      review value       ///////////////////////
                            Text(
                              '(550 Reviews)',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              style: TextFontStyle.text14c9198A6roboto,
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(5.h),
                        Text(engineerprofileSnap.name ?? "No Name Found",
                            style: TextFontStyle.text13c505767roboto2
                                .copyWith(fontSize: 14.sp)),
                        UIHelper.verticalSpace(40.h),
                        /////////////////////////     custom tab bar      ///////////////////////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTabWidget(
                              btnName: "About",
                              onTap: () {
                                provider.selectedTabBar(0);
                              },
                              curentIndex: 0,
                              selectedIndex: provider.selectedTabBarIndex,
                              widget: provider.selectedTabBarIndex == 0
                                  ? const CustomSelectTab()
                                  : const SizedBox(),
                            ),
                            CustomTabWidget(
                              btnName: "Balance",
                              onTap: () {
                                provider.selectedTabBar(1);
                              },
                              curentIndex: 1,
                              selectedIndex: provider.selectedTabBarIndex,
                              widget: provider.selectedTabBarIndex == 1
                                  ? const CustomSelectTab()
                                  : const SizedBox(),
                            ),
                            CustomTabWidget(
                              btnName: "Reviews",
                              onTap: () {
                                provider.selectedTabBar(2);
                              },
                              curentIndex: 2,
                              selectedIndex: provider.selectedTabBarIndex,
                              widget: provider.selectedTabBarIndex == 2
                                  ? const CustomSelectTab()
                                  : const SizedBox(),
                            )
                          ],
                        ),
                        UIHelper.verticalSpace(24.h),
                        if (provider.selectedTabBarIndex == 0)
                          const AboutScreen(),
                        if (provider.selectedTabBarIndex == 1)
                          const BalanceScreen(),
                        if (provider.selectedTabBarIndex == 2)
                          const EngineerReviewScreen(),
                        UIHelper.verticalSpace(30.h),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text("Snapshot has error"),
                );
              }
            }));
  }
}
