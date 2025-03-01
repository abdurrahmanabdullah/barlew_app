// // import 'package:barlew_app/common_widget/custom_button_two.dart';
// // import 'package:barlew_app/constant/text_font_style.dart';
// // import 'package:barlew_app/features/customer/questions_page/data/rx_question/rx.dart';
// // import 'package:barlew_app/features/customer/questions_page/model/question_model.dart';
// // import 'package:barlew_app/gen/colors.gen.dart';
// // import 'package:barlew_app/helpers/all_routes.dart';
// // import 'package:barlew_app/helpers/navigation_service.dart';
// // import 'package:barlew_app/helpers/ui_helpers.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_spinkit/flutter_spinkit.dart';

// // class QuestionsPageScreen extends StatefulWidget {
// //   final int id;
// //   const QuestionsPageScreen({
// //     super.key,
// //     required this.id,
// //   });

// //   @override
// //   State<QuestionsPageScreen> createState() => _QuestionsPageScreenState();
// // }

// // ///-----------------single question
// // class _QuestionsPageScreenState extends State<QuestionsPageScreen> {
// //   final questionRX = QuestionRX(); // Use the updated QuestionRX
// //   double _valeu = 0;
// //   int _selectedButtonIndex = -1;

// //   @override
// //   void initState() {
// //     super.initState();
// //     apiCall();
// //   }

// //   apiCall() async {
// //     await questionRX.questionRX(widget.id);
// //   }

// //   @override
// //   void dispose() {
// //     super.dispose();
// //     questionRX.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: const Color(0xFFF5F5F5),
// //         centerTitle: true,
// //         elevation: 0,
// //         title: Text(
// //           'Boiler Pressure',
// //           style: TextFontStyle.text20cprimarycolorw500,
// //         ),
// //       ),
// //       backgroundColor: const Color(0xFFF5F5F5),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: EdgeInsets.symmetric(horizontal: 20.w),
// //           child: StreamBuilder<QuestionModel?>(
// //             stream: questionRX.customerProfileStream,
// //             builder: (context, snapshot) {
// //               if (snapshot.connectionState == ConnectionState.waiting) {
// //                 return const Center(
// //                   child: SpinKitCircle(color: Colors.blue),
// //                 );
// //               } else if (snapshot.hasError) {
// //                 return const Center(child: Text("Error fetching data"));
// //               } else if (!snapshot.hasData || snapshot.data == null) {
// //                 return const Center(child: Text("No data available"));
// //               }

// //               final questionSnap = snapshot.data!.data![0];

// //               // final questionData = snapshot.data!;
// //               // final firstQuestion = questionData.data!.isNotEmpty
// //               //     ? questionData.data![0] // Get the first question
// //               //     : null;

// //               // if (firstQuestion == null) {
// //               //   return const Center(child: Text("No questions available"));
// //               // }

// //               return Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   UIHelper.verticalSpace(24.h),
// //                   Padding(
// //                     padding: EdgeInsets.only(bottom: 24.h),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text(
// //                           'Question ${widget.id}',
// //                           style: TextFontStyle.text14callprimaryColor2w400,
// //                         ),
// //                         UIHelper.verticalSpace(9.h),
// //                         Text(
// //                           questionSnap.questionText ?? "N/A",
// //                           style: TextFontStyle.text20cprimarycolorw500.copyWith(
// //                             fontSize: 24.sp,
// //                           ),
// //                         ),
// //                         UIHelper.verticalSpace(22.h),
// //                         // Loop through all answers for the first question
// //                         ...questionSnap.answers!.map((answer) {
// //                           int index = questionSnap.answers!.indexOf(answer);
// //                           return Padding(
// //                             padding: EdgeInsets.only(bottom: 11.h),
// //                             child: CustomButtonTow(
// //                               color: _selectedButtonIndex == index
// //                                   ? AppColors.allPrimaryColor
// //                                   : AppColors.cFFFFFF,
// //                               padding: const EdgeInsets.symmetric(vertical: 3),
// //                               onTap: () {
// //                                 setState(() {
// //                                   _selectedButtonIndex = index;
// //                                   _valeu = answer.id!.toDouble();
// //                                 });
// //                               },
// //                               title: Row(
// //                                 children: [
// //                                   Radio<double>(
// //                                     activeColor: Colors.white,
// //                                     value: answer.id!.toDouble(),
// //                                     groupValue: _valeu,
// //                                     onChanged: (value) {
// //                                       setState(() {
// //                                         _valeu = value!;
// //                                       });
// //                                     },
// //                                   ),
// //                                   Text(
// //                                     answer.answerText ?? '',
// //                                     style: TextStyle(
// //                                       color: _selectedButtonIndex == index
// //                                           ? Colors.white
// //                                           : Colors.black,
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           );
// //                         }).toList(),
// //                       ],
// //                     ),
// //                   ),
// //                   UIHelper.verticalSpace(245.h),
// //                   CustomButtonTow(
// //                     onTap: () {
// //                       NavigationService.navigateTo(
// //                           Routes.questionsPageTwoScreen

