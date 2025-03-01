// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:developer';

import 'package:barlew_app/constant/app_constants.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_signup_verify/model/engineer_signup_otp_verify_model.dart';
import 'package:barlew_app/helpers/di.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../networks/rx_base.dart';
import 'api.dart';

final class PostVerifyOTPRx
    extends RxResponseInt<EngineerSignupOtpVerifyModel> {
  final api = PostEngineerSignupOtpVerifyApi.instance;

  PostVerifyOTPRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> postVerifyOTPRx({
    required String email,
    required int otp,
  }) async {
    try {
      EngineerSignupOtpVerifyModel data =
          await api.postEngineerSignupOtpVerifyApi(
        email: email,
        otp: otp,
      );
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(EngineerSignupOtpVerifyModel data) {
    appData.write(kKeyAccessToken, data.data!.token);
    appData.write(kKeyIsLoggedIn, true);
    String token = appData.read(kKeyAccessToken);
    DioSingleton.instance.update(token);
    dataFetcher.sink.add(data);
    return data;
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 401) {
        ToastUtil.showShortToast(error.response!.data["message"]);
      } else {
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    return false;
  }
}
