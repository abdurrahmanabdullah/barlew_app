// import 'package:barlew_app/constant/text_font_style.dart';
// import 'package:barlew_app/gen/assets.gen.dart';
// import 'package:barlew_app/gen/colors.gen.dart';
// import 'package:barlew_app/helpers/navigation_service.dart';
// import 'package:barlew_app/helpers/ui_helpers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// import '../../../../common_widget/custom_button_two.dart';
// import '../../../../helpers/all_routes.dart';

// class EngineerLevelScreen extends StatefulWidget {
//   const EngineerLevelScreen({super.key});

//   @override
//   State<EngineerLevelScreen> createState() => _EngineerLevelScreenState();
// }

// class _EngineerLevelScreenState extends State<EngineerLevelScreen> {
//   int _selectedButtonIndex = -1; // Track selected button index

//   void _onSelectLevel(int index) {
//     setState(() {
//       _selectedButtonIndex = index; // Update selected index
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFF5F5F5),
//         centerTitle: true,
//         elevation: 0,
//         title: Text(
//           'Engineer Level',
//           style: TextFontStyle.text20cprimarycolorw500,
//         ),
//       ),
//       backgroundColor: const Color(0xFFF5F5F5),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Question 3/4',
//                 style: TextFontStyle.text14callprimaryColor2w400,
//               ),
//               UIHelper.verticalSpace(9.h),
//               Text(
//                 'When was the boiler last serviced?',
//                 style: TextFontStyle.text20cprimarycolorw500.copyWith(
//                   fontSize: 20.sp,
//                 ),
//               ),
//               UIHelper.verticalSpace(22.h),

//               /// Beginner
//               CustomButtonTow(
//                 color: _selectedButtonIndex == 0
//                     ? AppColors.allPrimaryColor
//                     : AppColors.cFFFFFF,
//                 padding: const EdgeInsets.symmetric(vertical: 3),
//                 onTap: () => _onSelectLevel(0),
//                 title: Row(
//                   children: [
//                     Radio<int>(
//                       activeColor: Colors.white,
//                       value: 0,
//                       groupValue: _selectedButtonIndex,
//                       onChanged: (value) => _onSelectLevel(value!),
//                     ),
//                     Text(
//                       'Beginner',
//                       style: TextStyle(
//                         color: _selectedButtonIndex == 0
//                             ? Colors.white
//                             : Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               UIHelper.verticalSpace(11.h),

//               /// Skilled
//               CustomButtonTow(
//                 color: _selectedButtonIndex == 1
//                     ? AppColors.allPrimaryColor
//                     : AppColors.cFFFFFF,
//                 padding: const EdgeInsets.symmetric(vertical: 3),
//                 onTap: () => _onSelectLevel(1),
//                 title: Row(
//                   children: [
//                     Radio<int>(
//                       activeColor: Colors.white,
//                       value: 1,
//                       groupValue: _selectedButtonIndex,
//                       onChanged: (value) => _onSelectLevel(value!),
//                     ),
//                     Text(
//                       'Skilled',
//                       style: TextStyle(
//                         color: _selectedButtonIndex == 1
//                             ? Colors.white
//                             : Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               UIHelper.verticalSpace(11.h),

//               /// Pro
//               CustomButtonTow(
//                 color: _selectedButtonIndex == 2
//                     ? AppColors.allPrimaryColor
//                     : AppColors.cFFFFFF,
//                 padding: const EdgeInsets.symmetric(vertical: 3),
//                 onTap: () => _onSelectLevel(2),
//                 title: Row(
//                   children: [
//                     Radio<int>(
//                       activeColor: Colors.white,
//                       value: 2,
//                       groupValue: _selectedButtonIndex,
//                       onChanged: (value) => _onSelectLevel(value!),
//                     ),
//                     Text(
//                       'Pro',
//                       style: TextStyle(
//                         color: _selectedButtonIndex == 2
//                             ? Colors.white
//                             : Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               UIHelper.verticalSpace(40.h),
//               const Text(
//                 'Suggested Engineer Skill',
//                 style: TextStyle(
//                   color: Color(0xFF192A48),
//                   fontSize: 20,
//                   fontFamily: 'Roboto',
//                   fontWeight: FontWeight.w500,
//                   height: 1,
//                   letterSpacing: 0.25,
//                 ),
//               ),
//               UIHelper.verticalSpace(31.h),

