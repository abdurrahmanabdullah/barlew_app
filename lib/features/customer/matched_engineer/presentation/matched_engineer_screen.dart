import 'package:barlew_app/common_widget/custom_button.dart';
import 'package:barlew_app/features/customer/matched_engineer/presentation/widgets/custom_bottom_sheet.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:barlew_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../constant/text_font_style.dart';
import '../../../../gen/assets.gen.dart';

class MatchedEngineerScreen extends StatefulWidget {
  const MatchedEngineerScreen({super.key});

  @override
  State<MatchedEngineerScreen> createState() => _MatchedEngineerScreenState();
}

class _MatchedEngineerScreenState extends State<MatchedEngineerScreen> {
  final List<String> skills = [
    'Pipe fitting',
    'Pipe Plumbing',
    'Welding',
    'System testing.'
  ];
  @override
  void initState() {
    super.initState();
    // apiCall();
  }

  // apiCall() async {
  //   final EngineerDetailsData =
  //       await engineerDetailsPageRXobj.engineerDetailsPageRX();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(
          'Matched Engineer',
          style: TextFontStyle.text20cprimarycolorw500,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: AppColors.cFFFFFF,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpace(24.h),
              Center(
                child: CircleAvatar(
                  radius: 56.r,
                  backgroundImage: AssetImage(Assets.icons.reperMan.path),
                ),
              ),
              UIHelper.verticalSpace(50.h),
              Text('Milan Jack', style: TextFontStyle.text17c192A48w600),
              UIHelper.verticalSpace(11.h),
              Text('Plumbing Services',
                  style: TextFontStyle.text15c192A48500robotos),
              UIHelper.verticalSpace(30.h),

              /// Reviews section starts here ///
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: AssetImage(Assets.images.splashImage.path),
                  ),
                  UIHelper.horizontalSpace(6.w),
                  GestureDetector(
                    child: Image.asset(Assets.icons.strat.path, height: 14.h),
                  ),
                  UIHelper.horizontalSpace(6.w),
                  Text(
                    '4.9',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextFontStyle.text14c9198A6roboto,
                  ),
                  UIHelper.horizontalSpace(5.w),
                  Text(
                    '(550 Reviews)',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: TextFontStyle.text14c9198A6roboto,
                  ),
                ],
              ),

              /// Reviews section ends here ///
              UIHelper.verticalSpace(30.h),
              Text('Skills', style: TextFontStyle.text17c192A48w600),
              UIHelper.verticalSpace(12.h),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: skills.length,
                  itemBuilder: (_, index) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(101.r),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Center(child: Text(skills[index])),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                        width: 11.w); // Use 11.w for horizontal space
                  },
                ),
              ),
              UIHelper.verticalSpace(24.h),
              Text('About John', style: TextFontStyle.text17c192A48w600),
              UIHelper.verticalSpace(11.h),
              Text(
                'I’m Liam, a dedicated Plumber Engineer specializing in designing and maintaining efficient plumbing systems. Passionate about innovation and sustainability, I ensure reliable solutions for homes, businesses, and industries.',
                style: TextFontStyle.text14cc4C5363robotos,
              ),
              UIHelper.verticalSpace(30.h),
              Text('Portfolio', style: TextFontStyle.text17c192A48w600),
              UIHelper.verticalSpace(35.h),

              ///  image gridview start here ////
              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Prevent scrolling conflict
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 121.w,
                          height: 71.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.r),
                            image: DecorationImage(
                              image: AssetImage(Assets.images.imageFour.path),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        UIHelper.verticalSpace(5.h),
                      ],
                    ),
                  );
                },
              ),
              UIHelper.verticalSpace(22.h),
              CustomButton(
                onTap: () {
                  Get.bottomSheet(
                    const CustomBottomSheetTwo(),
                  );
                },
                radius: BorderRadius.circular(111.r),
                padding: EdgeInsets.symmetric(vertical: 17.h),
                title: 'Discuss issue',
                style: TextFontStyle.text15cFFFFFF500,
                color: AppColors.allPrimaryColor,
              ),
              UIHelper.verticalSpace(22.h),
            ],
          ),
        ),
      ),
    );
  }
}
///-----------api
// import 'package:barlew_app/common_widget/custom_button.dart';

