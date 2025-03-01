// // ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:developer';
import 'package:barlew_app/constant/app_constants.dart';
import 'package:barlew_app/features/customer/auth/verify_email/data/rx_post_verify_otp/api.dart';
import 'package:barlew_app/features/customer/auth/verify_email/model/customer_otp_response_model.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';


final class CustomerForgetOtpRX extends RxResponseInt<CustomerOtpResponseModel> {
  final api = CustomerForgetOtpApi.instance;

  CustomerForgetOtpRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  /// Returns `true` on success and `false` on error
  Future<bool> customerForgetOtpRX({
    required String email,
    required String otp,
  }) async {
    try {
      CustomerOtpResponseModel data = await api.customerForgetOtpApi(
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
  handleSuccessWithReturn(CustomerOtpResponseModel data) {
    otpVerifyToken = data.data!.token!;
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