//               /// suggestion Engineer skill
//               Row(
//                 children: [
//                   Expanded(
//                     child: CustomTagButton(
//                       title: 'Pipe fitting',
//                       onTap: () {
//                         print('Welding button clicked!');
//                       },
//                     ),
//                   ),
//                   UIHelper.horizontalSpace(5.h),
//                   Expanded(
//                     child: CustomTagButton(
//                       title: 'Plumbing',
//                       onTap: () {
//                         print('Welding button clicked!');
//                       },
//                     ),
//                   ),
//                   UIHelper.horizontalSpace(5.h),
//                   Expanded(
//                     child: CustomTagButton(
//                       title: 'System testing',
//                       onTap: () {
//                         print('Welding button clicked!');
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               UIHelper.verticalSpace(11.h),
//               Row(
//                 children: [
//                   Expanded(
//                     child: CustomTagButton(
//                       title: 'Tv Mountaing',
//                       onTap: () {
//                         print('Welding button clicked!');
//                       },
//                     ),
//                   ),
//                   UIHelper.horizontalSpace(10.h),
//                   Expanded(
//                     child: CustomTagButton(
//                       title: 'Pipe fitting',
//                       onTap: () {
//                         print('Welding button clicked!');
//                       },
//                     ),
//                   ),
//                   UIHelper.horizontalSpace(11.h),
//                   Expanded(
//                     child: CustomTagButton(
//                       title: 'Plumbing',
//                       onTap: () {
//                         print('Welding button clicked!');
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               UIHelper.verticalSpace(11.h),
//               Row(
//                 children: [
//                   Expanded(
//                     child: CustomTagButton(
//                       title: 'Tv Mountaing',
//                       onTap: () {
//                         print('Welding button clicked!');
//                       },
//                     ),
//                   ),
//                   UIHelper.horizontalSpace(10.h),
//                   Expanded(
//                     child: CustomTagButton(
//                       title: 'Pipe fitting',
//                       onTap: () {
//                         print('Welding button clicked!');
//                       },
//                     ),
//                   ),
//                   UIHelper.horizontalSpace(11.h),
//                   Expanded(
//                     child: CustomTagButton(
//                       title: 'Plumbing',
//                       onTap: () {
//                         print('Welding button clicked!');
//                       },
//                     ),
//                   ),
//                 ],
//               ),

// //// pick any 5 option
//               UIHelper.verticalSpace(11.h),
//               SizedBox(
//                 width: 361,
//                 height: 20,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // Icon with correct dimensions and fit
//                     Container(
//                       width: 20,
//                       height: 20,
//                       clipBehavior: Clip.antiAlias,
//                       decoration: BoxDecoration(),
//                       child: SvgPicture.asset(
//                         Assets.icons.pick,
//                         fit: BoxFit
//                             .contain, // Ensures the icon fits within the container
//                       ),
//                     ),
//                     const SizedBox(width: 8), // Space between icon and text
//                     const Text(
//                       'Pick Any 5 Option',
//                       style: TextStyle(
//                         color: Color(0xFF192A48),
//                         fontSize: 12,
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w400,
//                         height: 1.67,
//                         letterSpacing: 0.25,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               UIHelper.verticalSpace(40.h),

//               /// Next Button
//               CustomButtonTow(
//                 onTap: () {
//                   NavigationService.navigateTo(Routes.waitingScreen);
//                 },
//                 title: Text(
//                   'Next',
//                   style: TextFontStyle.text15cFFFFFF500,
//                 ),
//                 color: AppColors.allPrimaryColor,
//                 padding: EdgeInsets.symmetric(vertical: 18.h),
//                 radius: BorderRadius.circular(111.r),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ///// resusable widget
// class CustomTagButton extends StatefulWidget {
//   final String title;
//   final Color color;