// import 'package:barlew_app/features/customer/matched_engineer/model/match_engineer_details_model.dart';
// import 'package:barlew_app/features/customer/matched_engineer/presentation/widgets/custom_bottom_sheet.dart';
// import 'package:barlew_app/features/engineer/home/presentatiosn/engineer_home_screen.dart';
// import 'package:barlew_app/gen/colors.gen.dart';

// import 'package:barlew_app/helpers/toast.dart';
// import 'package:barlew_app/helpers/ui_helpers.dart';
// import 'package:barlew_app/networks/api_access.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';

// import '../../../../constant/text_font_style.dart';
// import '../../../../gen/assets.gen.dart';

// import 'package:get/get.dart';

// class MatchedEngineerScreen extends StatefulWidget {
//   final int id;
//   const MatchedEngineerScreen({super.key, required this.id});

//   @override
//   State<MatchedEngineerScreen> createState() => _MatchedEngineerScreenState();
// }

// class _MatchedEngineerScreenState extends State<MatchedEngineerScreen> {
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     apiCall();
//   }

//   // apiCall() async {
//   //   await engineerDetailsPageRXobj.engineerDetailsPageRX(id: widget.id);
//   // }
//   apiCall() async {
//     final engineerId = context.read<EngineerProvider>().engineerId;

//     if (engineerId != null) {
//       await engineerDetailsPageRXobj.engineerDetailsPageRX(
//           id: int.parse(engineerId));
//     } else {
//       // Handle case where engineerId is not available
//       print('Engineer ID is null');
//     }
//   }

//   Future<void> submitRequest() async {
//     try {
//       setState(() {
//         _isLoading = true;
//       });
//       final success = await customerToEngineerRequestRXobj
//           .customerToEngineerRequestRX(engineerid: widget.id);
//     } catch (error) {
//       setState(() {
//         _isLoading = false;
//       });
//       ToastUtil.showShortToast("Reset password failed: ${error.toString()}");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         scrolledUnderElevation: 0,
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         automaticallyImplyLeading: true,
//         title: Text(
//           'Matched Engineer',
//           style: TextFontStyle.text20cprimarycolorw500,
//         ),
//       ),
//       backgroundColor: AppColors.cFFFFFF,
//       body: StreamBuilder<EngineerDetailsPageModel>(
//         stream: engineerDetailsPageRXobj.dataFetcher,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (snapshot.hasError || snapshot.data?.data == null) {
//             return const Center(
//               child: Text("Failed to load data"),
//             );
//           }

//           // Fetch API Data
//           final engineer = snapshot.data!.data!.engineer!;
//           final String fullName =
//               "${engineer.firstName ?? 'Unknown'} ${engineer.lastName ?? ''}"
//                   .trim();
//           final String service = engineer.service ?? 'Service not available';
//           final String about = engineer.about ?? 'No details available';
//           final List<Skill> skills = engineer.skills ?? [];
//           final List<Portfolio> portfolios = engineer.portfolios ?? [];

//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   UIHelper.verticalSpace(24.h),

//                   /// Profile Avatar
//                   Center(
//                     child: CircleAvatar(
//                       radius: 56.r,
//                       backgroundImage: engineer.avatar != null
//                           ? NetworkImage(engineer.avatar!)
//                           : AssetImage(Assets.icons.reperMan.path)
//                               as ImageProvider,
//                     ),
//                   ),

//                   UIHelper.verticalSpace(50.h),

