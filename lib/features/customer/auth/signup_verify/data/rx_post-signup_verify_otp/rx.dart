// // ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:developer';
import 'package:barlew_app/constant/app_constants.dart';
import 'package:barlew_app/features/customer/auth/signup_verify/data/rx_post-signup_verify_otp/api.dart';
import 'package:barlew_app/features/customer/auth/signup_verify/model/sign_up_verify_model.dart';
import 'package:barlew_app/helpers/di.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

final class CustomerSignUpOtpVerifyRX extends RxResponseInt<CustomerSignUpVerifyModel> {
  final api = SignUpOtpVerifyApi.instance;

  CustomerSignUpOtpVerifyRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  /// Returns `true` on success and `false` on error
  Future<bool> customerSignUpOtpVerifyRX({
    required String email,
    required String otp,
  }) async {
    try {
      CustomerSignUpVerifyModel data = await api.signUpOtpVerifyApi(
        email: email,
        otp: otp,
      );
      handleSuccessWithReturn(data);
      return true; // Return true on success
    } catch (error) {
      handleErrorWithReturn(error);
      return false; // Return false on error
    }
  }

  @override
  handleSuccessWithReturn(CustomerSignUpVerifyModel data) {
    appData.write(kKeyAccessToken, data.data?.token);
    appData.write(kKeyIsLoggedIn, true);
    String token = appData.read(kKeyAccessToken);
    DioSingleton.instance.update(token);
    dataFetcher.sink.add(data);
    return data;
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response?.statusCode == 422) {
        ToastUtil.showShortToast(error.response?.data["message"] ?? "Error");
      } else {
        ToastUtil.showShortToast(error.response?.data["message"] ?? "Error");
      }
    } else {
      ToastUtil.showShortToast("An unexpected error occurred.");
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
  }
}