// //                           );
// //                     },
// //                     title: Text(
// //                       'Next',
// //                       style: TextFontStyle.text15cFFFFFF500,
// //                     ),
// //                     color: AppColors.allPrimaryColor,
// //                     padding: EdgeInsets.symmetric(vertical: 18.h),
// //                     radius: BorderRadius.circular(111.r),
// //                   ),
// //                 ],
// //               );
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //////-- api data
// // import 'package:barlew_app/common_widget/custom_button_two.dart';
// // import 'package:barlew_app/constant/text_font_style.dart';
// // import 'package:barlew_app/features/customer/questions_page/data/rx_question/rx.dart';
// // import 'package:barlew_app/features/customer/questions_page/model/question_model.dart';
// // import 'package:barlew_app/gen/colors.gen.dart';
// // import 'package:barlew_app/helpers/all_routes.dart';
// // import 'package:barlew_app/helpers/navigation_service.dart';
// // import 'package:barlew_app/helpers/ui_helpers.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_spinkit/flutter_spinkit.dart';

// // class QuestionsPageScreen extends StatefulWidget {
// //   final int id;
// //   const QuestionsPageScreen({
// //     super.key,
// //     required this.id,
// //   });

// //   @override
// //   State<QuestionsPageScreen> createState() => _QuestionsPageScreenState();
// // }

// // ///-----------------single question
// // class _QuestionsPageScreenState extends State<QuestionsPageScreen> {
// //   final questionRX = QuestionRX(); // Use the updated QuestionRX
// //   double _valeu = 0;
// //   int _selectedButtonIndex = -1;

// //   @override
// //   void initState() {
// //     super.initState();
// //     apiCall();
// //   }

// //   apiCall() async {
// //     await questionRX.questionRX(widget.id);
// //   }

// //   @override
// //   void dispose() {
// //     super.dispose();
// //     questionRX.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: const Color(0xFFF5F5F5),
// //         centerTitle: true,
// //         elevation: 0,
// //         title: Text(
// //           'Boiler Pressure',
// //           style: TextFontStyle.text20cprimarycolorw500,
// //         ),
// //       ),
// //       backgroundColor: const Color(0xFFF5F5F5),
// //       body: Padding(
// //         padding: EdgeInsets.symmetric(horizontal: 20.w),
// //         child: StreamBuilder<QuestionModel?>(
// //           stream: questionRX.customerProfileStream,
// //           builder: (context, snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return const Center(
// //                 child: SpinKitCircle(color: Colors.blue),
// //               );
// //             } else if (snapshot.hasError) {
// //               return const Center(child: Text("Error fetching data"));
// //             } else if (!snapshot.hasData ||
// //                 snapshot.data!.data == null ||
// //                 snapshot.data!.data!.isEmpty) {
// //               return const Center(child: Text("No data available"));
// //             }

// //             final questionSnap =
// //                 snapshot.data!.data!.first; // Safely getting the first question