//   final VoidCallback? onTap;

//   const CustomTagButton({
//     Key? key,
//     required this.title,
//     this.color = Colors.white, // Default color is white

//     this.onTap,
//   }) : super(key: key);

//   @override
//   _CustomTagButtonState createState() => _CustomTagButtonState();
// }

// class _CustomTagButtonState extends State<CustomTagButton> {
//   Color _currentColor = Colors.white;
//   bool _isClicked = false; // Track the clicked state

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _isClicked = !_isClicked; // Toggle the clicked state
//           _currentColor = _isClicked
//               ? const Color(0xFF024F9E)
//               : Colors.white; // Change color based on clicked state
//         });

//         if (widget.onTap != null) {
//           widget.onTap!();
//         }
//       },
//       child: MouseRegion(
//         onEnter: (_) {
//           setState(() {
//             if (!_isClicked) {
//               _currentColor = const Color(0xFF024F9E);
//             }
//           });
//         },
//         onExit: (_) {
//           setState(() {
//             if (!_isClicked) {
//               _currentColor = widget.color;
//             }
//           });
//         },
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
//           decoration: BoxDecoration(
//             color: _currentColor,
//             borderRadius: BorderRadius.circular(4),
//           ),
//           child: Center(
//             child: Text(
//               widget.title,
//               textAlign: TextAlign.center,
//               softWrap: false,
//               style: const TextStyle(
//                 color: Color(0xFF798090),
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
///// ------------------------------from api
// import 'package:barlew_app/constant/text_font_style.dart';
// import 'package:barlew_app/features/engineer/engineer_auth/engineer_register/model/engineer_lavel_model.dart';
// import 'package:barlew_app/gen/assets.gen.dart';
// import 'package:barlew_app/gen/colors.gen.dart';
// import 'package:barlew_app/helpers/navigation_service.dart';
// import 'package:barlew_app/helpers/ui_helpers.dart';
// import 'package:barlew_app/networks/api_access.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// import '../../../../common_widget/custom_button_two.dart';
// import '../../../../helpers/all_routes.dart';
// import '../../../engineer/engineer_auth/engineer_register/model/engineer_skill_model.dart';

// class EngineerLevelScreen extends StatefulWidget {
//   const EngineerLevelScreen({super.key});

//   @override
//   State<EngineerLevelScreen> createState() => _EngineerLevelScreenState();
// }

// class _EngineerLevelScreenState extends State<EngineerLevelScreen> {
//   int _selectedButtonIndex = -1; // Track selected button index
//   List<lavelData> _levels = [];

//   List<Data> skillList = [];
//   List<int> selectedSkills = [];

//   //// level api
//   void _onSelectLevel(int index) {
//     setState(() {
//       _selectedButtonIndex = index; // Update selected index
//     });
//   }

//   Future<void> skillapicall() async {
//     try {
//       final skillData = await engineerSkillRXobj.engineerSkillRX();
//       if (skillData != null && skillData.data != null) {
//         setState(() {
//           skillList = skillData.data!;
//         });
//         print(
//             "Fetched skills: ${skillList.map((e) => e.name).toList()}"); // Debugging output
//       } else {
//         print("Skill data is null or empty");
//       }
//     } catch (e) {
//       print("Error fetching skills: $e");
//     }
//   }

//   /// Handle Skill Selection
//   void _toggleSkillSelection(int skillId) {
//     setState(() {
//       if (selectedSkills.contains(skillId)) {
//         selectedSkills.remove(skillId);
//       } else {
//         if (selectedSkills.length < 5) {
//           selectedSkills.add(skillId);
//         } else {
//           print("You can only select up to 5 skills.");
//         }
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     skillapicall();
//     lavelapicall();
//   }

