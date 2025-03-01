import 'package:barlew_app/constant/text_font_style.dart';
import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/helpers/all_routes.dart';
import 'package:barlew_app/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({super.key});

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  goNextPage() async {
    ///////////////////////////////////////
    // if(findEngineer)
    await Future.delayed(const Duration(seconds: 5));
    NavigationService.navigateTo(Routes.matchedResultScreen);
    /////////////////////////////////////////////

    ////////////////////////////////////////
    // if(not fount engineer)
    // await Future.delayed(Duration(minutes: 1));
    // Show messege "engineer not found try again"..........something like thais
    ////////////////////////////////////////////
  }

  @override
  void initState() {
    goNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(Assets.lottie.waitingLottie, width: 250.w),
            Text(
              "Please Wait....",
              style: TextFontStyle.text11c9499A6w400roboto
                  .copyWith(fontSize: 22.sp),
            )
          ],
        ),
      ),
    );
  }
}