// //             return Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 UIHelper.verticalSpace(24.h),
// //                 Padding(
// //                   padding: EdgeInsets.only(bottom: 24.h),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         'Question ${widget.id}',
// //                         style: TextFontStyle.text14callprimaryColor2w400,
// //                       ),
// //                       UIHelper.verticalSpace(9.h),
// //                       Text(
// //                         questionSnap.questionText ?? "N/A",
// //                         style: TextFontStyle.text20cprimarycolorw500.copyWith(
// //                           fontSize: 24.sp,
// //                         ),
// //                       ),
// //                       UIHelper.verticalSpace(22.h),

// //                       // Using ListView.builder safely
// //                       SizedBox(
// //                         height: 200.h,
// //                         child: ListView.builder(
// //                           itemCount: questionSnap.answers?.length ?? 0,
// //                           itemBuilder: (context, index) {
// //                             final answer = questionSnap.answers![index];

// //                             return Padding(
// //                               padding: EdgeInsets.only(bottom: 11.h),
// //                               child: CustomButtonTow(
// //                                 color: _selectedButtonIndex == index
// //                                     ? AppColors.allPrimaryColor
// //                                     : AppColors.cFFFFFF,
// //                                 padding:
// //                                     const EdgeInsets.symmetric(vertical: 3),
// //                                 onTap: () {
// //                                   setState(() {
// //                                     _selectedButtonIndex = index;
// //                                     _valeu = answer.id!.toDouble();
// //                                   });
// //                                 },
// //                                 title: Row(
// //                                   children: [
// //                                     Radio<double>(
// //                                       activeColor: Colors.white,
// //                                       value: answer.id!.toDouble(),
// //                                       groupValue: _valeu,
// //                                       onChanged: (value) {
// //                                         setState(() {
// //                                           _valeu = value!;
// //                                         });
// //                                       },
// //                                     ),
// //                                     Text(
// //                                       answer.answerText ?? '',
// //                                       style: TextStyle(
// //                                         color: _selectedButtonIndex == index
// //                                             ? Colors.white
// //                                             : Colors.black,
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ),
// //                             );
// //                           },
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 UIHelper.verticalSpace(245.h),

// //                 // Fixing Next Button Navigation
// //                 CustomButtonTow(
// //                   onTap: () {
// //                     if (snapshot.data!.data!.isNotEmpty) {
// //                       NavigationService.navigateToWithArgs(
// //                         Routes.questionsPageTwoScreen,
// //                         {"id": snapshot.data!.data![0].id},
// //                       );
// //                     } else {
// //                       ScaffoldMessenger.of(context).showSnackBar(
// //                         const SnackBar(content: Text("No question available!")),
// //                       );
// //                     }
// //                   },
// //                   title: Text(
// //                     'Next',
// //                     style: TextFontStyle.text15cFFFFFF500,
// //                   ),
// //                   color: AppColors.allPrimaryColor,
// //                   padding: EdgeInsets.symmetric(vertical: 18.h),
// //                   radius: BorderRadius.circular(111.r),
// //                 ),
// //               ],
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }

// ////////////////////--dynamically question set
// // import 'package:barlew_app/common_widget/custom_button_two.dart';
// // import 'package:barlew_app/constant/text_font_style.dart';
// // import 'package:barlew_app/features/customer/questions_page/data/rx_question/rx.dart';
// // import 'package:barlew_app/features/customer/questions_page/model/question_model.dart';
// // import 'package:barlew_app/gen/colors.gen.dart';
// // import 'package:barlew_app/helpers/all_routes.dart';
// // import 'package:barlew_app/helpers/navigation_service.dart';

// // import 'package:barlew_app/helpers/ui_helpers.dart';
// // import 'package:barlew_app/networks/api_access.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_spinkit/flutter_spinkit.dart';

// // class QuestionsPageScreen extends StatefulWidget {
// //   final int id;
// //   const QuestionsPageScreen({super.key, required this.id});

// //   @override
// //   State<QuestionsPageScreen> createState() => _QuestionsPageScreenState();
// // }

// // class _QuestionsPageScreenState extends State<QuestionsPageScreen> {
// //   final questionRX = QuestionRX();
// //   double _valeu = 0;
// //   int _selectedButtonIndex = -1;
// //   List<Data>? _questions; // Fix: Change to List<Data>
// //   int _currentQuestionIndex = 0; // Track current question index

