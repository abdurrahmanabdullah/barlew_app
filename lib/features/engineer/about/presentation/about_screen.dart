import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/engineer/engineer_average_review/model/engineer_average_review_model.dart';
import 'package:barlew_app/features/engineer/personal_information/model/engineer_profile_model.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    super.initState();
    apiCall();
    averageReviewApiCall();
  }

  apiCall() async {
    await engineerProfileRXObj.engineerProfileRX();
  }

  averageReviewApiCall() async {
    await engineerAveratgeRevieweRXobj.engineerAverageRevieweRX();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<EngineerProfileModel>(
      stream: engineerProfileRXObj.dataFetcher,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text("Error fetching data"),
          );
        }

        if (snapshot.hasData) {
          final engineerprofileSnap = snapshot.data!.data!;
          final List<Skills> skills = engineerprofileSnap.skills ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Plumbing Services",
                style: TextFontStyle.text22c192A48w600roboto
                    .copyWith(fontSize: 18.sp),
              ),
              UIHelper.verticalSpace(6.h),
              Text(
                "${engineerprofileSnap.firstName ?? ''} ${engineerprofileSnap.lastName ?? ''}"
                    .trim(),
                style: TextFontStyle.text22c192A48w600roboto
                    .copyWith(fontSize: 16.sp),
              ),
              UIHelper.verticalSpace(6.h),
              StreamBuilder<EngineerAverageReviewModel>(
                  stream: engineerAveratgeRevieweRXobj.dataFetcher,
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
                      final engineerAverageSnap = snapshot.data?.data;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Circle Avatar
                          CircleAvatar(
                            radius: 10,
                            backgroundImage:
                                AssetImage(Assets.images.splashImage.path),
                          ),
                          UIHelper.horizontalSpace(6.w),

                          // Star Image
                          Image.asset(Assets.icons.strat.path, height: 14.h),
                          UIHelper.horizontalSpace(6.w),

                          Text(
                            '${engineerAverageSnap?.averageRating ?? 0}', // Default to 0 if null
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextFontStyle.text14c9198A6roboto,
                          ),

                          UIHelper.horizontalSpace(5.w),

                          // Reviews Count with fallback if null
                          Text(
                            '(${engineerAverageSnap?.reviewsCount ?? 0} Reviews)', // Default to 0 if null
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            style: TextFontStyle.text14c9198A6roboto,
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                          child:
                              CircularProgressIndicator()); // Loading indicator
                    }
                  }),
              UIHelper.verticalSpace(24.h),

              // Skills Section
              Text(
                "Skills",
                style: TextFontStyle.text145192A48w500roboto
                    .copyWith(fontSize: 18.sp),
              ),
              UIHelper.verticalSpace(12.h),
              SizedBox(
                height: 35.h,
                child: skills.isNotEmpty
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: skills.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5, color: AppColors.broderColor),
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Center(
                                  child: Text(
                                    skills[index].name ?? "Unknown Skill",
                                    style: TextFontStyle.text12c474E5EBw400,
                                  ),
                                ),
                              ),
                            ),
                          );
                        })
                    : const Text("No skills available"),
              ),

              UIHelper.verticalSpace(24.h),
              Text(
                "${engineerprofileSnap.firstName ?? ''} ${engineerprofileSnap.lastName ?? ''}"
                    .trim(),
                style: TextFontStyle.text145192A48w500roboto
                    .copyWith(fontSize: 18.sp),
              ),
              UIHelper.verticalSpace(8.h),
              Text(
                engineerprofileSnap.about ?? "NA",
                style:
                    TextFontStyle.text12c474E5EBw400.copyWith(fontSize: 14.sp),
              ),
              UIHelper.verticalSpace(24.h),
              Text(
                "Portfolio",
                style: TextFontStyle.text145192A48w500roboto
                    .copyWith(fontSize: 18.sp),
              ),
              UIHelper.verticalSpace(24.h),
              SizedBox(
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: engineerprofileSnap.portfolios?.length ?? 0,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 14.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 1.5,
                  ),
                  itemBuilder: (_, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.network(
                        engineerprofileSnap.portfolios![index].image ??
                            "https://via.placeholder.com/150",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text(
              'Error: No data',
            ),
          );
        }
      },
    );
  }
}
