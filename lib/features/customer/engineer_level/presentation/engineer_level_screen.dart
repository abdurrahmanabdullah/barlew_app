// import 'package:barlew_app/constant/text_font_style.dart';
// import 'package:barlew_app/features/engineer/engineer_auth/engineer_register/model/engineer_lavel_model.dart';
// import 'package:barlew_app/gen/assets.gen.dart';
// import 'package:barlew_app/gen/colors.gen.dart';
// import 'package:barlew_app/helpers/navigation_service.dart';
// import 'package:barlew_app/helpers/toast.dart';
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
//   final List<lavelData> _levels = [];

//   List<Data> skillList = [];
//   List<int> selectedSkills = [];

//   @override
//   void initState() {
//     super.initState();
//     skillapicall();
//   }

//   void _onSelectLevel(int index) {
//     setState(() {
//       _selectedButtonIndex = index;
//     });
//   }

//   Future<void> skillapicall() async {
//     try {
//       final skillData = await engineerSkillRXobj.engineerSkillRX();
//       if (skillData != null && skillData.data != null) {
//         setState(() {
//           skillList = skillData.data!;
//         });
//         print("Fetched skills: ${skillList.map((e) => e.name).toList()}");
//       } else {
//         print("Skill data is null or empty");
//       }
//     } catch (e) {
//       print("Error fetching skills: $e");
//     }
//   }

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
//     print("Selected skills: ${selectedSkills}");
//   }

//   Future<void> matchEngineer() async {
//     try {
//       if (selectedSkills.isEmpty) {
//         ToastUtil.showShortToast("Please select at least one skill.");
//         return;
//       }

//       // Ensure the level is valid and in the correct format (e.g., lowercase)

//       // Proceed with the API call
//       await matchEngineerRXobj
//           .matchEngineerRX(
//         skillList: selectedSkills,
//       )
//           .then((value) {
//         if (value) {
//           NavigationService.navigateTo(
//             Routes.matchedResultScreen,
//           );
//         } else {
//           ToastUtil.showShortToast("Matching failed!");
//         }
//       });
//     } catch (e) {
//       ToastUtil.showShortToast(e.toString());
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
//                             onChanged: (value) {
//                               setState(() {
//                                 _onSelectLevel(value!);
//                                 // Check if the value is within range before accessing _levels
//                                 if (value >= 0 && value < _levels.length) {
//                                   print(
//                                       "Selected Level: ${_levels[value].name ?? 'Unknown'}");
//                                 } else {
//                                   print(
//                                       "Invalid level index or out of range: $value");
//                                 }
//                               });
//                             },
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
//                   const Text(
//                     'Pick Any Options 3 option',
//                     style: TextStyle(
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
//                   // apiCall();
//                   matchEngineer();
//                   NavigationService.navigateTo(Routes.matchedEngineerScreen);
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
//               softWrap: false,
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
///---------------------

import 'dart:io';

import 'package:barlew_app/common_widget/custom_button_two.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:barlew_app/provider/selected_answer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/all_routes.dart';
import '../../../engineer/engineer_auth/engineer_register/model/engineer_skill_model.dart';

class EngineerLevelScreen extends StatefulWidget {
  final List<XFile> imageList;
  final String description;
  const EngineerLevelScreen(
      {super.key, required this.imageList, required this.description});

  @override
  State<EngineerLevelScreen> createState() => _EngineerLevelScreenState();
}

class _EngineerLevelScreenState extends State<EngineerLevelScreen> {
  final List<Data> skillList = [];
  final List<int> selectedSkills = [];

  @override
  void initState() {
    super.initState();
    skillapicall();
  }

  Future<void> skillapicall() async {
    try {
      final skillData = await engineerSkillRXobj.engineerSkillRX();
      if (skillData != null && skillData.data != null) {
        setState(() {
          skillList.addAll(skillData.data!);
        });
        print("Fetched skills: ${skillList.map((e) => e.name).toList()}");
      } else {
        print("Skill data is null or empty");
      }
    } catch (e) {
      print("Error fetching skills: $e");
    }
  }

  formSubmit(SelectedAnswersModel selectedAnswersModel) async {
    final result = await submitProblemRXobj.submitProblemRX(
        serviceId: selectedAnswersModel.serviceID ?? 0,
        description: widget.description,
        questionId: selectedAnswersModel.selectedQuestions,
        answerId: selectedAnswersModel.selectedAnswers,
        images: widget.imageList,
        skills: selectedSkills);

    if (result) {
      ToastUtil.showShortToast("submit success");
    } else {
      ToastUtil.showShortToast("submit failed");
    }
  }

  void _toggleSkillSelection(int skillId) {
    setState(() {
      if (selectedSkills.contains(skillId)) {
        selectedSkills.remove(skillId);
      } else {
        selectedSkills.add(skillId);
      }
    });
  }

  // Future<void> matchEngineer() async {
  //   if (selectedSkills.isEmpty) {
  //     ToastUtil.showShortToast("Please select at least one skill.");
  //     return;
  //   }

  //   try {
  //     bool isSuccess = await matchEngineerRXobj.matchEngineerRX(
  //       skillList: selectedSkills,
  //     );

  //     if (isSuccess) {
  //       NavigationService.navigateTo(Routes.matchedResultScreen);
  //     } else {
  //       ToastUtil.showShortToast("Matching failed!");
  //     }
  //   } catch (e) {
  //     ToastUtil.showShortToast("Error: $e");
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.black), // Set back arrow to black
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              UIHelper.verticalSpace(40.h),
              // Skill List with StreamBuilder
              StreamBuilder<engineerskillmodel>(
                stream: engineerSkillRXobj.dataFetcher,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitCircle(
                        color: Colors.yellow,
                        size: 50.0,
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error: No data available'),
                    );
                  }

                  // skillList.clear();
                  // skillList.addAll(snapshot.data!.data!);
                  if (snapshot.hasData) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                            child: Center(
                              child: Text(
                                skill.name ?? '',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(0xFF798090),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
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

              UIHelper.verticalSpace(22.h),

              // Pick Any Options Indicator
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
                    'Pick Any 3 Options',
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

              UIHelper.verticalSpace(140.h),

              // Next Button
              Consumer<SelectedAnswersModel>(
                builder: (BuildContext context, provider, Widget? child) {
                  return CustomButtonTow(
                    onTap: () {
                      formSubmit(provider);
                      // matchEngineer();
                      NavigationService.navigateTo(
                          // Routes.matchedEngineerScreen
                          Routes.waitingScreen);
                    },
                    title: Text(
                      'Next',
                      style: TextFontStyle.text15cFFFFFF500,
                    ),
                    color: AppColors.allPrimaryColor,
                    padding: EdgeInsets.symmetric(vertical: 18.h),
                    radius: BorderRadius.circular(111.r),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
