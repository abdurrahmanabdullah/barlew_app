import 'package:barlew_app/constant/text_font_style.dart';

import 'package:barlew_app/features/engineer/home/model/engineer_task_list_model.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../gen/assets.gen.dart';

class EngineerNotificationScreen extends StatefulWidget {
  const EngineerNotificationScreen({super.key});

  @override
  State<EngineerNotificationScreen> createState() =>
      _EngineerNotificationScreenState();
}

class _EngineerNotificationScreenState
    extends State<EngineerNotificationScreen> {
  @override
  void initState() {
    super.initState();
    tasklistapiCall();
  }

  tasklistapiCall() async {
    String engineerId = "1";
    String endPart = "?engineer_id=$engineerId";
    await engineerTaskListRXobj.engineerTaskListRX(endPart: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Notifications',
          style: TextFontStyle.text22c192A48w600roboto,
        ),
      ),
      backgroundColor: AppColors.cFFFFFF,
      body: StreamBuilder<EngineerTaskResponseModel>(
        stream: engineerTaskListRXobj.dataFetcher,
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
            return Center(
              child: Text("snapshot hass error ${snapshot.error.toString()}"),
            );
          }

          if (snapshot.hasData) {
            final tasks = snapshot.data?.data ?? [];
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: tasks.length,
              itemBuilder: (_, index) {
                final task = tasks[index].discussionRequest;
                final notificationTime =
                    tasks[index].createdAt; // `createdAt` is likely DateTime?

                // Ensure the notificationTime is valid
                final formattedTime = notificationTime != null
                    ? timeago.format(
                        notificationTime) // Format the DateTime with timeago
                    : 'Unknown time';
                final servicedescription =
                    task?.description ?? 'No Title Available';
                final userAvatar =
                    task?.user?.avatar ?? Assets.icons.personPlaceholder.path;
                final user = task?.user;
                final userName =
                    "${user?.firstName ?? 'Unknown'} ${user?.lastName ?? ''}"
                        .trim();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundImage: userAvatar.isNotEmpty
                                    ? NetworkImage(userAvatar)
                                    : AssetImage(
                                            Assets.images.profileAvatar.path)
                                        as ImageProvider,
                                radius: 25,
                              ),
                              const Positioned(
                                right: 0,
                                top: 0,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: AppColors.c35BA0C,
                                ),
                              ),
                            ],
                          ),
                          UIHelper.horizontalSpace(11),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userName,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextFontStyle.text145192A48w500roboto,
                                ),
                                UIHelper.verticalSpace(5),
                                Text(
                                  servicedescription,
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextFontStyle.text11c9499A6w400roboto,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    UIHelper.horizontalSpace(18),
                    Expanded(
                      flex: 1,
                      child: Text(
                        formattedTime,
                        overflow: TextOverflow.ellipsis,
                        style: TextFontStyle.text12cAFB3BCw400roboto,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return UIHelper.verticalSpace(15);
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
    );
  }
}