// //   @override
// //   void initState() {
// //     super.initState();
// //     apiCall();
// //     apiCallservice();
// //   }

// //   apiCall() async {
// //     await questionRX.questionRX(widget.id);
// //   }

// //   apiCallservice() async {
// //     await customerHomeServiceRXobj.customerhomeserviceRX();
// //   }

// //   @override
// //   void dispose() {
// //     super.dispose();
// //     questionRX.dispose();
// //   }

// //   // void _goToNextQuestion() {
// //   //   if (_questions != null && _currentQuestionIndex < _questions!.length - 1) {
// //   //     setState(() {
// //   //       _currentQuestionIndex++;
// //   //       _selectedButtonIndex = -1; // Reset selected button
// //   //       _valeu = 0; // Reset answer selection
// //   //     });
// //   //   } else {
// //   //     ScaffoldMessenger.of(context).showSnackBar(
// //   //       const SnackBar(content: Text("No more questions available!")),
// //   //     );
// //   //   }
// //   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: const Color(0xFFF5F5F5),
// //         centerTitle: true,
// //         elevation: 0,
// //         title: StreamBuilder<Object>(
// //             stream: null,
// //             builder: (context, snapshot) {
// //               return Text(
// //                 'Boiler Pressure',
// //                 style: TextFontStyle.text20cprimarycolorw500,
// //               );
// //             }),
// //       ),
// //       backgroundColor: const Color(0xFFF5F5F5),
// //       body: Padding(
// //           padding: EdgeInsets.symmetric(horizontal: 20.w),
// //           child: StreamBuilder<QuestionModel?>(
// //             stream: questionRX.customerProfileStream,
// //             builder: (context, snapshot) {
// //               if (snapshot.connectionState == ConnectionState.waiting) {
// //                 return const Center(
// //                   child: SpinKitCircle(color: Colors.blue),
// //                 );
// //               } else if (snapshot.hasError) {
// //                 return const Center(child: Text("Error fetching data"));
// //               } else if (!snapshot.hasData ||
// //                   snapshot.data!.data == null ||
// //                   snapshot.data!.data!.isEmpty) {
// //                 return const Center(child: Text("No data available"));
// //               }

// //               // Assign _questions without calling setState()
// //               final List<Data> questions = snapshot.data!.data!;

// //               if (_currentQuestionIndex >= questions.length) {
// //                 return const Center(child: Text("No more questions"));
// //               }

// //               final questionSnap = questions[_currentQuestionIndex];

// //               return Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   UIHelper.verticalSpace(24.h),
// //                   Padding(
// //                     padding: EdgeInsets.only(bottom: 24.h),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text(
// //                           'Question ${_currentQuestionIndex + 1}',
// //                           style: TextFontStyle.text14callprimaryColor2w400,
// //                         ),
// //                         UIHelper.verticalSpace(9.h),
// //                         Text(
// //                           questionSnap.questionText ?? "N/A",
// //                           style: TextFontStyle.text20cprimarycolorw500.copyWith(
// //                             fontSize: 24.sp,
// //                           ),
// //                         ),
// //                         UIHelper.verticalSpace(22.h),

// //                         // Using ListView.builder safely
// //                         SizedBox(
// //                           height: 240.h,
// //                           child: ListView.builder(
// //                             itemCount: questionSnap.answers?.length ?? 0,
// //                             itemBuilder: (context, index) {
// //                               final answer = questionSnap.answers![index];

// //                               return Padding(
// //                                 padding: EdgeInsets.only(bottom: 11.h),
// //                                 child: CustomButtonTow(
// //                                   color: _selectedButtonIndex == index
// //                                       ? AppColors.allPrimaryColor
// //                                       : AppColors.cFFFFFF,
// //                                   padding:
// //                                       const EdgeInsets.symmetric(vertical: 3),
// //                                   onTap: () {
// //                                     setState(() {
// //                                       _selectedButtonIndex = index;
// //                                       _valeu = answer.id!.toDouble();
// //                                     });
// //                                   },
// //                                   title: Row(
// //                                     children: [
// //                                       Radio<double>(
// //                                         activeColor: Colors.white,
// //                                         value: answer.id!.toDouble(),
// //                                         groupValue: _valeu,
// //                                         onChanged: (value) {
// //                                           setState(() {
// //                                             _valeu = value!;
// //                                           });
// //                                         },
// //                                       ),
// //                                       Text(
// //                                         answer.answerText ?? '',
// //                                         style: TextStyle(
// //                                           color: _selectedButtonIndex == index
// //                                               ? Colors.white
// //                                               : Colors.black,
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                               );
// //                             },
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   UIHelper.verticalSpace(222.h),

