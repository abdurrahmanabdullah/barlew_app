import 'package:barlew_app/common_widget/custom_button_two.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/customer/questions_page/data/rx_question/rx.dart';
import 'package:barlew_app/features/customer/questions_page/model/question_model.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/provider/selected_answer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class QuestionsPageScreen extends StatefulWidget {
  final int id;
  const QuestionsPageScreen({super.key, required this.id});

  @override
  State<QuestionsPageScreen> createState() => _QuestionsPageScreenState();
}

class _QuestionsPageScreenState extends State<QuestionsPageScreen> {
  final questionRX = QuestionRX();
  double _valeu = 0;
  int _selectedButtonIndex = -1;
  List<Question>? _questions; // This should hold a list of Question objects
  int _currentQuestionIndex = 0; // Track current question index
  final Map<int, int> _selectedAnswers = {}; // {questionID: answerID}

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() async {
    await questionRX.questionRX(widget.id);
  }

  @override
  void dispose() {
    super.dispose();
    questionRX.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuestionModel?>(
        stream: questionRX.customerProfileStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: SpinKitCircle(color: Colors.blue));
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error fetching data"));
          }

          if (snapshot.hasData) {
            // Correctly access the list of questions and service name
            _questions = snapshot.data!.data!.questions;
            final serviceName = snapshot.data!.data!.service ?? "No Service";
            final serviceID = snapshot.data?.data?.serviceId ?? 0;

            if (_currentQuestionIndex >= _questions!.length) {
              return const Center(child: Text("No more questions"));
            }

            final questionSnap = _questions![_currentQuestionIndex];

            return Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xFFF5F5F5),
                centerTitle: true,
                elevation: 0,
                title: Text(
                  serviceName,
                  style: TextFontStyle.text20cprimarycolorw500,
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              backgroundColor: const Color(0xFFF5F5F5),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.verticalSpace(24.h),
                    Padding(
                      padding: EdgeInsets.only(bottom: 24.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Question ${_currentQuestionIndex + 1}',
                            style: TextFontStyle.text14callprimaryColor2w400,
                          ),

                          UIHelper.verticalSpace(9.h),
                          Text(
                            questionSnap.questionText ?? "N/A",
                            style:
                                TextFontStyle.text20cprimarycolorw500.copyWith(
                              fontSize: 24.sp,
                            ),
                          ),
                          UIHelper.verticalSpace(22.h),

                          // Using ListView.builder safely
                          SizedBox(
                            height: 240.h,
                            child: ListView.builder(
                              itemCount: questionSnap.answers?.length ?? 0,
                              itemBuilder: (context, index) {
                                final answer = questionSnap.answers![index];

                                return Padding(
                                  padding: EdgeInsets.only(bottom: 11.h),
                                  child: CustomButtonTow(
                                    color: _selectedButtonIndex == index
                                        ? AppColors.allPrimaryColor
                                        : AppColors.cFFFFFF,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    onTap: () {
                                      setState(() {
                                        _selectedButtonIndex = index;
                                        _valeu = answer.id!.toDouble();
                                        _selectedAnswers[questionSnap.id!] =
                                            answer.id!;
                                      });

                                      ///selected id

                                      Provider.of<SelectedAnswersModel>(context,
                                              listen: false)
                                          .setServiceID(serviceID);

                                      // Add selected answer to provider
                                      Provider.of<SelectedAnswersModel>(context,
                                              listen: false)
                                          .addSelectedAnswer(
                                              questionSnap.id!, answer.id!);
                                    },
                                    title: Row(
                                      children: [
                                        Radio<double>(
                                          activeColor: Colors.white,
                                          value: answer.id!.toDouble(),
                                          groupValue: _valeu,
                                          onChanged: (value) {
                                            setState(() {
                                              _valeu = value!;
                                            });
                                          },
                                        ),
                                        Text(
                                          answer.answerText ?? '',
                                          style: TextStyle(
                                            color: _selectedButtonIndex == index
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    UIHelper.verticalSpace(222.h),

                    // Next Button
                    CustomButtonTow(
                      onTap: () {
                        final questionID = questionSnap.id;

                        if (!_selectedAnswers.containsKey(questionID)) {
                          // Show a Snackbar if no answer is selected
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Please select an answer before proceeding.")),
                          );
                          return;
                        }

                        if (_currentQuestionIndex < _questions!.length - 1) {
                          setState(() {
                            _currentQuestionIndex++;
                            _selectedButtonIndex = -1; // Reset selected button
                            _valeu = 0; // Reset answer selection
                          });
                        } else {
                          // If this is the last question, print all selected answers
                          print("Selected Answers: $_selectedAnswers");
                          print(
                              "Selected Answers: ${Provider.of<SelectedAnswersModel>(context, listen: false).selectedAnswers}");
                          NavigationService.navigateTo(Routes.problemsScreen);
                        }
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
    );
  }
}