//   Future<void> lavelapicall() async {
//     try {
//       final laveldata = await engineerLavelRXobj.engineerLavelRX();
//       if (laveldata != null && laveldata.data != null) {
//         setState(() {
//           _levels = laveldata.data!;
//         });
//       }
//     } catch (e) {
//       print("Error fetching levels: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFF5F5F5),
//         centerTitle: true,
//         elevation: 0,
//         title: Text(
//           'Engineer Level',
//           style: TextFontStyle.text20cprimarycolorw500,
//         ),
//       ),
//       backgroundColor: const Color(0xFFF5F5F5),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               UIHelper.verticalSpace(9.h),
//               Text(
//                 'Select now',
//                 style: TextFontStyle.text20cprimarycolorw500.copyWith(
//                   fontSize: 20.sp,
//                 ),
//               ),
//               UIHelper.verticalSpace(22.h),

//               /// Dynamically generate buttons
//               ...List.generate(_levels.length, (index) {
//                 return Column(
//                   children: [
//                     CustomButtonTow(
//                       color: _selectedButtonIndex == index
//                           ? AppColors.allPrimaryColor
//                           : AppColors.cFFFFFF,
//                       padding: const EdgeInsets.symmetric(vertical: 3),
//                       onTap: () => _onSelectLevel(index),
//                       title: Row(
//                         children: [
//                           Radio<int>(
//                             activeColor: Colors.white,
//                             value: index,
//                             groupValue: _selectedButtonIndex,
//                             onChanged: (value) => _onSelectLevel(value!),
//                           ),
//                           Text(
//                             _levels[index].name ?? "Unknown",
//                             style: TextStyle(
//                               color: _selectedButtonIndex == index
//                                   ? Colors.white
//                                   : Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     UIHelper.verticalSpace(11.h),
//                   ],
//                 );
//               }),
//               const Text(
//                 'Suggested Engineer Skill',
//                 style: TextStyle(
//                   color: Color(0xFF192A48),
//                   fontSize: 20,
//                   fontFamily: 'Roboto',
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: 0.25,
//                 ),
//               ),
//               UIHelper.verticalSpace(31.h),

//               skillList.isEmpty
//                   ? const Center(child: CircularProgressIndicator())
//                   : GridView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         // maxCrossAxisExtent: 96,
//                         crossAxisCount: 3,
//                         crossAxisSpacing: 5,
//                         mainAxisSpacing: 10,
//                         childAspectRatio: 2.5,
//                       ),
//                       itemCount: skillList.length,
//                       itemBuilder: (context, index) {
//                         final skill = skillList[index];
//                         bool isSelected = selectedSkills.contains(skill.id);

//                         return GestureDetector(
//                           onTap: () => _toggleSkillSelection(skill.id!),
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(vertical: 8),
//                             decoration: BoxDecoration(
//                               color: isSelected
//                                   ? const Color(0xFF024F9E)
//                                   : Colors.white,
//                               borderRadius: BorderRadius.circular(8),
//                               border: Border.all(
//                                 color: isSelected ? Colors.blue : Colors.grey,
//                               ),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   skill.name ?? "Unknown",
//                                   textAlign: TextAlign.center,
//                                   softWrap: false,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: const TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),

//               UIHelper.verticalSpace(20.h),

//               /// Pick Any 5 Options Indicator
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     Assets.icons.pick,
//                     width: 20,
//                     height: 20,
//                     fit: BoxFit.contain,
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     'Pick Any Options (${selectedSkills.length})',
//                     style: const TextStyle(
//                       color: Color(0xFF192A48),
//                       fontSize: 12,
//                       fontFamily: 'Roboto',
//                       fontWeight: FontWeight.w400,
//                       height: 1.67,
//                       letterSpacing: 0.25,
//                     ),
//                   ),
//                 ],
//               ),

//               UIHelper.verticalSpace(40.h),

//               CustomButtonTow(
//                 onTap: () {
//                   NavigationService.navigateTo(Routes.waitingScreen);
//                 },
//                 title: Text(
//                   'Next',
//                   style: TextFontStyle.text15cFFFFFF500,
//                 ),
//                 color: AppColors.allPrimaryColor,
//                 padding: EdgeInsets.symmetric(vertical: 18.h),
//                 radius: BorderRadius.circular(111.r),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ///// resusable widget
// class CustomTagButton extends StatefulWidget {
//   final String title;
//   final Color color;

