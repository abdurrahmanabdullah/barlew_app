import 'package:barlew_app/common_widget/custom_form_field.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/customer/chat/widget/custom_header.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ChatMessageScreen extends StatefulWidget {
  const ChatMessageScreen({super.key});

  @override
  ChatMessageScreenState createState() => ChatMessageScreenState();
}

class ChatMessageScreenState extends State<ChatMessageScreen> {
  final List<String> _messages = [
    "Hello, Mr. Johnson.I’m developing a sustainable agriculture platform connecting farmers directly with consumers.",
    "interesting. What sets your project apart?",
    "Our user-friendly interface and personalized recommendations disrupt traditional supply chains, promoting sustainability.",
    "I’m intrigued. can you share more about your revenue model and growth strategy?",
  ]; // Stores the chat messages
  final TextEditingController _controller =
      TextEditingController(); // Controller for the input field

  // Function to handle sending a message
  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UIHelper.verticalSpace(50.h),
          CustomHeader(
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzlgkW4Pw3K12ArgCSBkFdQ3UiDFZFpZ_7Ew&s",
            name: "Noor-Alom",
            lastSeen: "Last seen 24m ago",
            videoCallTap: () {},
            audioCallTap: () {},
          ),
          UIHelper.verticalSpace(20.h),
          Divider(
            thickness: 1.h,
            color: AppColors.cC8C9CD,
          ),
          UIHelper.verticalSpace(20.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const PageScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(bottom: 15.h),
                      child: index % 2 == 0
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 55.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                            DateFormat.jm()
                                                .format(DateTime.now()),
                                            style: TextFontStyle
                                                .text12c434D5Eroboto2w400),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.cEAF3FC,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12.r),
                                              topLeft: Radius.circular(12.r),
                                              bottomLeft: Radius.circular(12.r),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15.w,
                                                vertical: 10.h),
                                            child: Text(_messages[index],
                                                style: TextFontStyle
                                                    .text14c3B4252robotow400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                UIHelper.horizontalSpace(10.w),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(150.r),
                                  child: Image.network(
                                    "https://static.vecteezy.com/system/resources/previews/048/002/403/non_2x/confident-young-filipino-businessman-in-suit-ideal-for-professional-corporate-and-business-concepts-photo.jpg",
                                    width: 40.w,
                                    height: 40.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(150.r),
                                  child: Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzlgkW4Pw3K12ArgCSBkFdQ3UiDFZFpZ_7Ew&s",
                                    width: 40.w,
                                    height: 40.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                UIHelper.horizontalSpace(10.w),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 55.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            DateFormat.jm()
                                                .format(DateTime.now()),
                                            style: TextFontStyle
                                                .text12c434D5Eroboto2w400),
                                        UIHelper.verticalSpace(5.h),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.c104190,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12.r),
                                              topLeft: Radius.circular(12.r),
                                              bottomRight:
                                                  Radius.circular(12.r),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15.w,
                                                vertical: 10.h),
                                            child: Text(_messages[index],
                                                style: TextFontStyle
                                                    .text14cFFFFFF400
                                                    .copyWith(fontSize: 14.sp)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ));
                },
              ),
            ),
          ),
          UIHelper.verticalSpace(15.h),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.cFFFFFF,
              boxShadow: [
                BoxShadow(
                  color: Color(0x1E000000),
                  blurRadius: 16,
                  offset: Offset(0, 6),
                  spreadRadius: 0,
                )
              ],
            ),
            // child: Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            //   child: Row(
            //     children: [
            //       Expanded(
            //           child: CommonTextFormField(
            //         controller: _controller,
            //         textInputStyle:
            //             const TextStyle(overflow: TextOverflow.ellipsis),
            //         height: 45,
            //         borderRadius: 30.r,
            //         isPrefixIcon: false,
            //         suffixIcon: Padding(
            //           padding: EdgeInsets.all(10.sp),
            //           child: Image.asset(
            //             Assets.icons.attachment.path,
            //           ),
            //         ),
            //         onSuffixIconTap: () {},
            //         fillColor: AppColors.cFFFFFF,
            //         hintText: "Type a message",
            //         hintStyle: TextFontStyle.text14cc4C5363robotosw400,
            //       )),
            //       UIHelper.horizontalSpace(40.w),
            //       GestureDetector(
            //           onTap: () {
            //             setState(() {
            //               _sendMessage();
            //             });
            //           },
            //           child: Image.asset(
            //             Assets.icons.sentButton.path,
            //             width: 40.w,
            //           ))
            //     ],
            //   ),
            // ),
          )
        ],
      ),
    );
  }
}
