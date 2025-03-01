import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/constant/app_constants.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/engineer/engineer_notifications/model/notification_model.dart';
import 'package:barlew_app/features/engineer/home/widget/engineer_drawer.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/di.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class EngineerHomeScreen extends StatefulWidget {
  const EngineerHomeScreen({super.key});

  @override
  State<EngineerHomeScreen> createState() => _EngineerHomeScreenState();
}

class _EngineerHomeScreenState extends State<EngineerHomeScreen> {
  String? profileImageUrl;
  String? firstName;
  String? lastName;
  String? engineerId;
  @override
  void initState() {
    super.initState();
    apiCall();
    notificationApiCall();
  }

  /// Fetch notifications
  notificationApiCall() async {
    await notificationRXobj.notificationRX();
  }

  /// Fetch engineer profile data
  Future<void> apiCall() async {
    try {
      final profileData = await engineerProfileRXObj.engineerProfileRX();
      if (mounted) {
        setState(() {
          profileImageUrl = profileData?.data?.avatar;
          firstName = profileData?.data?.firstName;
          lastName = profileData?.data?.lastName;
        });
        appData.write(kUserRole, profileData!.data!.role);
        ////-----------provider
        context.read<EngineerProvider>().setEngineerId(engineerId);
      }
    } catch (e) {
      print("Error occurred while fetching profile data: $e");
    }
  }

//// sccept denied submit form
  Future<void> submitRequest(int userId, String status) async {
    try {
      final success = await engineerAcceptDeniedRXobj.engineerAcceptDeniedRX(
          id: userId, status: status);

      if (success != null) {
        setState(() {
          engineerId = success['id'].toString(); // Extract ID
        });
      }

      // ignore: unrelated_type_equality_checks
      if (success == true) {
        ToastUtil.showShortToast(
            "Request $status Successfully for User ID: $userId.");
      } else {
        ToastUtil.showShortToast(
            "Failed to $status request for User ID: $userId.");
      }
    } catch (error) {
      if (error is DioException) {
        if (error.response?.statusCode == 400) {
          ToastUtil.showShortToast(
              "Server error occurred. Please try again later.");
        } else {
          ToastUtil.showShortToast("Request failed: ${error.message}");
        }
      } else {
        ToastUtil.showShortToast("An unknown error occurred.");
      }
      print("Error occurred: $error");
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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipOval(
              child: profileImageUrl == null
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      direction: ShimmerDirection.ltr,
                      child: Container(
                        width: 70.w, // Reduced width
                        // Reduced height
                        color: Colors.white,
                      ),
                    )
                  : CachedNetworkImage(
                      width: 70.w, // Reduced width
                      // Reduced height
                      imageUrl: profileImageUrl!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        direction: ShimmerDirection.ltr,
                        child: Container(
                          width: 50.w,
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.person,
                        size: 35.sp, // Match icon size
                      ),
                      fadeInDuration: const Duration(milliseconds: 500),
                    ),
            ),
          ),
          UIHelper.horizontalSpace(20.w),
        ],
        backgroundColor: AppColors.allPrimaryColor,
      ),
      body: RefreshIndicator(
        onRefresh: apiCall,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: StreamBuilder<NotificationModel>(
            stream: notificationRXobj.dataFetcher,
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
                  child: Text("Error loading notifications"),
                );
              }

              if (snapshot.hasData) {
                final notifications = snapshot.data?.data ?? [];

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
                                      notifications.length.toString(),
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
                        itemCount: notifications.length,
                        itemBuilder: (_, index) {
                          final notification = notifications[index];

                          // Extract user data safely
                          final userData = notification.userData;
                          final profileImageUrl =
                              userData?.avatar?.isNotEmpty == true
                                  ? userData!.avatar!
                                  : Assets.icons.personPlaceholder.path;
                          final userName = userData?.userName ?? 'Unknown User';

                          return Padding(
                            padding: EdgeInsets.only(bottom: 60.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ClipOval(
                                      child: profileImageUrl.isNotEmpty
                                          ? CachedNetworkImage(
                                              width: 50.w,
                                              height: 50.h,
                                              imageUrl: profileImageUrl,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  Shimmer.fromColors(
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[100]!,
                                                direction: ShimmerDirection.ltr,
                                                child: Container(
                                                  width: 50.w,
                                                  height: 50.h,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) => Icon(
                                                Icons.person,
                                                size: 50
                                                    .sp, // Adjusted to match the size
                                              ),
                                              fadeInDuration: const Duration(
                                                  milliseconds: 500),
                                            )
                                          : Image.asset(
                                              Assets
                                                  .icons.personPlaceholder.path,
                                              width: 50.w,
                                              height: 50.h,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                    UIHelper.horizontalSpace(8.w),
                                    Text(
                                      userName,
                                      style: TextFontStyle.text16c241306w500,
                                    )
                                  ],
                                ),
                                UIHelper.verticalSpace(24.h),
                                Text(
                                  notification.userData?.description ?? " ",
                                  style: TextFontStyle.text14c2BA02Fw500,
                                ),

                                UIHelper.verticalSpace(12.h),

                                /// Check if there are images before rendering
                                if (userData?.images != null &&
                                    userData!.images!.isNotEmpty)
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10.w,
                                      mainAxisSpacing: 10.h,
                                      childAspectRatio: 1,
                                    ),
                                    itemCount: userData.images!.length,
                                    itemBuilder: (context, index) {
                                      return ClipOval(
                                        child: userData
                                                .images![index].isNotEmpty
                                            ? CachedNetworkImage(
                                                width: 50.w,
                                                height: 50.h,
                                                imageUrl:
                                                    userData.images![index],
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor:
                                                      Colors.grey[100]!,
                                                  direction: ShimmerDirection
                                                      .ltr, // Left-to-right shimmer direction
                                                  child: Container(
                                                    width: 50.w,
                                                    height: 50.h,
                                                    color: Colors
                                                        .white, // Placeholder color
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(
                                                  Icons.person,
                                                  size: 50
                                                      .sp, // Adjusted to match the size
                                                ),
                                                fadeInDuration: const Duration(
                                                    milliseconds: 500),
                                              )
                                            : Image.asset(
                                                Assets.icons.personPlaceholder
                                                    .path,
                                                width: 50.w,
                                                height: 50.h,
                                                fit: BoxFit.cover,
                                              ),
                                      );
                                    },
                                  ),
                                UIHelper.verticalSpace(20.h),

                                /// -------------Accept denied  portion
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomButton(
                                        title: "Accept",
                                        onTap: () {
                                          final userId = notification
                                              .userData?.discussion_request_id;
                                          if (userId != null) {
                                            submitRequest(userId, "accepted");
                                          } else {
                                            ToastUtil.showShortToast(
                                                "User ID not found.");
                                          }
                                        },
                                      ),
                                    ),
                                    UIHelper.horizontalSpace(12.h),
                                    Expanded(
                                      child: CustomButton(
                                        title: "Deny",
                                        onTap: () {
                                          final userId = notification
                                              .userData?.discussion_request_id;
                                          if (userId != null) {
                                            submitRequest(userId, "denied");
                                          } else {
                                            ToastUtil.showShortToast(
                                                "User ID not found.");
                                          }
                                        },
                                        border: Border.all(
                                          width: 1.w,
                                          color: AppColors.allPrimaryColor,
                                        ),
                                        color: AppColors.cFFFFFF,
                                        style: TextFontStyle
                                            .text18allPrimaryColorw500
                                            .copyWith(fontSize: 14.sp),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
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
          ),
        ),
      ),
    );
  }
}

///----------------- provider
class EngineerProvider with ChangeNotifier {
  String? _engineerId;

  String? get engineerId => _engineerId;

  void setEngineerId(String? id) {
    _engineerId = id;
    notifyListeners();
  }
}
