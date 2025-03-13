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
  final List<Datum> skillList = [];
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
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back,
        //       color: Colors.black), // Set back arrow to black
        //   onPressed: () => Navigator.pop(context),
        // ),
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

              StreamBuilder<Engineerskillmodel>(
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
