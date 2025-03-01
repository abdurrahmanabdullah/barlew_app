import 'package:barlew_app/gen/assets.gen.dart';
import 'package:barlew_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: Center(
        child: Container(
          width: 212.w,
          height: 212.h,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.splashImage.path),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
