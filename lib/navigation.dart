
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'common_widget/custom_navigation_item.dart';
// import 'gen/assets.gen.dart';
// import 'gen/colors.gen.dart';
// import 'helpers/ui_helpers.dart';



// class NavigationScreen extends StatefulWidget {
//   const NavigationScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _NavigationScreenState createState() => _NavigationScreenState();
// }

// class _NavigationScreenState extends State<NavigationScreen> {
//   int _currentIndex = 0;

//   final List<Widget> _screens = [

//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.transparent,
//       body: Stack(
//         children: [
//           _screens[_currentIndex],
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10.r),
//                   child: Container(
//                     height: 70.h,
//                     width: double.maxFinite,
//                     color: AppColors.allPrimaryColor,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 20.w),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           CustomNavigationItem(
//                             onTap: () {
//                               setState(() {
//                                 _currentIndex = 0;
//                               });
//                             },
//                             ontapColor: _currentIndex == 0
//                                 ? AppColors.cFFFFFF
//                                 : Colors.transparent,
//                             lebel: "Home",
//                             icon: Assets.icons.home.path,
//                             iconColor: _currentIndex == 0
//                                 ? AppColors.c000000
//                                 : AppColors.cFFFFFF,
//                           ),
//                           CustomNavigationItem(
//                             onTap: () {
//                               setState(() {
//                                 _currentIndex = 1;
//                               });
//                             },
//                             ontapColor: _currentIndex == 1
//                                 ? AppColors.cFFFFFF
//                                 : Colors.transparent,
//                             lebel: "Home",
//                             icon: Assets.icons.community.path,
//                             iconColor: _currentIndex == 1
//                                 ? AppColors.c000000
//                                 : AppColors.cFFFFFF,
//                           ),
//                           CustomNavigationItem(
//                             onTap: () {
//                               setState(() {
//                                 _currentIndex = 2;
//                               });
//                             },
//                             ontapColor: _currentIndex == 2
//                                 ? AppColors.cFFFFFF
//                                 : Colors.transparent,
//                             lebel: "Home",
//                             icon: Assets.icons.profile.path,
//                             iconColor: _currentIndex == 2
//                                 ? AppColors.c000000
//                                 : AppColors.cFFFFFF,
//                           ),
//                           CustomNavigationItem(
//                             onTap: () {
//                               setState(() {
//                                 _currentIndex = 3;
//                               });
//                             },
//                             ontapColor: _currentIndex == 3
//                                 ? AppColors.cFFFFFF
//                                 : Colors.transparent,
//                             lebel: "Home",
//                             icon: Assets.icons.settings.path,
//                             iconColor: _currentIndex == 3
//                                 ? AppColors.c000000
//                                 : AppColors.cFFFFFF,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               UIHelper.verticalSpace(25.h)
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }