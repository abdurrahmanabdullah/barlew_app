// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/rx_base.dart';
import 'package:dio/dio.dart';

import 'api.dart';

final class LogoutRx extends RxResponseInt<Map> {
  final api = LogoutApi.instance;

  LogoutRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> logoutRx() async {
    try {
      Map data = await api.logoutApi();
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
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
