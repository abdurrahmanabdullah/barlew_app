import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/engineer/about/presentation/about_screen.dart';
import 'package:barlew_app/features/engineer/balance/presentation/balance_screen.dart';
import 'package:barlew_app/features/engineer/engineer_average_review/model/engineer_average_review_model.dart';
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
    averageReviewApiCall();
  }

  apiCall() async {
    final profileData = await engineerProfileRXObj.engineerProfileRX();

    // Check if the widget is still mounted before accessing the context
    if (mounted && profileData != null) {
      // Use the ProfileProvider to set the profile data
      Provider.of<ProfileProvider>(context, listen: false)
          .setProfile(profileData);
    }
  }

  averageReviewApiCall() async {
    try {
      await engineerAveratgeRevieweRXobj.engineerAverageRevieweRX();
      print("API call successful");
    } catch (e) {
      print("API call failed: $e");
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
                // ignore: non_constant_identifier_names
                final EngineerprofileSnap = snapshot.data!.data!;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        UIHelper.verticalSpace(85.h),
                        //<<---------------------- profile Img ------------------------>>
                        Center(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(150.r),
                          child: Image.network(
                            EngineerprofileSnap.avatar?.isNotEmpty == true
                                ? EngineerprofileSnap.avatar!
                                : "https://example.com/path/to/placeholder.jpg", // Default image
                            width: 60.w,
                            height: 60.h,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                Assets.images.profileAvatar
                                    .path, // Default image in case of error
                                width: 60.w,
                                height: 60.h,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        )),

                        UIHelper.verticalSpace(12.h),
                        /////////////////////////     Profile name        ///////////////////////
                        Text(
                          "${EngineerprofileSnap.firstName ?? ''} ${EngineerprofileSnap.lastName ?? ''}"
                              .trim(),
                          style: TextFontStyle.text17c192A48w600
                              .copyWith(fontSize: 20.sp),
                        ),

                        UIHelper.verticalSpace(5.h),
                        StreamBuilder<EngineerAverageReviewModel>(
                            stream: engineerAveratgeRevieweRXobj.dataFetcher,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
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
                                final engineerAverageSnap = snapshot.data?.data;

                                if (engineerAverageSnap != null) {
                                  // Check if EngineerAverageSnap is not null before accessing its properties
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(Assets.icons.strat.path,
                                          height: 14.h),
                                      UIHelper.horizontalSpace(6.w),
                                      /////////////////////////      rating value        ///////////////////////
                                      Text(
                                        '${engineerAverageSnap.averageRating ?? 0}', // Make sure averageRating is not null
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            TextFontStyle.text14c9198A6roboto,
                                      ),
                                      UIHelper.horizontalSpace(5.w),
                                      /////////////////////////      review value       ///////////////////////
                                      Text(
                                        '(${engineerAverageSnap.reviewsCount ?? 0} Reviews)', // Display reviews count with a fallback value
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                        style:
                                            TextFontStyle.text14c9198A6roboto,
                                      ),
                                    ],
                                  );
                                } else {
                                  return const Center(
                                    child: Text("No data available"),
                                  );
                                }
                              } else {
                                return const Center(
                                  child: Text("Snapshot has error"),
                                );
                              }
                            }),
                        UIHelper.verticalSpace(5.h),
                        Text(EngineerprofileSnap.name ?? "No Name Found",
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