// //                   // Next Button
// //                   CustomButtonTow(
// //                     onTap: () {
// //                       if (_currentQuestionIndex < questions.length - 1) {
// //                         setState(() {
// //                           _currentQuestionIndex++;
// //                           _selectedButtonIndex = -1; // Reset selected button
// //                           _valeu = 0; // Reset answer selection
// //                         });
// //                       } else {
// //                         NavigationService.navigateTo(Routes.problemsScreen);
// //                         // ScaffoldMessenger.of(context).showSnackBar(
// //                         //   const SnackBar(
// //                         //       content: Text("No more questions available!")),
// //                         // );
// //                       }
// //                     },
// //                     title: Text(
// //                       'Next',
// //                       style: TextFontStyle.text15cFFFFFF500,
// //                     ),
// //                     color: AppColors.allPrimaryColor,
// //                     padding: EdgeInsets.symmetric(vertical: 18.h),
// //                     radius: BorderRadius.circular(111.r),
// //                   ),
// //                 ],
// //               );
// //             },
// //           )),
// //     );
// //   }
// // }

// ///------------------
// import 'package:barlew_app/common_widget/custom_button_two.dart';
// import 'package:barlew_app/constant/text_font_style.dart';
// import 'package:barlew_app/features/customer/questions_page/data/rx_question/rx.dart';
// import 'package:barlew_app/features/customer/questions_page/model/question_model.dart';
// import 'package:barlew_app/gen/colors.gen.dart';
// import 'package:barlew_app/helpers/all_routes.dart';
// import 'package:barlew_app/helpers/navigation_service.dart';

// import 'package:barlew_app/helpers/ui_helpers.dart';
// import 'package:barlew_app/networks/api_access.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// class QuestionsPageScreen extends StatefulWidget {
//   final int id;
//   const QuestionsPageScreen({super.key, required this.id});

//   @override
//   State<QuestionsPageScreen> createState() => _QuestionsPageScreenState();
// }

// class _QuestionsPageScreenState extends State<QuestionsPageScreen> {
//   final questionRX = QuestionRX();
//   double _valeu = 0;
//   int _selectedButtonIndex = -1;
//   List<Data>? _questions; // Fix: Change to List<Data>
//   int _currentQuestionIndex = 0; // Track current question index
//   // ✅ Map to store selected answers
//   final Map<int, int> _selectedAnswers = {}; // {questionID: answerID}

//   @override
//   void initState() {
//     super.initState();
//     apiCall();
//     apiCallservice();
//   }

//   apiCall() async {
//     await questionRX.questionRX(widget.id);
//   }

//   apiCallservice() async {
//     await customerHomeServiceRXobj.customerhomeserviceRX();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     questionRX.dispose();
//   }

//   // void _goToNextQuestion() {
//   //   if (_questions != null && _currentQuestionIndex < _questions!.length - 1) {
//   //     setState(() {
//   //       _currentQuestionIndex++;
//   //       _selectedButtonIndex = -1; // Reset selected button
//   //       _valeu = 0; // Reset answer selection
//   //     });
//   //   } else {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(content: Text("No more questions available!")),
//   //     );
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFF5F5F5),
//         centerTitle: true,
//         elevation: 0,
//         title: StreamBuilder<Object>(
//             stream: null,
//             builder: (context, snapshot) {
//               return Text(
//                 'Boiler Pressure',
//                 style: TextFontStyle.text20cprimarycolorw500,
//               );
//             }),
//       ),
//       backgroundColor: const Color(0xFFF5F5F5),
//       body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.w),
//           child: StreamBuilder<QuestionModel?>(
//             stream: questionRX.customerProfileStream,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(
//                   child: SpinKitCircle(color: Colors.blue),
//                 );
//               } else if (snapshot.hasError) {
//                 return const Center(child: Text("Error fetching data"));
//               } else if (!snapshot.hasData ||
//                   snapshot.data!.data == null ||
//                   snapshot.data!.data!.isEmpty) {
//                 return const Center(child: Text("No data available"));
//               }

