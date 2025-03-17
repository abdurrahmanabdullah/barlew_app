import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/customer/work_history/model/work_history_response_model.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../helpers/all_routes.dart';

class WorkHistoryScreen extends StatefulWidget {
  const WorkHistoryScreen({super.key});

  @override
  State<WorkHistoryScreen> createState() => _WorkHistoryScreenState();
}

class _WorkHistoryScreenState extends State<WorkHistoryScreen> {
  int pageId = 1;
  int lastPageNumber = 1;
  @override
  void initState() {
    super.initState();
    apiCall();
  }

  void previouspage() {
    if (pageId > 1) {
      setState(() {
        pageId--;
      });
      apiCall();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No previous page available")),
      );
    }
  }

  void nextpage() {
    if (pageId < lastPageNumber) {
      setState(() {
        pageId++;
      });
      apiCall();
    } else {
      // Show message if no next page available
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No next page available")),
      );
    }
  }

  apiCall() async {
    String endPart = "?page=$pageId";
    final response =
        await customerWorkHistoryRXobj.customerWorkHistoryRX(endPart: endPart);
    lastPageNumber = response?.pagination?.lastPage is int
        ? response?.pagination?.lastPage as int
        : 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(
          'History',
          style: TextFontStyle.text20cprimarycolorw500,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: AppColors.cFFFFFF,
      body: StreamBuilder<WorkHistoryResponseModel>(
        stream: customerWorkHistoryRXobj.dataFetcher,
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
            final historySnap = snapshot.data!;
            if (historySnap.data == null || historySnap.data!.isEmpty) {
              return const Center(
                child: Text(
                  'No history available',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              );
            }
            return Column(
              children: [
                Expanded(
                  // Wrap the ListView in an Expanded widget
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: historySnap.data!.length,
                    padding: const EdgeInsets.symmetric(
                        vertical: 22, horizontal: 12),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      final historySnapByIndex = historySnap.data![index];
                      final historySnapdatetime = historySnapByIndex.createdAt;
                      String formattedDate =
                          formatDateTime(historySnapdatetime!);
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        decoration: BoxDecoration(
                          color: AppColors.cFFFFFF,
                          borderRadius: BorderRadius.circular(11.r),
                          border: Border.all(
                              color: AppColors.broderColor, width: 1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    historySnapByIndex.serviceTitle ?? "N/A",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextFontStyle.text16c192A48inter700,
                                  ),
                                  ////--------------------------id
                                  // Text(
                                  //   task.id?.toString() ?? 'NA',
                                  //   maxLines: 2,
                                  //   overflow: TextOverflow.ellipsis,
                                  //   style: TextFontStyle.text16c192A48inter700,
                                  // ),
                                ],
                              ),
                              UIHelper.verticalSpace(16.h),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      Assets.icons.clender.path,
                                      height: 22.h,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      formattedDate,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextFontStyle.text14c192A48400,
                                    ),
                                  ),
                                  CustomButton(
                                    color: const Color(0xFF104190),
                                    // onTap: () {
                                    //   NavigationService.navigateTo(
                                    //       Routes.historyDetailsScreen);
                                    // },
                                    onTap: () {
                                      NavigationService.navigateToWithArgs(
                                        Routes.historyDetailsScreen,
                                        {'id': index},
                                      );
                                    },
                                    title: 'DETAILS',
                                    style: TextFontStyle.text15cFFFFFF500,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 11.w),
                                    radius: BorderRadius.circular(11.r),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return UIHelper.verticalSpace(17.h);
                    },
                  ),
                ),
                if (historySnap.data!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Previous Page Button
                        GestureDetector(
                          onTap: () {
                            previouspage();
                          },
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back_ios,
                                  size: 24,
                                  color:
                                      pageId > 1 ? Colors.blue : Colors.grey),
                              const SizedBox(width: 4),
                              Text(
                                'Previous',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: pageId > 1 ? Colors.blue : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Page Numbers Logic
                        if (lastPageNumber > 1)
                          _pageButton(1), // Always show first page
                        if (pageId == 2) _pageButton(2),
                        if (pageId > 2 && pageId < lastPageNumber)
                          _pageButton(pageId), // Show current page dynamically

                        // Show ellipsis before last page if needed
                        if (lastPageNumber > 3 && pageId < lastPageNumber - 1)
                          const Text('...',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue)),

                        // Always show last page
                        if (lastPageNumber > 1)
                          _pageButton(lastPageNumber), // Always show last page

                        const SizedBox(width: 16),

                        // Next Page Button
                        GestureDetector(
                          onTap: () {
                            nextpage();
                          },
                          child: Row(
                            children: [
                              Text(
                                'Next',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: pageId < lastPageNumber
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Icon(Icons.arrow_forward_ios,
                                  size: 24,
                                  color: pageId < lastPageNumber
                                      ? Colors.blue
                                      : Colors.grey),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                UIHelper.verticalSpace(30.h),
              ],
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

  Widget _pageButton(int i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pageId = i;
        });
        apiCall();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        decoration: BoxDecoration(
          color: pageId == i ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: pageId == i ? Colors.blue : Colors.grey,
            width: 1.5,
          ),
        ),
        child: Text(
          '$i',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: pageId == i ? Colors.white : Colors.blue,
          ),
        ),
      ),
    );
  }
}

String formatDateTime(DateTime dateTime) {
  // Format time (5:00 PM - 11:00 PM)
  String timeRange = DateFormat('h:mm a').format(dateTime);

  // Format the date (Jan 1)
  String date = DateFormat('MMM d').format(dateTime);

  return '$timeRange, $date';
}
