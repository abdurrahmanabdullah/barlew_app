import 'dart:developer';
import 'package:flutter/material.dart';
import '../networks/exception_handler/data_source.dart';
import 'default_response_model.dart';
import 'navigation_service.dart';

extension Loader on Future {
  Future<dynamic> waitingForFuture() async {
    // showDialog(
    //   context: NavigationService.context,
    //   barrierColor: AppColors.cFFFFFF,
    //   builder: (context) => loadingIndicatorCircle(context: context),
    // );

    try {
      // Wait for the original future to complete
      dynamic result = await this;

      return result;
    } finally {
      // Close the loading dialog
      NavigationService.goBack;
    }
  }

  Future<dynamic> waitingAddToCart() async {
    showDialog(
      context: NavigationService.context,
      builder: (context) => const Center(
          // child: shimmer(context: context, name: Assets.lottie.addToCart),
          ),
    );

    try {
      // Wait for the original future to complete
      dynamic result = await this;

      return result;
    } finally {
      // Close the loading dialog
      NavigationService.goBack;
    }
  }

  Future<dynamic> waitingRemoveFromCart() async {
    showDialog(
      // barrierDismissible: false,
      // barrierColor: AppColors.cF4F4F4.withOpacity(.8),
      context: NavigationService.context,
      builder: (context) => const Center(
        // child: shimmer(
        //     context: context, name: Assets.lottie.removeFromCart, size: 120.sp),
      ),
    );

    try {
      // Wait for the original future to complete
      dynamic result = await this;

      return result;
    } finally {
      // Close the loading dialog
      NavigationService.goBack;
    }
  }

  Future<dynamic> waitingForFutureWithoutBg() async {
    // showDialog(
    //   context: NavigationService.context,
    //   builder: (context) => loadingIndicatorCircle(context: context),
    // );

    try {
      // Wait for the original future to complete
      dynamic result = await this;
      return result;
    } finally {
      // Close the loading dialog
      NavigationService.goBack;
    }
  }

  Future<void> waitingForFuturewithTime() async {
    try {
      // showDialog(
      //   context: NavigationService.context,
      //   barrierColor: AppColors.allPrimaryColor,
      //   builder: (context) => loadingIndicatorCircle(context: context),
      // );
      bool result = await this;
      NavigationService.goBack;
      if (result) {
        // showDialog(
        //   context: NavigationService.context,
        //   builder: (context) => shimmer(
        //       context: NavigationService.context,
        //       name: Assets.lottie.success,
        //       size: 120.sp),
        // );
        await Future.delayed(const Duration(milliseconds: 800), () {
          NavigationService.goBack;
        });
      }
    } catch (e) {
      NavigationService.goBack;
      log(e.toString());
    }
  }

  Future<void> waitingForSuccessShow() async {
    try {
      bool result = await this;
      if (result) {
        // showDialog(
        //   context: NavigationService.context,
        //   builder: (context) => shimmer(
        //       context: NavigationService.context,
        //       name: Assets.lottie.success,
        //       size: 120.sp),
        // );
        await Future.delayed(const Duration(milliseconds: 800), () {
          NavigationService.goBack;
        });
      }
    } catch (e) {
      NavigationService.goBack;
      log(e.toString());
    }
  }

  Future<bool> customeThen() async {
    bool retunValue = await then(
      (value) async {
        // showDialog(
        //   context: NavigationService.context,
        //   builder: (context) => shimmer(
        //       context: NavigationService.context,
        //       name: Assets.lottie.success,
        //       size: 120.sp),
        // );
        await Future.delayed(const Duration(milliseconds: 800), () {
          NavigationService.goBack;
        });
        DefaultResponse defaultResponse = value as DefaultResponse;
        ScaffoldMessenger.of(NavigationService.context).showSnackBar(
          SnackBar(
            content: Text(defaultResponse.message!),
          ),
        );
        return true;
      },
      onError: (value) {
        Failure failureresponse = value as Failure;
        ScaffoldMessenger.of(NavigationService.context).showSnackBar(
          SnackBar(
            content: Text(failureresponse.responseMessage),
          ),
        );
        return false;
      },
    );
    return retunValue;
  }
}