//                   /// Engineer Name
//                   Text(fullName, style: TextFontStyle.text17c192A48w600),
//                   UIHelper.verticalSpace(11.h),
//                   Text(service, style: TextFontStyle.text15c192A48500robotos),
//                   UIHelper.verticalSpace(30.h),

//                   /// Reviews Section
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       CircleAvatar(
//                         radius: 10,
//                         backgroundImage:
//                             AssetImage(Assets.images.splashImage.path),
//                       ),
//                       UIHelper.horizontalSpace(6.w),
//                       GestureDetector(
//                         child:
//                             Image.asset(Assets.icons.strat.path, height: 14.h),
//                       ),
//                       UIHelper.horizontalSpace(6.w),
//                       Text(
//                         '${snapshot.data!.data!.averageRating ?? 0}', // Fetching the average rating from API
//                         style: TextFontStyle.text14c9198A6roboto,
//                       ),
//                       UIHelper.horizontalSpace(5.w),
//                       Text(
//                         '(${snapshot.data!.data!.reviewCount ?? 0} Reviews)', // Fetching review count from API
//                         style: TextFontStyle.text14c9198A6roboto,
//                       ),
//                     ],
//                   ),

//                   UIHelper.verticalSpace(30.h),

//                   /// Skills Section
//                   Text('Skills', style: TextFontStyle.text17c192A48w600),
//                   UIHelper.verticalSpace(12.h),
//                   SizedBox(
//                     height: 40,
//                     child: ListView.separated(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: skills.length,
//                       itemBuilder: (_, index) {
//                         return Container(
//                           padding: EdgeInsets.symmetric(
//                               vertical: 1.h, horizontal: 15),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(101.r),
//                             border: Border.all(color: Colors.grey, width: 1),
//                           ),
//                           child: Center(child: Text(skills[index].name ?? "")),
//                         );
//                       },
//                       separatorBuilder: (_, __) => SizedBox(width: 11.w),
//                     ),
//                   ),

//                   UIHelper.verticalSpace(24.h),

//                   /// About Section
//                   Text('About $fullName',
//                       style: TextFontStyle.text17c192A48w600),
//                   UIHelper.verticalSpace(11.h),
//                   Text(
//                     about,
//                     style: TextFontStyle.text14cc4C5363robotos,
//                   ),

//                   UIHelper.verticalSpace(30.h),

//                   /// Portfolio Section
//                   Text('Portfolio', style: TextFontStyle.text17c192A48w600),
//                   UIHelper.verticalSpace(35.h),

//                   // Display Portfolio Images
//                   if (portfolios.isNotEmpty)
//                     GridView.builder(
//                         itemCount: portfolios.length,
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3,
//                           childAspectRatio: 1.3,
//                           crossAxisSpacing: 5,
//                         ),
//                         itemBuilder: (_, index) {
//                           final portfolio = portfolios[index];
//                           final image = portfolio.image ??
//                               'https://via.placeholder.com/121x71'; // Fallback image URL

//                           return Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 1.0),
//                             child: Container(
//                               width: 121.w,
//                               height: 71.h,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(14.r),
//                                 image: DecorationImage(
//                                   image: NetworkImage(
//                                       image), // Using fallback image if null
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           );
//                         })
//                   else
//                     const Center(child: Text('No portfolio available.')),

//                   UIHelper.verticalSpace(22.h),

//                   /// Discuss Button
//                   CustomButton(
//                     onTap: _isLoading
//                         ? null
//                         : () async {
//                             submitRequest();
//                             Get.bottomSheet(const CustomBottomSheetTwo());
//                           },
//                     radius: BorderRadius.circular(111.r),
//                     padding: EdgeInsets.symmetric(vertical: 17.h),
//                     title: 'Discuss issue',
//                     style: TextFontStyle.text15cFFFFFF500,
//                     color: _isLoading
//                         ? Colors.grey
//                         : AppColors
//                             .allPrimaryColor, // Disable button when loading
//                   ),

//                   UIHelper.verticalSpace(22.h),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
