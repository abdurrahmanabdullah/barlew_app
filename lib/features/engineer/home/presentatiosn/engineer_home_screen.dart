import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/constant/app_constants.dart';
import 'package:barlew_app/constant/text_font_style.dart';

import 'package:barlew_app/features/engineer/home/model/engineer_task_list_model.dart';
import 'package:barlew_app/features/engineer/home/presentatiosn/widget/engineer_drawer.dart';
import 'package:barlew_app/features/engineer/personal_information/model/engineer_profile_model.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/di.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

class EngineerHomeScreen extends StatefulWidget {
  const EngineerHomeScreen({super.key});

  @override
  State<EngineerHomeScreen> createState() => _EngineerHomeScreenState();
}

class _EngineerHomeScreenState extends State<EngineerHomeScreen> {
  String? engineerId;
  Map<String, bool> acceptLoadingMap = {};
  Map<String, bool> declineLoadingMap = {};
  int pageId = 1;
  int lastPageNumber = 1;
  @override
  void initState() {
    super.initState();
    apiCall();
    tasklistapiCall();
  }

  tasklistapiCall() async {
    String endPart = "?page=$pageId";
    final response =
        await engineerTaskListRXobj.engineerTaskListRX(endPart: endPart);
    lastPageNumber = response?.pagination?.lastPage is int
        ? response?.pagination?.lastPage as int
        : 1;
  }

