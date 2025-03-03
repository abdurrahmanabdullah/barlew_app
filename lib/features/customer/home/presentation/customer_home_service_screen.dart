import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/features/customer/home/model/customer_home_model.dart';
import 'package:barlew_app/features/customer/home/widgets/custom_divider_widget.dart';
import 'package:barlew_app/features/customer/home/widgets/customer_drawer.dart';
import 'package:barlew_app/features/customer/personal_Information/model/customer_profile_model.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:barlew_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  @override
  void initState() {
    super.initState();
    apiCall();
    profileimgapiCall();
  }

  apiCall() async {
    await customerHomeServiceRXobj.customerhomeserviceRX();
  }

  profileimgapiCall() async {
    await customerProfileRXObj.customerProfileRX();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.cFFFFFF,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu,
                  color: AppColors.c000000), // Hamburger icon
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
            );
          },
        ),
        actions: [
          StreamBuilder<CustomerProfileModel>(
            stream: customerProfileRXObj.dataFetcher,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                const SpinKitCircle(
                  color: Colors.yellow,
                  size: 50.0,
                );
              }
              if (snapshot.hasData) {
                GlobalProfile.firstName = snapshot.data?.data?.firstName;
                GlobalProfile.lastName = snapshot.data?.data?.lastName;
                GlobalProfile.email = snapshot.data?.data?.email;
                GlobalProfile.avatar = snapshot.data?.data?.avatar;

                return CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data!.data!.avatar!),
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
          UIHelper.horizontalSpace(11.w),
        ],
      ),
      drawer: const CustomerDrawer(),
      backgroundColor: AppColors.cFFFFFF,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: StreamBuilder<CustomerHomeServiceModel>(
          stream: customerHomeServiceRXobj.dataFetcher,
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
                child: Text("Snapshot has error"),
              );
            }

            if (snapshot.hasData) {
              final homeServiceData = snapshot.data!.data!;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.verticalSpace(12.h),
                    const CustomDividerWidget(),
                    UIHelper.verticalSpace(20.h),
                    Text(
                      'Our Service',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 22.sp,
                      ),
                    ),
                    UIHelper.verticalSpace(12.h),

                    /// First GridView (Our Service)
                    GridView.builder(
                      itemCount: homeServiceData.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.w,
                        childAspectRatio: 1.05,
                      ),
                      itemBuilder: (_, index) {
                        final service = homeServiceData[index];
                        return GestureDetector(
                          onTap: () {
                            NavigationService.navigateToWithArgs(
                                Routes.questionsPageScreen,
                                {"id": snapshot.data!.data![index].id});
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 179.w,
                                height: 119.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  image: DecorationImage(
                                    image: service.thumbnail != null
                                        ? NetworkImage(service.thumbnail!)
                                        : AssetImage(
                                                Assets.images.imageOne.path)
                                            as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              UIHelper.verticalSpace(5.h),
                              Center(
                                child: Text(
                                  service.title ?? "No title",
                                  style: TextFontStyle.text14c626262inter400
                                      .copyWith(color: AppColors.c000000),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    UIHelper.verticalSpace(16.h),
                    Text(
                      'Trending Projects',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 22.sp,
                      ),
                    ),
                    UIHelper.verticalSpace(12.h),

                    /// Second GridView (Trending Projects)
                    GridView.builder(
                      itemCount: homeServiceData.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.w,
                        childAspectRatio: 1.05,
                      ),
                      itemBuilder: (_, index) {
                        final project = homeServiceData[index];
                        return GestureDetector(
                          onTap: () {
                            NavigationService.navigateToWithArgs(
                                Routes.questionsPageScreen,
                                {"id": snapshot.data!.data![index].id});
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 179.w,
                                height: 119.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.r),
                                  image: DecorationImage(
                                    image: project.thumbnail != null
                                        ? NetworkImage(project.thumbnail!)
                                        : AssetImage(
                                                Assets.images.imageTwo.path)
                                            as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              UIHelper.verticalSpace(5.h),
                              Center(
                                child: Text(
                                  project.title ?? "No title",
                                  style: TextFontStyle.text14c626262inter400
                                      .copyWith(color: AppColors.c000000),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text(
                  'No data Found',
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

//// global variable
class GlobalProfile {
  static String? firstName;
  static String? lastName;
  static String? email;
  static String? avatar;
}
