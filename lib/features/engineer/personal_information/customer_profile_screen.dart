import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/customer/personal_Information/model/customer_profile_model.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../helpers/all_routes.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomerProfileScreen extends StatefulWidget {
  const CustomerProfileScreen({super.key});

  @override
  State<CustomerProfileScreen> createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen> {
  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() async {
    await customerProfileRXObj.customerProfileRX();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.cFFFFFF,
        centerTitle: true,
        title: const Text('Personal Information'),
      ),
      backgroundColor: AppColors.cFFFFFF,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 20.h),
        child: StreamBuilder<CustomerProfileModel>(
          stream: customerProfileRXObj.dataFetcher,
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
              final profileSnap = snapshot.data!.data!;
              return Column(
                children: [
                  Center(
                    child: profileSnap.avatar != ""
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(150.r),
                            child: CachedNetworkImage(
                              imageUrl: profileSnap.avatar!,
                              placeholder: (context, url) {
                                return Image.asset(
                                  Assets.images.profileAvatar.path,
                                  height: 100.h,
                                  width: 100.w,
                                  fit: BoxFit.cover,
                                );
                              },
                              width: 100.w,
                              height: 100.h,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(150.r),
                            child: Image.asset(
                              Assets.images.profileAvatar.path,
                              height: 100.h,
                              width: 100.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  // UIHelper.verticalSpace(17.h),
                  // Text(
                  //  "${profileSnap.firstName} ${profileSnap.lastName}",
                  //   style: TextFontStyle.text15c192A48400,
                  // ),
                  UIHelper.verticalSpace(60.h),

                  /// <<<<<<<<<<<<<<<<<< name text button star hare >>>>>>>>>>///////////////
                  CustomTextButton(
                    icon: IconButton(
                        enableFeedback: false,
                        highlightColor: Colors.transparent,
                        onPressed: () {},
                        icon: Image.asset(
                          Assets.icons.user.path,
                          height: 30.h,
                        )),
                    title: "${profileSnap.firstName} ${profileSnap.lastName}",
                    onTap: () {},
                    style: TextFontStyle.text20c192A48400,
                  ),

                  /// <<<<<<<<<<<<<<<<<< name text button end hare >>>>>>>>>>///////////////

                  UIHelper.verticalSpace(12.h),

                  /// <<<<<<<<<<<<<<<<<< emil text button start hare >>>>>>>>>>///////////////
                  CustomTextButton(
                    icon: IconButton(
                        enableFeedback: false,
                        highlightColor: Colors.transparent,
                        onPressed: () {},
                        icon: Image.asset(
                          Assets.icons.mail.path,
                          height: 30.h,
                        )),
                    title: profileSnap.email ?? "N/A",
                    onTap: () {},
                    style: TextFontStyle.text20c192A48400,
                  ),

                  /// <<<<<<<<<<<<<<<<<< email text button end hare >>>>>>>>>>///////////////
                  UIHelper.verticalSpace(12.h),

                  /// <<<<<<<<<<<<<<<<<< address text button start hare >>>>>>>>>>///////////////
                  CustomTextButton(
                    icon: IconButton(
                        enableFeedback: false,
                        highlightColor: Colors.transparent,
                        onPressed: () {},
                        icon: Image.asset(
                          Assets.icons.locationMarker.path,
                          height: 30.h,
                        )),
                    title: profileSnap.address ?? "N/A",
                    onTap: () {},
                    style: TextFontStyle.text20c192A48400,
                  ),

                  /// <<<<<<<<<<<<<<<<<< address text button end hare >>>>>>>>>>///////////////
                  UIHelper.verticalSpace(180.h),
                  CustomButton(
                    title: "Edit Profile",
                    onTap: () {
                      NavigationService.navigateToWithArgs(
                          Routes.editProfileScreen, {"snap": profileSnap});
                    },
                  )
                ],
              );
            } else {
              return Center(
                child: Text(
                  'Error: No data',
                  style: TextFontStyle.text11c9499A6w400roboto,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final Widget icon;
  final TextStyle style;
  final String title;
  final VoidCallback onTap;
  const CustomTextButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          // IconButton(onPressed: (){}, icon: Image.asset(Assets.icons.eddit.path,height: 30,),),
          icon,
          UIHelper.horizontalSpace(10.w),
          // Text('Henry Johnson')
          Text(
            title,
            style: style,
          )
        ],
      ),
    );
  }
}