//   final VoidCallback? onTap;

//   const CustomTagButton({
//     super.key,
//     required this.title,
//     this.color = Colors.white, // Default color is white

//     this.onTap,
//   });

//   @override
//   _CustomTagButtonState createState() => _CustomTagButtonState();
// }

// class _CustomTagButtonState extends State<CustomTagButton> {
//   Color _currentColor = Colors.white;
//   bool _isClicked = false; // Track the clicked state

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _isClicked = !_isClicked; // Toggle the clicked state
//           _currentColor = _isClicked
//               ? const Color(0xFF024F9E)
//               : Colors.white; // Change color based on clicked state
//         });

//         if (widget.onTap != null) {
//           widget.onTap!();
//         }
//       },
//       child: MouseRegion(
//         onEnter: (_) {
//           setState(() {
//             if (!_isClicked) {
//               _currentColor = const Color(0xFF024F9E);
//             }
//           });
//         },
//         onExit: (_) {
//           setState(() {
//             if (!_isClicked) {
//               _currentColor = widget.color;
//             }
//           });
//         },
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
//           decoration: BoxDecoration(
//             color: _currentColor,
//             borderRadius: BorderRadius.circular(4),
//           ),
//           child: Center(
//             child: Text(
//               widget.title,
//               textAlign: TextAlign.center,

//               softWrap: false, // Prevent text from wrapping
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 color: Color(0xFF798090),
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
/////---------------------------------from api with filter
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_register/model/engineer_lavel_model.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common_widget/custom_button_two.dart';
import '../../../../helpers/all_routes.dart';
import '../../../engineer/engineer_auth/engineer_register/model/engineer_skill_model.dart';

class EngineerLevelScreen extends StatefulWidget {
  const EngineerLevelScreen({super.key});

  @override
  State<EngineerLevelScreen> createState() => _EngineerLevelScreenState();
}

class _EngineerLevelScreenState extends State<EngineerLevelScreen> {
  int _selectedButtonIndex = -1; // Track selected button index
  List<lavelData> _levels = [];

  List<Data> skillList = [];
  List<int> selectedSkills = [];

  @override
  void initState() {
    super.initState();
    skillapicall();
  }