  void previouspage() {
    if (pageId > 1) {
      setState(() {
        pageId--;
      });
      tasklistapiCall();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No previous page available")),
      );
    }
  }

  void nextpage() {
    if (pageId < lastPageNumber) {
      setState(() {
        pageId++;
      });
      tasklistapiCall();
    } else {
      // Show message if no next page available
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No next page available")),
      );
    }
  }

  /// Fetch engineer profile data
  apiCall() async {
    try {
      final profileData = await engineerProfileRXObj.engineerProfileRX();

      appData.write(kUserRole, profileData!.data!.role);
    } catch (e) {
      print("Error  fetching profile data: $e");
    }
  }

  /// get method
  Future<void> submitAcceptRequest(int userId, String status) async {
    final result =
        await engineerAcceptRXobj.engineerAcceptRX(id: userId, status: status);

    if (result!) {
      tasklistapiCall();
      ToastUtil.showShortToast("success");
    } else {
      ToastUtil.showShortToast("failed");
    }
  }

  /// post method
  Future<void> submitDeclineRequest(int userId, String status) async {
    final result =
        await engineerDeniedRXobj.engineerDeniedRX(id: userId, status: status);

    if (result!) {
      tasklistapiCall();
      ToastUtil.showShortToast("success");
    } else {
      ToastUtil.showShortToast("failed");
    }
  }

  String textByStatus(String status) {
    if (status == "accepted") {
      return "Accepted";
    } else if (status == "denied") {
      return "Denied";
    } else {
      return "Pending";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const EngineerDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.cFFFFFF),
        toolbarHeight: 100.h, // Keep AppBar height large
        actions: [
          StreamBuilder<EngineerProfileModel>(
              stream: engineerProfileRXObj.dataFetcher,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SpinKitCircle(
                          color: Colors.yellow,
                          size: 50.0,
                        ),
                      ),
                    ],
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'Error: No data',
                    ),
                  );
                }
                if (snapshot.hasData) {
                  String profileSnap = snapshot.data?.data?.avatar ?? "";

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ClipOval(
                      // ignore: unnecessary_null_comparison
                      child: profileSnap != null
                          ? CachedNetworkImage(
                              width: 60.w, // Reduced width
                              // Reduced height
                              imageUrl: profileSnap,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                direction: ShimmerDirection.ltr,
                                child: Container(
                                  width: 60.w,
                                  height: 60,
                                  color: Colors.white,
                                ),
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.person,
                                size: 35.sp, // Match icon size
                              ),
                            )
                          : Image.asset(
                              Assets.images.profileAvatar.path,
                              height: 60.w,
                              width: 60.w,
                              fit: BoxFit.cover,
                            ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      'Error: No data',
                    ),
                  );
                }
              }),
          UIHelper.horizontalSpace(20.w),
        ],
        backgroundColor: AppColors.allPrimaryColor,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: StreamBuilder<EngineerTaskResponseModel>(
          stream: engineerTaskListRXobj.dataFetcher,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 130.0),
                child: Center(
                  child: SpinKitCircle(
                    color: AppColors.allPrimaryColor,
                    size: 100.0,
                  ),
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text("snapshot has error: {$snapshot.error.tostring()}"),
              );
            }

            if (snapshot.hasData) {
              final tasksSnap = snapshot.data?.data ?? [];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.verticalSpace(16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Text(
                              "New Tasks",
                              style: TextFontStyle.text15c192A48500
                                  .copyWith(fontSize: 20.sp),
                            ),
                            Positioned(
                              left: 95.w,
                              bottom: 13.h,
                              child: Container(
                                height: 20.h,
                                width: 20.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.c35BA0C,
                                ),
                                child: Center(
                                  child: Text(
                                    tasksSnap.length.toString(),
                                    style: TextFontStyle.text14cFFFFFF400
                                        .copyWith(fontSize: 13.sp),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  UIHelper.verticalSpace(10.h),
                  Divider(color: AppColors.cDBDBDB, thickness: 1.h),
                  UIHelper.verticalSpace(22.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: tasksSnap.length,
                      itemBuilder: (_, index) {
                        final tasksSnapByIndex = tasksSnap[index];

                        final task = tasksSnap[index].discussionRequest;
                        final imageList = task?.images ?? [];
                        final requestId = tasksSnap[index].requestId;
                        final userAvatar = task?.user?.avatar ??
                            Assets.icons.personPlaceholder.path;
                        final userName =
                            "${task?.user?.firstName ?? 'Unknown'} ${task?.user?.lastName ?? ''}"
                                .trim();

                        return Padding(
                          padding: EdgeInsets.only(bottom: 60.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ClipOval(
                                    child: CachedNetworkImage(
                                      width: 50.w,
                                      height: 50.h,
                                      imageUrl: userAvatar,
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
                                          Image.asset(
                                        Assets.icons.personPlaceholder.path,
                                        width: 50.w,
                                        height: 50.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  UIHelper.horizontalSpace(8.w),
                                  Text(
                                    userName,
                                    style: TextFontStyle.text16c241306w500,
                                  ),
                                ],
                              ),
                              UIHelper.verticalSpace(24.h),
                              Text(
                                tasksSnapByIndex
                                        .discussionRequest?.description ??
                                    "N/A",
                                style: TextFontStyle.text14c2BA02Fw500,
                              ),
                              UIHelper.verticalSpace(12.h),

                              /// Image GridView (if available)
                              if (imageList.isNotEmpty)
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10.w,
                                    mainAxisSpacing: 10.h,
                                    childAspectRatio: 140 / 120,
                                  ),
                                  itemCount: imageList.length,
                                  itemBuilder: (context, index) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: CachedNetworkImage(
                                        width: 150.w,
                                        height: 70.h,
                                        imageUrl: imageList[index],
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          direction: ShimmerDirection.ltr,
                                          child: Container(
                                            width: 150.w,
                                            height: 70.h,
                                            color: Colors.white,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(
                                          Icons.broken_image,
                                          size: 50.sp,
                                        ),
                                      ),
                                    );
                                  },
                                ),

                              UIHelper.verticalSpace(20.h),

                              /// Accept & Deny Buttons

                              tasksSnapByIndex.status != "pending"
                                  ? Text(textByStatus(tasksSnapByIndex.status!))
                                  : Row(
                                      children: [
                                        Expanded(
                                          child: declineLoadingMap[
                                                      requestId.toString()] ==
                                                  false
                                              ? const Center(
                                                  child: SpinKitCircle(
                                                    color: Colors.black,
                                                    size: 50.0,
                                                  ),
                                                )
                                              : CustomButton(
                                                  title: "Deny",
                                                  onTap: () async {
                                                    if (requestId != null) {
                                                      print(
                                                          "Declining request with ID: $requestId");
                                                      setState(() {
                                                        declineLoadingMap[
                                                                requestId
                                                                    .toString()] =
                                                            false; // Start loading
                                                      });
                                                      await submitDeclineRequest(
                                                          requestId, "decline");
                                                      setState(() {
                                                        declineLoadingMap[
                                                                requestId
                                                                    .toString()] =
                                                            false; // Stop loading after completion
                                                      });
                                                    }
                                                  },
                                                  border: Border.all(
                                                    width: 1.w,
                                                    color: AppColors
                                                        .allPrimaryColor,
                                                  ),
                                                  color: AppColors.cFFFFFF,
                                                  style: TextFontStyle
                                                      .text18allPrimaryColorw500
                                                      .copyWith(
                                                    fontSize: 14.sp,
                                                  ),
                                                ),
                                        ),
                                        UIHelper.horizontalSpace(12.h),
                                        Expanded(
                                          child: acceptLoadingMap[
                                                      requestId.toString()] ==
                                                  true // Show the spinner when loading
                                              ? const Center(
                                                  child: SpinKitCircle(
                                                    color: Colors.black,
                                                    size: 50.0,
                                                  ),
                                                )
                                              : CustomButton(
                                                  title: "Accept",
                                                  onTap: () async {
                                                    if (requestId != null) {
                                                      print(
                                                          "Accepting request with ID: $requestId");
                                                      setState(() {
                                                        acceptLoadingMap[requestId
                                                            .toString()] = true;
                                                      });
                                                      await submitAcceptRequest(
                                                          requestId, "accept");
                                                      setState(() {
                                                        acceptLoadingMap[requestId
                                                                .toString()] =
                                                            false;
                                                      });
                                                    }
                                                  },
                                                ),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            previouspage();
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.arrow_back, size: 24),
                              SizedBox(width: 4),
                              Text(
                                'Previous',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            nextpage();
                          },
                          child: const Row(
                            children: [
                              Text(
                                'Next',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.arrow_forward, size: 24),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  UIHelper.verticalSpace(30.h),
                ],
              );
            } else {
              return const Center(
                child: Text('Error: No data'),
              );
            }
          },
        ),
      ),
    );
  }
}
