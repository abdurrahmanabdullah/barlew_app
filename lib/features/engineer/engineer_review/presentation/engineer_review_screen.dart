import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/engineer/engineer_average_review/model/engineer_average_review_model.dart';
import 'package:barlew_app/features/engineer/engineer_review/model/engineer_review_model.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

class EngineerReviewScreen extends StatefulWidget {
  const EngineerReviewScreen({super.key});

  @override
  State<EngineerReviewScreen> createState() => _EngineerReviewScreenState();
}

class _EngineerReviewScreenState extends State<EngineerReviewScreen> {
  @override
  void initState() {
    super.initState();
    apiCall();
    averageReviewApiCall();
  }

  apiCall() async {
    await engineerRevieweRXobj.engineerRevieweRX();
  }

  averageReviewApiCall() async {
    await engineerAveratgeRevieweRXobj.engineerAverageRevieweRX();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Overall rating",
              style: TextFontStyle.text145192A48w500roboto
                  .copyWith(fontSize: 20.sp),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.icons.strat.path, height: 14.h),
                UIHelper.horizontalSpace(6.w),
                StreamBuilder<EngineerAverageReviewModel>(
                    stream: engineerAveratgeRevieweRXobj.dataFetcher,
                    builder: (context, snapshot) {
                      print(
                          "Snapshot connectionState: ${snapshot.connectionState}");
                      print("Snapshot data: ${snapshot.data}");
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
                        final EngineerAverageSnap = snapshot.data?.data;
                        if (EngineerAverageSnap != null) {
                          return Text(
                            EngineerAverageSnap.averageRating?.toString() ??
                                '0.0',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextFontStyle.text14c9198A6roboto,
                          );
                        } else {
                          return const Text('No average rating available');
                        }
                      } else {
                        return const Center(
                          child: Text("Snapshot has error"),
                        );
                      }
                    }),
              ],
            ),
          ],
        ),
        UIHelper.verticalSpace(30.h),
        StreamBuilder<EngineerAverageReviewModel>(
            stream: engineerAveratgeRevieweRXobj.dataFetcher,
            builder: (context, snapshot) {
              return Text(
                "Customer Reviews",
                style: TextFontStyle.text145192A48w500roboto
                    .copyWith(fontSize: 20.sp),
              );
            }),
        UIHelper.verticalSpace(16.h),
        StreamBuilder<EngineerReviewModel>(
            stream: engineerRevieweRXobj.dataFetcher,
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
                final reviews = snapshot.data!.data ?? [];

                return SizedBox(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: reviews.length,
                    physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      final review = reviews[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipOval(
                              child: review.reviewer?.avatar != null
                                  ? CachedNetworkImage(
                                      width: 50.w,
                                      height: 50.h,
                                      imageUrl: review.reviewer?.avatar ?? '',
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
                                    )
                                  : Image.asset(
                                      Assets.icons.personPlaceholder.path,
                                      width: 50.w,
                                      height: 50.h,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            UIHelper.horizontalSpace(12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        review.reviewer?.name ?? "Unknown",
                                        style: TextFontStyle
                                            .text145192A48w500roboto
                                            .copyWith(fontSize: 16.sp),
                                      ),
                                      UIHelper.horizontalSpace(12.w),
                                    ],
                                  ),
                                  UIHelper.verticalSpace(5),
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        child: Image.network(
                                          "https://cdn.britannica.com/33/4833-050-F6E415FE/Flag-United-States-of-America.jpg", // Default flag (can be updated dynamically from data)
                                          width: 30.w,
                                          height: 18.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      UIHelper.horizontalSpace(12.w),
                                      Text(
                                        "United States", // Location (can be fetched from the API if available)
                                        style: TextFontStyle
                                            .text145192A48w500roboto
                                            .copyWith(fontSize: 16.sp),
                                      )
                                    ],
                                  ),
                                  UIHelper.verticalSpace(12.h),
                                  Text(
                                    review.review ?? "No review",
                                    style: TextFontStyle.text14c42382Dw400,
                                  ),
                                  UIHelper.verticalSpace(8.h),
                                  Text(
                                    "Published ${review.createdAt != null ? timeAgo(DateTime.parse(review.createdAt!)) : "N/A"}",
                                    style:
                                        TextFontStyle.text14c515868roboto2w500,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Center(child: Text("No reviews available"));
              }
            })
      ],
    );
  }
}
//////-----time ago logic

String timeAgo(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inDays > 365) {
    return '${(difference.inDays / 365).floor()} year${(difference.inDays / 365).floor() > 1 ? 's' : ''} ago';
  } else if (difference.inDays > 30) {
    return '${(difference.inDays / 30).floor()} month${(difference.inDays / 30).floor() > 1 ? 's' : ''} ago';
  } else if (difference.inDays > 0) {
    return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
  } else if (difference.inSeconds > 0) {
    return '${difference.inSeconds} second${difference.inSeconds > 1 ? 's' : ''} ago';
  } else {
    return 'Just now';
  }
}
