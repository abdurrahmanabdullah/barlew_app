// import 'package:barlew_app/common_widget/custom_button.dart';
// import 'package:barlew_app/constant/app_constants.dart';
// import 'package:barlew_app/constant/text_font_style.dart';

// import 'package:barlew_app/features/engineer/home/model/engineer_task_list_model.dart';
// import 'package:barlew_app/features/engineer/home/widget/engineer_drawer.dart';
// import 'package:barlew_app/features/engineer/personal_information/model/engineer_profile_model.dart';
// import 'package:barlew_app/gen/assets.gen.dart';
// import 'package:barlew_app/gen/colors.gen.dart';
// import 'package:barlew_app/helpers/di.dart';
// import 'package:barlew_app/helpers/ui_helpers.dart';
// import 'package:barlew_app/networks/api_access.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:shimmer/shimmer.dart';

// class EngineerHomeScreen extends StatefulWidget {
//   const EngineerHomeScreen({super.key});

//   @override
//   State<EngineerHomeScreen> createState() => _EngineerHomeScreenState();
// }

// class _EngineerHomeScreenState extends State<EngineerHomeScreen> {
//   String? engineerId;
//   @override
//   void initState() {
//     super.initState();
//     apiCall();
//     tasklistapiCall();
//   }

//   tasklistapiCall() async {
//     await engineerTaskListRXobj.engineerTaskListRX();
//   }

//   /// Fetch engineer profile data
//   apiCall() async {
//     await engineerProfileRXObj.engineerProfileRX();
//   }

//   /// get method
//   Future<void> submitAcceptRequest(int userId, String status) async {
//     await engineerAcceptRXobj.engineerAcceptRX(id: userId, status: status);
//   }

//   /// post method
//   Future<void> submitDeclineRequest(int userId, String status) async {
//     await engineerDeniedRXobj.engineerDeniedRX(id: userId, status: status);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const EngineerDrawer(),
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: AppColors.cFFFFFF),
//         toolbarHeight: 100.h, // Keep AppBar height large
//         actions: [
//           StreamBuilder<EngineerProfileModel>(
//               stream: engineerProfileRXObj.dataFetcher,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: SpinKitCircle(
//                       color: AppColors.allPrimaryColor,
//                       size: 50.0,
//                     ),
//                   );
//                 }
//                 if (snapshot.hasError) {
//                   return const Center(
//                     child: Text("Error loading notifications"),
//                   );
//                 }

//                 if (snapshot.hasData) {
//                   appData.write(kUserRole, snapshot.data!.data!.role);
//                   final profileImageUrl = snapshot.data!.data!.avatar;
//                   return Padding(
//                     padding: const EdgeInsets.all(18.0),
//                     child: ClipOval(
//                       child: profileImageUrl == null
//                           ? Image.asset(Assets.images.profileAvatar.path)
//                           // Shimmer.fromColors(
//                           //     baseColor: Colors.grey[300]!,
//                           //     highlightColor: Colors.grey[100]!,
//                           //     direction: ShimmerDirection.ltr,
//                           //     child: Container(
//                           //       width: 70.w, // Reduced width
//                           //       // Reduced height
//                           //       color: Colors.white,
//                           //     ),
//                           //   )
//                           : CachedNetworkImage(
//                               width: 70.w, // Reduced width
//                               // Reduced height
//                               imageUrl: profileImageUrl,
//                               fit: BoxFit.cover,
//                               placeholder: (context, url) => Shimmer.fromColors(
//                                 baseColor: Colors.grey[300]!,
//                                 highlightColor: Colors.grey[100]!,
//                                 direction: ShimmerDirection.ltr,
//                                 child: Container(
//                                   width: 50.w,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               errorWidget: (context, url, error) =>
//                                   Image.asset(Assets.images.profileAvatar.path),

//                               fadeInDuration: const Duration(milliseconds: 500),
//                             ),
//                     ),
//                   );
//                 } else {
//                   return const Center(
//                     child: Text(
//                       'Error: No data',
//                     ),
//                   );
//                 }
//               }),
//           UIHelper.horizontalSpace(20.w),
//         ],
//         backgroundColor: AppColors.allPrimaryColor,
//       ),
//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: StreamBuilder<EngineerTaskResponseModel>(
//           stream: engineerTaskListRXobj.dataFetcher,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: SpinKitCircle(
//                   color: AppColors.allPrimaryColor,
//                   size: 50.0,
//                 ),
//               );
//             }

//             if (snapshot.hasError) {
//               return const Center(
//                 child: Text("Error loading notifications"),
//               );
//             }

//             if (snapshot.hasData) {
//               final tasks = snapshot.data?.data ?? [];