  void _onSelectLevel(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });
  }

  Future<void> skillapicall() async {
    try {
      final skillData = await engineerSkillRXobj.engineerSkillRX();
      if (skillData != null && skillData.data != null) {
        setState(() {
          skillList = skillData.data!;
        });
        print("Fetched skills: ${skillList.map((e) => e.name).toList()}");
      } else {
        print("Skill data is null or empty");
      }
    } catch (e) {
      print("Error fetching skills: $e");
    }
  }

  void _toggleSkillSelection(int skillId) {
    setState(() {
      if (selectedSkills.contains(skillId)) {
        selectedSkills.remove(skillId);
      } else {
        if (selectedSkills.length < 5) {
          selectedSkills.add(skillId);
        } else {
          print("You can only select up to 5 skills.");
        }
      }
    });
    print("Selected skills: ${selectedSkills}");
  }

  Future<void> matchEngineer() async {
    try {
      if (selectedSkills.isEmpty) {
        ToastUtil.showShortToast("Please select at least one skill.");
        return;
      }

      // Ensure the level is valid and in the correct format (e.g., lowercase)

      // Proceed with the API call
      await matchEngineerRXobj
          .matchEngineerRX(
        skillList: selectedSkills,
      )
          .then((value) {
        if (value) {
          NavigationService.navigateTo(
            Routes.matchedResultScreen,
          );
        } else {
          ToastUtil.showShortToast("Matching failed!");
        }
      });
    } catch (e) {
      ToastUtil.showShortToast(e.toString());
    }
  }

  // Future<void> lavelapicall() async {
  //   try {
  //     final laveldata = await engineerLavelRXobj.engineerLavelRX();
  //     if (laveldata != null && laveldata.data != null) {
  //       setState(() {
  //         _levels = laveldata.data!;
  //       });
  //       print(
  //           "Fetched levels: ${_levels.map((e) => e.name).toList()}"); // Debugging print
  //     } else {
  //       print("Level data is null or empty");
  //     }
  //   } catch (e) {
  //     print("Error fetching levels: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Engineer Level',
          style: TextFontStyle.text20cprimarycolorw500,
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpace(9.h),

              UIHelper.verticalSpace(22.h),

              /// Dynamically generate buttons
              ...List.generate(_levels.length, (index) {
                return Column(
                  children: [
                    CustomButtonTow(
                      color: _selectedButtonIndex == index
                          ? AppColors.allPrimaryColor
                          : AppColors.cFFFFFF,
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      onTap: () => _onSelectLevel(index),
                      title: Row(
                        children: [
                          Radio<int>(
                            activeColor: Colors.white,
                            value: index,
                            groupValue: _selectedButtonIndex,
                            onChanged: (value) {
                              setState(() {
                                _onSelectLevel(value!);
                                // Check if the value is within range before accessing _levels
                                if (value >= 0 && value < _levels.length) {
                                  print(
                                      "Selected Level: ${_levels[value].name ?? 'Unknown'}");
                                } else {
                                  print(
                                      "Invalid level index or out of range: $value");
                                }
                              });
                            },
                          ),
                          Text(
                            _levels[index].name ?? "Unknown",
                            style: TextStyle(
                              color: _selectedButtonIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    UIHelper.verticalSpace(11.h),
                  ],
                );
              }),
              const Text(
                'Suggested Engineer Skill',
                style: TextStyle(
                  color: Color(0xFF192A48),
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.25,
                ),
              ),
              UIHelper.verticalSpace(31.h),

              skillList.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        // maxCrossAxisExtent: 96,
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2.5,
                      ),
                      itemCount: skillList.length,
                      itemBuilder: (context, index) {
                        final skill = skillList[index];
                        bool isSelected = selectedSkills.contains(skill.id);

                        return GestureDetector(
                          onTap: () => _toggleSkillSelection(skill.id!),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF024F9E)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isSelected ? Colors.blue : Colors.grey,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  skill.name ?? "Unknown",
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

              UIHelper.verticalSpace(20.h),

              /// Pick Any 5 Options Indicator
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.icons.pick,
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Pick Any Options 3 option',
                    style: TextStyle(
                      color: Color(0xFF192A48),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 1.67,
                      letterSpacing: 0.25,
                    ),
                  ),
                ],
              ),

              UIHelper.verticalSpace(40.h),

              CustomButtonTow(
                onTap: () {
                  // apiCall();
                  matchEngineer();
                  NavigationService.navigateTo(Routes.matchedEngineerScreen);
                },
                title: Text(
                  'Next',
                  style: TextFontStyle.text15cFFFFFF500,
                ),
                color: AppColors.allPrimaryColor,
                padding: EdgeInsets.symmetric(vertical: 18.h),
                radius: BorderRadius.circular(111.r),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ///// resusable widget
class CustomTagButton extends StatefulWidget {
  final String title;
  final Color color;

  final VoidCallback? onTap;

  const CustomTagButton({
    super.key,
    required this.title,
    this.color = Colors.white, // Default color is white

    this.onTap,
  });

  @override
  _CustomTagButtonState createState() => _CustomTagButtonState();
}

class _CustomTagButtonState extends State<CustomTagButton> {
  Color _currentColor = Colors.white;
  bool _isClicked = false; // Track the clicked state

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isClicked = !_isClicked; // Toggle the clicked state
          _currentColor = _isClicked
              ? const Color(0xFF024F9E)
              : Colors.white; // Change color based on clicked state
        });

        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            if (!_isClicked) {
              _currentColor = const Color(0xFF024F9E);
            }
          });
        },
        onExit: (_) {
          setState(() {
            if (!_isClicked) {
              _currentColor = widget.color;
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          decoration: BoxDecoration(
            color: _currentColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF798090),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
