import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/features/customer/matched_engineer/model/match_engineer_profile_model.dart';
import 'package:barlew_app/features/customer/matched_engineer/presentation/widgets/custom_bottom_sheet.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../constant/text_font_style.dart';
import '../../../../gen/assets.gen.dart';

class MatchedEngineerScreen extends StatefulWidget {
  const MatchedEngineerScreen({super.key});

  @override
  State<MatchedEngineerScreen> createState() => _MatchedEngineerScreenState();
}

class _MatchedEngineerScreenState extends State<MatchedEngineerScreen> {
  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() async {
    await matchEngineerProfileRXobj.matchEngineerProfileRX(requestId: '34');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: Text(
            'Matched Engineer',
            style: TextFontStyle.text20cprimarycolorw500,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: AppColors.cFFFFFF,
        body: StreamBuilder<MatchEngineerProfileModel>(
            stream: matchEngineerProfileRXobj.dataFetcher,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SpinKitCircle(
                    color: AppColors.allPrimaryColor,
                    size: 50.0,
                  ),
                );
              }

              if (snapshot.hasError) {
                return const Center(
                  child: Text("Snapshot has error"),
                );
              }

              if (snapshot.hasData) {
                final engineerData = snapshot.data!.data!.engineer;

                List<Skill> skills = engineerData?.skills ?? [];
                final portfolioImages = engineerData?.portfolios ?? [];
                final avatarUrl = engineerData?.avatar ?? '';
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIHelper.verticalSpace(24.h),
                        Center(
                          child: CircleAvatar(
                            radius: 56.r,
                            backgroundColor:
                                AppColors.cFFFFFF, // Background color
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(56.r),
                              child: CachedNetworkImage(
                                imageUrl: avatarUrl.isNotEmpty ? avatarUrl : '',
                                placeholder: (context, url) => Image.asset(
                                  Assets.icons.reperMan.path,
                                  fit: BoxFit.cover,
                                  width: 112.w,
                                  height: 112.h,
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  Assets.icons.reperMan.path,
                                  fit: BoxFit.cover,
                                  width: 112.w,
                                  height: 112.h,
                                ),
                                width: 112.w,
                                height: 112.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        UIHelper.verticalSpace(50.h),
                        Text(engineerData?.name ?? 'N/A',
                            style: TextFontStyle.text17c192A48w600),
                        UIHelper.verticalSpace(11.h),
                        Text(engineerData?.service ?? 'N/A',
                            style: TextFontStyle.text15c192A48500robotos),
                        UIHelper.verticalSpace(30.h),

                        /// Reviews section starts here ///
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundImage:
                                  AssetImage(Assets.images.splashImage.path),
                            ),
                            UIHelper.horizontalSpace(6.w),
                            GestureDetector(
                              child: Image.asset(Assets.icons.strat.path,
                                  height: 14.h),
                            ),
                            UIHelper.horizontalSpace(6.w),
                            Text(
                              engineerData?.ratting ?? "0.0",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextFontStyle.text14c9198A6roboto,
                            ),
                            UIHelper.horizontalSpace(5.w),
                            Text(
                              '(${engineerData?.totalReviews ?? "0"} Reviews)',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              style: TextFontStyle.text14c9198A6roboto,
                            ),
                          ],
                        ),

                        /// Reviews section ends here ///
                        UIHelper.verticalSpace(30.h),
                        Text('Skills', style: TextFontStyle.text17c192A48w600),
                        UIHelper.verticalSpace(12.h),
                        SizedBox(
                          height: 40,
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: skills.length,
                            itemBuilder: (_, index) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.h, horizontal: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(101.r),
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                ),
                                child: Center(
                                    child:
                                        Text(skills[index].name ?? "Unknown")),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                  width: 11.w); // Use 11.w for horizontal space
                            },
                          ),
                        ),
                        UIHelper.verticalSpace(24.h),
                        Text('About ${engineerData?.name}',
                            style: TextFontStyle.text17c192A48w600),
                        UIHelper.verticalSpace(11.h),
                        Text(
                          engineerData?.about ?? 'No about available',
                          style: TextFontStyle.text14cc4C5363robotos,
                        ),
                        UIHelper.verticalSpace(30.h),
                        Text('Portfolio',
                            style: TextFontStyle.text17c192A48w600),
                        UIHelper.verticalSpace(35.h),

                        GridView.builder(
                          itemCount: portfolioImages.length,
                          shrinkWrap: true,
                          physics:
                              const NeverScrollableScrollPhysics(), // Prevent scrolling conflict
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1.3,
                            crossAxisSpacing: 5,
                          ),
                          itemBuilder: (_, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 1.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(14.r),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          portfolioImages[index].image ?? '',
                                      placeholder: (context, url) => Container(
                                        width: 121.w,
                                        height: 71.h,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(14.r),
                                        ),
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2.0,
                                            color: AppColors
                                                .allPrimaryColor, // Custom loader color
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        width: 121.w,
                                        height: 71.h,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[
                                              300], // Fallback background color
                                          borderRadius:
                                              BorderRadius.circular(14.r),
                                        ),
                                        child: const Icon(
                                          Icons.broken_image,
                                          color: Colors.grey,
                                          size: 40,
                                        ),
                                      ),
                                      width: 121.w,
                                      height: 71.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  UIHelper.verticalSpace(5.h),
                                ],
                              ),
                            );
                          },
                        ),

                        UIHelper.verticalSpace(22.h),
                        CustomButton(
                          onTap: () {
                            Get.bottomSheet(
                              const CustomBottomSheetTwo(),
                            );
                          },
                          radius: BorderRadius.circular(111.r),
                          padding: EdgeInsets.symmetric(vertical: 17.h),
                          title: 'Discuss issue',
                          style: TextFontStyle.text15cFFFFFF500,
                          color: AppColors.allPrimaryColor,
                        ),
                        UIHelper.verticalSpace(22.h),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text(
                    'No data Found',
                  ),
                );
              }
            }));
  }
}