//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   UIHelper.verticalSpace(16.h),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.w),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Stack(
//                           clipBehavior: Clip.none,
//                           children: [
//                             Text(
//                               "New Tasks",
//                               style: TextFontStyle.text15c192A48500
//                                   .copyWith(fontSize: 20.sp),
//                             ),
//                             Positioned(
//                               left: 95.w,
//                               bottom: 13.h,
//                               child: Container(
//                                 height: 20.h,
//                                 width: 20.w,
//                                 decoration: const BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: AppColors.c35BA0C,
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     tasks.length.toString(),
//                                     style: TextFontStyle.text14cFFFFFF400
//                                         .copyWith(fontSize: 13.sp),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   UIHelper.verticalSpace(10.h),
//                   Divider(color: AppColors.cDBDBDB, thickness: 1.h),
//                   UIHelper.verticalSpace(22.h),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.w),
//                     child: ListView.builder(
//                       padding: EdgeInsets.zero,
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: tasks.length,
//                       itemBuilder: (_, index) {
//                         final task = tasks[index].discussionRequest;

//                         final servicedescription =
//                             task?.description ?? 'No Title Available';
//                         final images = task?.images ?? [];
//                         final requestIds = snapshot.data?.data
//                                 ?.map((task) => task.requestId)
//                                 .toList() ??
//                             [];

//                         List<String> imageList = [];
//                         if (task?.images != null && task!.images!.isNotEmpty) {
//                           imageList = task.images!
//                               .split(',')
//                               .map((e) => e.trim())
//                               .toList();
//                         }

//                         final userAvatar = task?.user?.avatar ??
//                             Assets.icons.personPlaceholder.path;
//                         final user = task?.user;
//                         final userName =
//                             "${user?.firstName ?? 'Unknown'} ${user?.lastName ?? ''}"
//                                 .trim();
//                         return Padding(
//                           padding: EdgeInsets.only(bottom: 60.h),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   ClipOval(
//                                     child: CachedNetworkImage(
//                                       width: 50.w,
//                                       height: 50.h,
//                                       imageUrl:
//                                           userAvatar, // Use userAvatar directly
//                                       fit: BoxFit.cover,
//                                       placeholder: (context, url) =>
//                                           Shimmer.fromColors(
//                                         baseColor: Colors.grey[300]!,
//                                         highlightColor: Colors.grey[100]!,
//                                         direction: ShimmerDirection.ltr,
//                                         child: Container(
//                                           width: 50.w,
//                                           height: 50.h,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       errorWidget: (context, url, error) =>
//                                           Image.asset(
//                                         Assets.icons.personPlaceholder.path,
//                                         width: 50.w,
//                                         height: 50.h,
//                                         fit: BoxFit.cover,
//                                       ),
//                                       fadeInDuration:
//                                           const Duration(milliseconds: 500),
//                                     ),
//                                   ),
//                                   UIHelper.horizontalSpace(8.w),
//                                   Text(
//                                     userName,
//                                     style: TextFontStyle.text16c241306w500,
//                                   ),
//                                 ],
//                               ),

//                               UIHelper.verticalSpace(24.h),
//                               Text(
//                                 servicedescription,
//                                 style: TextFontStyle.text14c2BA02Fw500,
//                               ),
//                               UIHelper.verticalSpace(12.h),

//                               /// Check if there are images before rendering
//                               if (imageList.isNotEmpty)
//                                 GridView.builder(
//                                   shrinkWrap: true,
//                                   physics: const NeverScrollableScrollPhysics(),
//                                   gridDelegate:
//                                       SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: 3,
//                                     crossAxisSpacing: 10.w,
//                                     mainAxisSpacing: 10.h,
//                                     childAspectRatio: 140 /
//                                         120, // Adjusted for reduced height
//                                   ),
//                                   itemCount: imageList.length,
//                                   itemBuilder: (context, index) {
//                                     return ClipRRect(
//                                       borderRadius: BorderRadius.circular(
//                                           8.r), // Optional rounded corners
//                                       child: CachedNetworkImage(
//                                         width: 150.w, // Keep width same
//                                         height: 70.h, // Reduce height
//                                         imageUrl: imageList[index],
//                                         fit: BoxFit.cover,
//                                         placeholder: (context, url) =>
//                                             Shimmer.fromColors(
//                                           baseColor: Colors.grey[300]!,
//                                           highlightColor: Colors.grey[100]!,
//                                           direction: ShimmerDirection.ltr,
//                                           child: Container(
//                                             width: 150.w,
//                                             height: 70
//                                                 .h, // Keep placeholder height consistent
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                         errorWidget: (context, url, error) =>
//                                             Icon(
//                                           Icons.broken_image,
//                                           size: 50.sp,
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ),

//                               UIHelper.verticalSpace(20.h),

