import 'dart:developer';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'api.dart';

final class EngineerCreateNewPasswordRX extends RxResponseInt<Map> {
  final api = EngineerCreateNewPasswordApi.instance;

  EngineerCreateNewPasswordRX(
      {required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> engineerResetPassRX({
    required String token,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      Map data = await api.engineerCreateNewPasswordApi(
        token: token,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
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
