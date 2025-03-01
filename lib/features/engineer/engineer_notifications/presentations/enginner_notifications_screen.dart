import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/engineer/engineer_notifications/model/notification_model.dart';

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
    apiCall();
  }

  apiCall() async {
    await notificationRXobj.notificationRX();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: StreamBuilder<NotificationModel>(
        stream: notificationRXobj.dataFetcher,
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
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (_, index) {
                final notification = snapshot.data!.data![index];

                // Determine the sender (user or engineer)
                final sender = notification.userData ?? notification.engineer;
                final senderName = sender is UserData
                    ? sender.userName ?? "Unknown"
                    : sender is Engineer
                        ? sender.name ?? "Unknown"
                        : "Unknown";

                final avatarUrl = sender is UserData
                    ? sender.avatar
                    : null; // Avatar only for UserData

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
                                backgroundImage:
                                    avatarUrl != null && avatarUrl.isNotEmpty
                                        ? NetworkImage(avatarUrl)
                                        : AssetImage(Assets.images.boy.path)
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
                                  senderName,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextFontStyle.text145192A48w500roboto,
                                ),
                                UIHelper.verticalSpace(5),
                                Text(
                                  notification.message ?? '',
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
                        notification.time ?? '',
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