//               // Assign _questions without calling setState()
//               final List<Data> questions = snapshot.data!.data!;

//               if (_currentQuestionIndex >= questions.length) {
//                 return const Center(child: Text("No more questions"));
//               }

//               final questionSnap = questions[_currentQuestionIndex];

//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   UIHelper.verticalSpace(24.h),
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 24.h),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Question ${_currentQuestionIndex + 1}',
//                           style: TextFontStyle.text14callprimaryColor2w400,
//                         ),
//                         UIHelper.verticalSpace(9.h),
//                         Text(
//                           questionSnap.questionText ?? "N/A",
//                           style: TextFontStyle.text20cprimarycolorw500.copyWith(
//                             fontSize: 24.sp,
//                           ),
//                         ),
//                         UIHelper.verticalSpace(22.h),

//                         // Using ListView.builder safely
//                         SizedBox(
//                           height: 240.h,
//                           child: ListView.builder(
//                             itemCount: questionSnap.answers?.length ?? 0,
//                             itemBuilder: (context, index) {
//                               final answer = questionSnap.answers![index];

//                               return Padding(
//                                 padding: EdgeInsets.only(bottom: 11.h),
//                                 child: CustomButtonTow(
//                                   color: _selectedButtonIndex == index
//                                       ? AppColors.allPrimaryColor
//                                       : AppColors.cFFFFFF,
//                                   padding:
//                                       const EdgeInsets.symmetric(vertical: 3),
//                                   onTap: () {
//                                     setState(() {
//                                       _selectedButtonIndex = index;
//                                       _valeu = answer.id!.toDouble();
//                                       _selectedAnswers[questionSnap.id!] =
//                                           answer.id!; // ✅
//                                     });
//                                   },
//                                   title: Row(
//                                     children: [
//                                       Radio<double>(
//                                         activeColor: Colors.white,
//                                         value: answer.id!.toDouble(),
//                                         groupValue: _valeu,
//                                         onChanged: (value) {
//                                           setState(() {
//                                             _valeu = value!;
//                                           });
//                                         },
//                                       ),
//                                       Text(
//                                         answer.answerText ?? '',
//                                         style: TextStyle(
//                                           color: _selectedButtonIndex == index
//                                               ? Colors.white
//                                               : Colors.black,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   UIHelper.verticalSpace(222.h),

//                   // Next Button
//                   CustomButtonTow(
//                     onTap: () {
//                       final questionID = questions[_currentQuestionIndex].id;
//                       if (!_selectedAnswers.containsKey(questionID)) {
//                         // ✅ Show a Snackbar if no answer is selected
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                               content: Text(
//                                   "Please select an answer before proceeding.")),
//                         );
//                         return;
//                       }

//                       if (_currentQuestionIndex < questions.length - 1) {
//                         setState(() {
//                           _currentQuestionIndex++;
//                           _selectedButtonIndex = -1; // Reset selected button
//                           _valeu = 0; // Reset answer selection
//                         });
//                       } else {
//                         print("Selected Answers: $_selectedAnswers");
//                         NavigationService.navigateTo(Routes.problemsScreen);
//                         // ScaffoldMessenger.of(context).showSnackBar(
//                         //   const SnackBar(
//                         //       content: Text("No more questions available!")),
//                         // );
//                       }
//                     },
//                     title: Text(
//                       'Next',
//                       style: TextFontStyle.text15cFFFFFF500,
//                     ),
//                     color: AppColors.allPrimaryColor,
//                     padding: EdgeInsets.symmetric(vertical: 18.h),
//                     radius: BorderRadius.circular(111.r),
//                   ),
//                 ],
//               );
//             },
//           )),
//     );
//   }
// }
