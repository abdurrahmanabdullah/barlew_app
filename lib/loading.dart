// ignore_for_file: unused_element

import 'dart:developer';
import 'package:barlew_app/constant/app_constants.dart';
import 'package:barlew_app/features/customer_navigations_bar/presentations/navigations_bar_screen.dart';
import 'package:barlew_app/features/engineer_navigations_bar/presentations/enginner_navigations_bar.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'helpers/di.dart';
import 'helpers/helpers_method.dart';
import 'onboard_screen.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;

  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    await setInitValue();
    bool data = appData.read(kKeyIsLoggedIn) ?? false;
    log("==== $data");
    if (data) {
      String token = appData.read(kKeyAccessToken);
      DioSingleton.instance.update(token);
      // getProfileResponseRxObj.getProfile();
      // getCategoryResponseRxObj.getCategory();
      // getLinkResponseRxObj.getsocialLink();
    }
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const WelcomeScreen();
    } else {
      return appData.read(kKeyIsLoggedIn)
          ? appData.read(kUserRole) == "customer"
              ? const NavigationsBarScreen()
              : const EngineerNavigationsBarScreen()
          : const OnboardScreen();
    }
  }
}


// If the app is loading → Show WelcomeScreen().
// If the user is logged in:
// If they are a customer → Show NavigationsBarScreen().
// If they are an engineer → Show EngineerNavigationsBarScreen().
// If the user is not logged in → Show OnboardScreen().