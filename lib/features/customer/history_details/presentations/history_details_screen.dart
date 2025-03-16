import 'dart:async';

import 'package:barlew_app/features/customer/history_details/model/history_details_response_model.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../../constant/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';

import '../../../../helpers/ui_helpers.dart';

class HistoryDetailsScreen extends StatefulWidget {
  final int id;
  const HistoryDetailsScreen({super.key, required this.id});

  @override
  State<HistoryDetailsScreen> createState() => _HistoryDetailsScreenState();
}

class _HistoryDetailsScreenState extends State<HistoryDetailsScreen> {
  final descriptionController = TextEditingController();
  bool isloading = false;
  @override
  void initState() {
    historyDetsils();
    timeset();

    super.initState();
  }

  void timeset() {
    setState(() {
      isloading = true;
    });
    Timer(
      const Duration(milliseconds: 1300),
      () {
        setState(() {
          isloading = false;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  historyDetsils() async {
    await historyDetailsRXobj.historyDetailsRX(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'History Details',
          style: TextFontStyle.text24c192A48500,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: isloading
          ? const SpinKitCircle(
              color: AppColors.allPrimaryColor,
              size: 50.0,
            )
          : StreamBuilder<HistoryDetailsResponseModel>(
              stream: historyDetailsRXobj.dataFetcher,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SpinKitCircle(
                    color: AppColors.allPrimaryColor,
                    size: 50.0,
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Snapshot has error"),
                  );
                }

                if (snapshot.hasData) {
                  final historyData = snapshot.data!.data!;
                  final user = historyData.user;
                  final questions = historyData.questionAnswer ?? [];
                  final images = historyData.images ?? [];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.0.w),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  NavigationService.navigateTo(
                                      Routes.chatMessageScreen);
                                },
                                child: const Icon(
                                  Icons.chat,
                                ),
                              )),

                          UIHelper.verticalSpace(33.h),

                          Container(
                            padding: EdgeInsets.symmetric(vertical: 11.r),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0F8FF),
                              borderRadius: BorderRadius.circular(11.r),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 11.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 100.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22.r),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(22.r),
                                      child: CachedNetworkImage(
                                        imageUrl: user?.avatar ?? '',
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          Assets.images.profileAvatar.path,
                                          fit: BoxFit.cover,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  UIHelper.horizontalSpace(9.w),

                                  // Details Section
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        UIHelper.verticalSpace(11.h),
                                        Text(
                                          historyData.serviceTitle ??
                                              'No Title',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.justify,
                                          style: TextFontStyle
                                              .text15c192A48500roboto,
                                        ),
                                        UIHelper.verticalSpace(5.h),
                                        Text(
                                          user?.name ?? 'No Name',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.justify,
                                          style:
                                              TextFontStyle.text15c9198A6roboto,
                                        ),
                                        UIHelper.verticalSpace(5.h),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          UIHelper.verticalSpace(45.h),
                          Text(
                            'Service Date',
                            style: TextFontStyle.text15c192A48400,
                          ),
                          UIHelper.verticalSpace(15.h),
                          Text(
                            historyData.createdAt != null
                                ? DateFormat('dd.MM.yyyy')
                                    .format(historyData.createdAt!)
                                : 'No Date',
                            style: TextFontStyle.text15c192A48400roboto,
                          ),
                          UIHelper.verticalSpace(13.h),
                          Text(
                            'Category',
                            style: TextFontStyle.text15c192A48400,
                          ),
                          UIHelper.verticalSpace(13.h),
                          Text(
                            'Boiler Pressure',
                            style: TextFontStyle.text15c192A48400roboto,
                          ),
                          UIHelper.verticalSpace(13.h),

                          Text(
                            'Question',
                            style: TextFontStyle.text15c192A48400,
                          ),
                          UIHelper.verticalSpace(13.h),

                          ///
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: questions.map((qa) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Question: ${qa.question ?? 'No Question'}',
                                        style: TextFontStyle
                                            .text15c192A48400roboto),
                                    UIHelper.verticalSpace(5.h),
                                    Text('Ans: ${qa.answer ?? 'No Answer'}',
                                        style: TextFontStyle
                                            .text15c192A48400roboto),
                                    UIHelper.verticalSpace(5.h),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),

                          UIHelper.verticalSpace(25.h),

                          Text(
                            'Description',
                            style: TextFontStyle.text15c192A48400,
                          ),
                          UIHelper.verticalSpace(13.h),

                          TextFormField(
                            maxLines: 5,
                            maxLength: 15,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText:
                                  historyData.description ?? 'No Description',
                              hintStyle: TextFontStyle.text15cc45536Bw400,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                    color: AppColors.broderColor, width: 1.w),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                    color: AppColors.broderColor, width: 1.w),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                    color: AppColors.broderColor, width: 1.w),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.w),
                              ),
                            ),
                          ),

                          GridView.builder(
                            itemCount: images.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1.3,
                              crossAxisSpacing: 5,
                            ),
                            itemBuilder: (_, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                child: Container(
                                  width: 121.w,
                                  height: 71.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14.r),
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          images[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                          UIHelper.verticalSpace(11.h),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("Snapshot has error"),
                  );
                }
              }),
    );
  }
}
