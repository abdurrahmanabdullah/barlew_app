// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:developer';

import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import 'api.dart';

final class ForgetPasswordSendOTPRx extends RxResponseInt<Map> {
  final api = PostSendOTPApi.instance;

  ForgetPasswordSendOTPRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> forgetPasswordSendOTPRx({
    required String email,
  }) async {
    try {
      Map data = await api.postSendOTPApi(
        email: email,
      );
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      handleErrorWithReturn(error);
      return false;
    }
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 400) {
        ToastUtil.showShortToast(error.response!.data["error"]);
      } else {
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    return false;
  }
}
