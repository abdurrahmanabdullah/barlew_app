// // import 'package:barlew_app/common_widget/custom_button_two.dart';
// // import 'package:barlew_app/features/customer/matched_engineer/model/match_engineer_model.dart';
// // import 'package:barlew_app/gen/colors.gen.dart';
// // import 'package:barlew_app/helpers/all_routes.dart';
// // import 'package:barlew_app/helpers/navigation_service.dart';
// // import 'package:barlew_app/helpers/ui_helpers.dart';
// // import 'package:barlew_app/networks/api_access.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';

// // import '../../../../constant/text_font_style.dart';
// // import '../../../../gen/assets.gen.dart';

// // class MatchedResultScreen extends StatefulWidget {
// //   const MatchedResultScreen({super.key});

// //   @override
// //   State<MatchedResultScreen> createState() => _MatchedEngineerScreenState();
// // }

// // class _MatchedEngineerScreenState extends State<MatchedResultScreen> {
// //   int? engineerId;
// //   @override
// //   void initState() {
// //     super.initState();
// //     matchEngineerRXobj.getFileData;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         scrolledUnderElevation: 0,
// //         backgroundColor: const Color(0xFFF5F5F5),
// //         centerTitle: true,
// //         automaticallyImplyLeading: true,
// //         title: Text(
// //           'Matched Result',
// //           style: TextFontStyle.text20cprimarycolorw500,
// //         ),
// //       ),
// //       backgroundColor: const Color(0xFFF5F5F5),
// //       body: StreamBuilder<MatchEngineerResponseModel>(
// //         stream: matchEngineerRXobj.dataFetcher,
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           } else if (!snapshot.hasData ||
// //               snapshot.data?.data?.isEmpty == true) {
// //             return const Center(child: Text('No matched engineers found.'));
// //           }

// //           List<Datum> engineers = snapshot.data!.data!;

// //           return Padding(
// //             padding: EdgeInsets.symmetric(horizontal: 10.w),
// //             child: SingleChildScrollView(
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   UIHelper.verticalSpace(24.h),
// //                   ListView.builder(
// //                     shrinkWrap: true,
// //                     physics: const NeverScrollableScrollPhysics(),
// //                     itemCount: engineers.length,
// //                     itemBuilder: (context, index) {
// //                       final engineer = engineers[index];
// //                       engineerId = engineer.id ?? 0;
// //                       return Padding(
// //                         padding: EdgeInsets.only(bottom: 16.h),
// //                         child: Container(
// //                           width: 441.w,
// //                           height: 94.h,
// //                           padding: const EdgeInsets.symmetric(
// //                               vertical: 10, horizontal: 10),
// //                           decoration: ShapeDecoration(
// //                             color: Colors.white,
// //                             shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(8)),
// //                           ),
// //                           child: Row(
// //                             children: [
// //                               Container(
// //                                 width: 70.w,
// //                                 height: 68.h,
// //                                 decoration: ShapeDecoration(
// //                                   image: DecorationImage(
// //                                     image: NetworkImage(engineer.avatar ?? ""),
// //                                     fit: BoxFit.fill,
// //                                   ),
// //                                   shape: RoundedRectangleBorder(
// //                                       borderRadius: BorderRadius.circular(4)),
// //                                 ),
// //                               ),
// //                               // Container(
// //                               //   width: 70.w,
// //                               //   height: 68.h,
// //                               //   decoration: ShapeDecoration(
// //                               //     image: DecorationImage(
// //                               //       image: engineer.avatar != null
// //                               //           ? NetworkImage(engineer.avatar!)
// //                               //           : AssetImage(Assets.images.boy.path)
// //                               //               as ImageProvider,
// //                               //       fit: BoxFit.fill,
// //                               //     ),
// //                               //     shape: RoundedRectangleBorder(
// //                               //       borderRadius: BorderRadius.circular(4),
// //                               //     ),
// //                               //   ),
// //                               // ),

// //                               UIHelper.horizontalSpace(14.h),
// //                               Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Text(
// //                                     "${engineer.firstName ?? ''} ${engineer.lastName ?? ''}",
// //                                     style: const TextStyle(
// //                                       color: Color(0xFF192A48),
// //                                       fontSize: 16,
// //                                       fontFamily: 'Roboto',
// //                                       fontWeight: FontWeight.w500,
// //                                     ),
// //                                   ),
// //                                   Text(engineer.service ?? 'Unknown Service'),
// //                                   Row(
// //                                     mainAxisAlignment: MainAxisAlignment.start,
// //                                     children: [
// //                                       CircleAvatar(
// //                                         radius: 10,
// //                                         backgroundImage: AssetImage(
// //                                             Assets.images.splashImage.path),
// //                                       ),
// //                                       UIHelper.horizontalSpace(6.w),
// //                                       GestureDetector(
// //                                         child: Image.asset(
// //                                             Assets.icons.strat.path,
// //                                             height: 14.h),
// //                                       ),
// //                                       UIHelper.horizontalSpace(6.w),
// //                                       Text(
// //                                         '${engineer.averageRating ?? 0.0}',
// //                                         maxLines: 2,
// //                                         overflow: TextOverflow.ellipsis,
// //                                         style:
// //                                             TextFontStyle.text14c9198A6roboto,
// //                                       ),
// //                                       UIHelper.horizontalSpace(5.w),
// //                                       Text(
// //                                         '(${engineer.reviewCount ?? 0} Reviews)',
// //                                         maxLines: 2,
// //                                         overflow: TextOverflow.ellipsis,
// //                                         textAlign: TextAlign.justify,
// //                                         style:
// //                                             TextFontStyle.text14c9198A6roboto,
// //                                       ),
// //                                       UIHelper.horizontalSpace(12.h),
// //                                       GestureDetector(
// //                                         onTap: () {
// //                                           print(
// //                                               "Clicked Engineer ID: ${engineer.id}");
// //                                           NavigationService.navigateToWithArgs(
// //                                               Routes.matchedEngineerScreen,
// //                                               {"id": engineerId});

// //                                           print("View Details button pressed");
// //                                         },
// //                                         child: Container(
// //                                           width: 90.w,
// //                                           height: 32.h,
// //                                           padding: const EdgeInsets.symmetric(
// //                                               horizontal: 16, vertical: 6),
// //                                           decoration: ShapeDecoration(
// //                                             color: const Color(0xFF024F9E),
// //                                             shape: RoundedRectangleBorder(
// //                                               borderRadius:
// //                                                   BorderRadius.circular(166),
// //                                             ),
// //                                           ),
// //                                           child: const Center(
// //                                             child: Text(
// //                                               'View Details',
// //                                               textAlign: TextAlign.center,
// //                                               style: TextStyle(
// //                                                 color: Colors.white,
// //                                                 fontSize: 10,
// //                                                 fontFamily: 'Roboto',
// //                                                 fontWeight: FontWeight.w500,
// //                                                 height: 2,
// //                                                 letterSpacing: 0.25,
// //                                               ),
// //                                             ),
// //                                           ),
// //                                         ),
// //                                       )
// //                                     ],
// //                                   ),
// //                                 ],
// //                               )
// //                             ],
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                   UIHelper.verticalSpace(22.h),
// //                   Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 30.0),
// //                     child: CustomButtonTow(
// //                       // onTap: () {
// //                       //   NavigationService.navigateTo(
// //                       //     Routes.matchedEngineerScreen,
// //                       //   );
// //                       // },
// //                       title: Text(
// //                         'Next',
// //                         style: TextFontStyle.text15cFFFFFF500,
// //                       ),
// //                       color: AppColors.allPrimaryColor,
// //                       padding: EdgeInsets.symmetric(vertical: 18.h),
// //                       radius: BorderRadius.circular(111.r),
// //                     ),
// //                   ),
// //                   UIHelper.verticalSpace(22.h),
// //                 ],
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// ////////////////////////////// api pass but argument is not pass correctly

// // import 'package:barlew_app/common_widget/custom_button_two.dart';
// // import 'package:barlew_app/features/customer/matched_engineer/model/match_engineer_model.dart';
// // import 'package:barlew_app/gen/colors.gen.dart';
// // import 'package:barlew_app/helpers/all_routes.dart';
// // import 'package:barlew_app/helpers/navigation_service.dart';
// // import 'package:barlew_app/helpers/ui_helpers.dart';
// // import 'package:barlew_app/networks/api_access.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';

// // import '../../../../constant/text_font_style.dart';
// // import '../../../../gen/assets.gen.dart';

// // class MatchedResultScreen extends StatefulWidget {
// //   const MatchedResultScreen({super.key});

// //   @override
// //   State<MatchedResultScreen> createState() => _MatchedEngineerScreenState();
// // }

// // class _MatchedEngineerScreenState extends State<MatchedResultScreen> {
// //   int? engineerId;
// //   @override
// //   void initState() {
// //     super.initState();
// //     matchEngineerRXobj.getFileData;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         scrolledUnderElevation: 0,
// //         backgroundColor: const Color(0xFFF5F5F5),
// //         centerTitle: true,
// //         automaticallyImplyLeading: true,
// //         title: Text(
// //           'Matched Result',
// //           style: TextFontStyle.text20cprimarycolorw500,
// //         ),
// //       ),
// //       backgroundColor: const Color(0xFFF5F5F5),
// //       body: StreamBuilder<MatchEngineerResponseModel>(
// //         stream: matchEngineerRXobj.dataFetcher,
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           } else if (!snapshot.hasData ||
// //               snapshot.data?.data?.isEmpty == true) {
// //             return const Center(child: Text('No matched engineers found.'));
// //           }

// //           List<Datum> engineers = snapshot.data!.data!;

// //           return Padding(
// //             padding: EdgeInsets.symmetric(horizontal: 10.w),
// //             child: SingleChildScrollView(
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   UIHelper.verticalSpace(24.h),
// //                   ListView.builder(
// //                     shrinkWrap: true,
// //                     physics: const NeverScrollableScrollPhysics(),
// //                     itemCount: engineers.length,
// //                     itemBuilder: (context, index) {
// //                       final engineer = engineers[index];
// //                       engineerId = engineer.id ?? 0;
// //                       return Padding(
// //                         padding: EdgeInsets.only(bottom: 16.h),
// //                         child: Container(
// //                           width: 441.w,
// //                           height: 94.h,
// //                           padding: const EdgeInsets.symmetric(
// //                               vertical: 10, horizontal: 10),
// //                           decoration: ShapeDecoration(
// //                             color: Colors.white,
// //                             shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(8)),
// //                           ),
// //                           child: Row(
// //                             children: [
// //                               Container(
// //                                 width: 70.w,
// //                                 height: 68.h,
// //                                 decoration: ShapeDecoration(
// //                                   image: DecorationImage(
// //                                     image: NetworkImage(engineer.avatar ?? ""),
// //                                     fit: BoxFit.fill,
// //                                   ),
// //                                   shape: RoundedRectangleBorder(
// //                                       borderRadius: BorderRadius.circular(4)),
// //                                 ),
// //                               ),
// //                               // Container(
// //                               //   width: 70.w,
// //                               //   height: 68.h,
// //                               //   decoration: ShapeDecoration(
// //                               //     image: DecorationImage(
// //                               //       image: engineer.avatar != null
// //                               //           ? NetworkImage(engineer.avatar!)
// //                               //           : AssetImage(Assets.images.boy.path)
// //                               //               as ImageProvider,
// //                               //       fit: BoxFit.fill,
// //                               //     ),
// //                               //     shape: RoundedRectangleBorder(
// //                               //       borderRadius: BorderRadius.circular(4),
// //                               //     ),
// //                               //   ),
// //                               // ),

// //                               UIHelper.horizontalSpace(14.h),
// //                               Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Text(
// //                                     "${engineer.firstName ?? ''} ${engineer.lastName ?? ''}",
// //                                     style: const TextStyle(
// //                                       color: Color(0xFF192A48),
// //                                       fontSize: 16,
// //                                       fontFamily: 'Roboto',
// //                                       fontWeight: FontWeight.w500,
// //                                     ),
// //                                   ),
// //                                   Text(engineer.service ?? 'Unknown Service'),
// //                                   Row(
// //                                     mainAxisAlignment: MainAxisAlignment.start,
// //                                     children: [
// //                                       CircleAvatar(
// //                                         radius: 10,
// //                                         backgroundImage: AssetImage(
// //                                             Assets.images.splashImage.path),
// //                                       ),
// //                                       UIHelper.horizontalSpace(6.w),
// //                                       GestureDetector(
// //                                         child: Image.asset(
// //                                             Assets.icons.strat.path,
// //                                             height: 14.h),
// //                                       ),
// //                                       UIHelper.horizontalSpace(6.w),
// //                                       Text(
// //                                         '${engineer.averageRating ?? 0.0}',
// //                                         maxLines: 2,
// //                                         overflow: TextOverflow.ellipsis,
// //                                         style:
// //                                             TextFontStyle.text14c9198A6roboto,
// //                                       ),
// //                                       UIHelper.horizontalSpace(5.w),
// //                                       Text(
// //                                         '(${engineer.reviewCount ?? 0} Reviews)',
// //                                         maxLines: 2,
// //                                         overflow: TextOverflow.ellipsis,
// //                                         textAlign: TextAlign.justify,
// //                                         style:
// //                                             TextFontStyle.text14c9198A6roboto,
// //                                       ),
// //                                       UIHelper.horizontalSpace(12.h),
// //                                       GestureDetector(
// //                                         onTap: () {
// //                                           print(
// //                                               "Clicked Engineer ID: ${engineer.id}");
// //                                           NavigationService.navigateToWithArgs(
// //                                               Routes.matchedEngineerScreen,
// //                                               {"id": engineerId});

// //                                           print("View Details button pressed");
// //                                         },
// //                                         child: Container(
// //                                           width: 90.w,
// //                                           height: 32.h,
// //                                           padding: const EdgeInsets.symmetric(
// //                                               horizontal: 16, vertical: 6),
// //                                           decoration: ShapeDecoration(
// //                                             color: const Color(0xFF024F9E),
// //                                             shape: RoundedRectangleBorder(
// //                                               borderRadius:
// //                                                   BorderRadius.circular(166),
// //                                             ),
// //                                           ),
// //                                           child: const Center(
// //                                             child: Text(
// //                                               'View Details',
// //                                               textAlign: TextAlign.center,
// //                                               style: TextStyle(
// //                                                 color: Colors.white,
// //                                                 fontSize: 10,
// //                                                 fontFamily: 'Roboto',
// //                                                 fontWeight: FontWeight.w500,
// //                                                 height: 2,
// //                                                 letterSpacing: 0.25,
// //                                               ),
// //                                             ),
// //                                           ),
// //                                         ),
// //                                       )
// //                                     ],
// //                                   ),
// //                                 ],
// //                               )
// //                             ],
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                   UIHelper.verticalSpace(22.h),
// //                   Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 30.0),
// //                     child: CustomButtonTow(
// //                       // onTap: () {
// //                       //   NavigationService.navigateTo(
// //                       //     Routes.matchedEngineerScreen,
// //                       //   );
// //                       // },
// //                       title: Text(
// //                         'Next',
// //                         style: TextFontStyle.text15cFFFFFF500,
// //                       ),
// //                       color: AppColors.allPrimaryColor,
// //                       padding: EdgeInsets.symmetric(vertical: 18.h),
// //                       radius: BorderRadius.circular(111.r),
// //                     ),
// //                   ),
// //                   UIHelper.verticalSpace(22.h),
// //                 ],
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// //////////////////--------------

// import 'package:barlew_app/common_widget/custom_button_two.dart';
// import 'package:barlew_app/features/customer/matched_engineer/model/match_engineer_model.dart';
// import 'package:barlew_app/gen/colors.gen.dart';
// import 'package:barlew_app/helpers/all_routes.dart';
// import 'package:barlew_app/helpers/navigation_service.dart';
// import 'package:barlew_app/helpers/ui_helpers.dart';
// import 'package:barlew_app/networks/api_access.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../constant/text_font_style.dart';
// import '../../../../gen/assets.gen.dart';

// class MatchedResultScreen extends StatefulWidget {
//   const MatchedResultScreen({super.key});

//   @override
//   State<MatchedResultScreen> createState() => _MatchedEngineerScreenState();
// }

// class _MatchedEngineerScreenState extends State<MatchedResultScreen> {
//   int? engineerId;
//   @override
//   void initState() {
//     super.initState();
//     matchEngineerRXobj.getFileData;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         scrolledUnderElevation: 0,
//         backgroundColor: const Color(0xFFF5F5F5),
//         centerTitle: true,
//         automaticallyImplyLeading: true,
//         title: Text(
//           'Matched Result',
//           style: TextFontStyle.text20cprimarycolorw500,
//         ),
//       ),
//       backgroundColor: const Color(0xFFF5F5F5),
//       body: StreamBuilder<MatchEngineerResponseModel>(
//         stream: matchEngineerRXobj.dataFetcher,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData ||
//               snapshot.data?.data?.isEmpty == true) {
//             return const Center(child: Text('No matched engineers found.'));
//           }

//           List<Datum> engineers = snapshot.data!.data!;

//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.w),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   UIHelper.verticalSpace(24.h),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: engineers.length,
//                     itemBuilder: (context, index) {
//                       final engineer = engineers[index];
//                       engineerId = engineer.id ?? 0;
//                       return Padding(
//                         padding: EdgeInsets.only(bottom: 16.h),
//                         child: Container(
//                           width: 441.w,
//                           height: 94.h,
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 10),
//                           decoration: ShapeDecoration(
//                             color: Colors.white,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8)),
//                           ),
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: 70.w,
//                                 height: 68.h,
//                                 decoration: ShapeDecoration(
//                                   image: DecorationImage(
//                                     image: engineer.avatar != null &&
//                                             engineer.avatar!.isNotEmpty
//                                         ? CachedNetworkImageProvider(
//                                             engineer.avatar!)
//                                         : AssetImage(
//                                             Assets.images.emptyImg.path),
//                                     fit: BoxFit.fill,
//                                   ),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(4)),
//                                 ),
//                               ),
//                               UIHelper.horizontalSpace(14.h),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "${engineer.firstName ?? ''} ${engineer.lastName ?? ''}",
//                                     style: const TextStyle(
//                                       color: Color(0xFF192A48),
//                                       fontSize: 16,
//                                       fontFamily: 'Roboto',
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                   Text(engineer.service ?? 'Unknown Service'),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       CircleAvatar(
//                                         radius: 10,
//                                         backgroundImage: AssetImage(
//                                             Assets.images.splashImage.path),
//                                       ),
//                                       UIHelper.horizontalSpace(6.w),
//                                       GestureDetector(
//                                         child: Image.asset(
//                                             Assets.icons.strat.path,
//                                             height: 14.h),
//                                       ),
//                                       UIHelper.horizontalSpace(6.w),
//                                       Text(
//                                         '${engineer.averageRating ?? 0.0}',
//                                         maxLines: 2,
//                                         overflow: TextOverflow.ellipsis,
//                                         style:
//                                             TextFontStyle.text14c9198A6roboto,
//                                       ),
//                                       UIHelper.horizontalSpace(5.w),
//                                       Text(
//                                         '(${engineer.reviewCount ?? 0} Reviews)',
//                                         maxLines: 2,
//                                         overflow: TextOverflow.ellipsis,
//                                         textAlign: TextAlign.justify,
//                                         style:
//                                             TextFontStyle.text14c9198A6roboto,
//                                       ),
//                                       UIHelper.horizontalSpace(12.h),
//                                       GestureDetector(
//                                         onTap: () {
//                                           print(
//                                               "Clicked Engineer ID: ${engineer.id}");
//                                           NavigationService.navigateToWithArgs(
//                                               Routes.matchedEngineerScreen,
//                                               {"id": engineerId});

//                                           print("View Details button pressed");
//                                         },
//                                         child: Container(
//                                           width: 90.w,
//                                           height: 32.h,
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 16, vertical: 6),
//                                           decoration: ShapeDecoration(
//                                             color: const Color(0xFF024F9E),
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(166),
//                                             ),
//                                           ),
//                                           child: const Center(
//                                             child: Text(
//                                               'View Details',
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 10,
//                                                 fontFamily: 'Roboto',
//                                                 fontWeight: FontWeight.w500,
//                                                 height: 2,
//                                                 letterSpacing: 0.25,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   UIHelper.verticalSpace(22.h),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                     child: CustomButtonTow(
//                       // onTap: () {
//                       //   NavigationService.navigateTo(
//                       //     Routes.matchedEngineerScreen,
//                       //   );
//                       // },
//                       title: Text(
//                         'Next',
//                         style: TextFontStyle.text15cFFFFFF500,
//                       ),
//                       color: AppColors.allPrimaryColor,
//                       padding: EdgeInsets.symmetric(vertical: 18.h),
//                       radius: BorderRadius.circular(111.r),
//                     ),
//                   ),
//                   UIHelper.verticalSpace(22.h),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