//                               /// -------------Accept denied  portion
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: CustomButton(
//                                       title: "Accept",
//                                       onTap: () {
//                                         if (requestIds.isNotEmpty &&
//                                             index < requestIds.length) {
//                                           final requestId = requestIds[index];

//                                           if (requestId != null) {
//                                             print(
//                                                 "Accepting request with ID: $requestId");
//                                             submitAcceptRequest(
//                                                 requestId, "accept");
//                                           } else {
//                                             print(
//                                                 "Error: requestId is null for index $index");
//                                           }
//                                         }
//                                       },
//                                     ),
//                                   ),
//                                   UIHelper.horizontalSpace(12.h),
//                                   Expanded(
//                                     child: CustomButton(
//                                       title: "Deny",
//                                       onTap: () {
//                                         if (requestIds.isNotEmpty &&
//                                             index < requestIds.length) {
//                                           final declineId = requestIds[index];

//                                           if (declineId != null) {
//                                             print(
//                                                 "Decline request with ID: $declineId");
//                                             submitDeclineRequest(
//                                                 declineId, "Decline");
//                                           } else {
//                                             print(
//                                                 "Error: requestId is null for index $index");
//                                           }
//                                         }
//                                       },
//                                       border: Border.all(
//                                         width: 1.w,
//                                         color: AppColors.allPrimaryColor,
//                                       ),
//                                       color: AppColors.cFFFFFF,
//                                       style: TextFontStyle
//                                           .text18allPrimaryColorw500
//                                           .copyWith(fontSize: 14.sp),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               );
//             } else {
//               return const Center(
//                 child: Text(
//                   'Error: No data',
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// ///----------------- provider
// class EngineerProvider with ChangeNotifier {
//   String? _engineerId;

//   String? get engineerId => _engineerId;

//   void setEngineerId(String? id) {
//     _engineerId = id;
//     notifyListeners();
//   }
// }
/////---------------modification code
import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/constant/app_constants.dart';
import 'package:barlew_app/constant/text_font_style.dart';

import 'package:barlew_app/features/engineer/home/model/engineer_task_list_model.dart';
import 'package:barlew_app/features/engineer/home/widget/engineer_drawer.dart';
import 'package:barlew_app/features/engineer/personal_information/model/engineer_profile_model.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/di.dart';
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
  @override
  void initState() {
    super.initState();
    apiCall();
    tasklistapiCall();
  }

  tasklistapiCall() async {
    await engineerTaskListRXobj.engineerTaskListRX();
  }

  /// Fetch engineer profile data
  apiCall() async {
    await engineerProfileRXObj.engineerProfileRX();
  }

  /// get method
  Future<void> submitAcceptRequest(int userId, String status) async {
    await engineerAcceptRXobj.engineerAcceptRX(id: userId, status: status);
  }

  /// post method
  Future<void> submitDeclineRequest(int userId, String status) async {
    await engineerDeniedRXobj.engineerDeniedRX(id: userId, status: status);
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
                  appData.write(kUserRole, snapshot.data!.data!.role);
                  final profileImageUrl = snapshot.data!.data!.avatar;
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ClipOval(
                      child: profileImageUrl == null
                          ? Image.asset(Assets.images.profileAvatar.path)
                          // Shimmer.fromColors(
                          //     baseColor: Colors.grey[300]!,
                          //     highlightColor: Colors.grey[100]!,
                          //     direction: ShimmerDirection.ltr,
                          //     child: Container(
                          //       width: 70.w, // Reduced width
                          //       // Reduced height
                          //       color: Colors.white,
                          //     ),
                          //   )
                          : CachedNetworkImage(
                              width: 70.w, // Reduced width
                              // Reduced height
                              imageUrl: profileImageUrl,
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
                              errorWidget: (context, url, error) =>
                                  Image.asset(Assets.images.profileAvatar.path),

                              fadeInDuration: const Duration(milliseconds: 500),
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
              return const Center(
                child: SpinKitCircle(
                  color: AppColors.allPrimaryColor,
                  size: 50.0,
                ),
              );
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text("Error loading tasks"),
              );
            }

            if (snapshot.hasData) {
              final tasks = snapshot.data?.data ?? [];

              if (tasks.isEmpty) {
                return const Center(
                  child: Text("No tasks available"),
                );
              }

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
                                    tasks.length.toString(),
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
                      itemCount: tasks.length,
                      itemBuilder: (_, index) {
                        final task = tasks[index].discussionRequest;
                        final serviceDescription =
                            task?.description ?? 'No Description Available';
                        final imageList = task?.images ?? [];
                        final requestId = tasks[index].requestId;
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
                                serviceDescription,
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
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      title: "Accept",
                                      onTap: () {
                                        if (requestId != null) {
                                          print(
                                              "Accepting request with ID: $requestId");
                                          submitAcceptRequest(
                                              requestId, "accept");
                                        }
                                      },
                                    ),
                                  ),
                                  UIHelper.horizontalSpace(12.h),
                                  Expanded(
                                    child: CustomButton(
                                      title: "Deny",
                                      onTap: () {
                                        if (requestId != null) {
                                          print(
                                              "Declining request with ID: $requestId");
                                          submitDeclineRequest(
                                              requestId, "decline");
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
                child: Text('Error: No data'),
              );
            }
          },
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
