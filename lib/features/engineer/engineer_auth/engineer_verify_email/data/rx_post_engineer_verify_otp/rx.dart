// // ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:developer';
import 'package:barlew_app/constant/app_constants.dart';

import 'package:barlew_app/features/engineer/engineer_auth/engineer_verify_email/data/rx_post_engineer_verify_otp/api.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_verify_email/model/engineer_otp_response_model.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

final class EngineerForgetPasswordOtpRX
    extends RxResponseInt<EngineerOtpResponseModel> {
  final api = EngineerForgetpasswordOtpApi.instance;

  EngineerForgetPasswordOtpRX(
      {required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  /// Returns `true` on success and `false` on error
  Future<bool> engineerForgetPasswordOtpRX({
    required String email,
    required String otp,
  }) async {
    try {
      EngineerOtpResponseModel data = await api.engineerForgetpasswordOtpApi(
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
  handleSuccessWithReturn(EngineerOtpResponseModel data) {
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
