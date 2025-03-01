// // ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:developer';
import 'package:barlew_app/constant/app_constants.dart';
import 'package:barlew_app/features/customer/auth/login/data/rx_post_sign_in/api.dart';
import 'package:barlew_app/features/customer/auth/login/model/sign_in_response_model.dart';
import 'package:barlew_app/helpers/di.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

final class CustomerSignInRX extends RxResponseInt<CustomerSignInResponseModel> {
  final api = CustomerSignInApi.instance;

  CustomerSignInRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  /// Returns `true` on success and `false` on error
  Future<bool> customerSignInRX({
    required String email,
    required String password,
  }) async {
    try {
      CustomerSignInResponseModel data = await api.customerSignInApi(
        email: email,
        password: password,
      );
      handleSuccessWithReturn(data);
      return true; // Return true on success
    } catch (error) {
      handleErrorWithReturn(error);
      return false; // Return false on error
    }
  }

  @override
  handleSuccessWithReturn(CustomerSignInResponseModel data) {
    ToastUtil.showShortToast("Sign In Success");
    appData.write(kKeyAccessToken, data.token);
    appData.write(kKeyIsLoggedIn, true);
    String token = appData.read(kKeyAccessToken);
    DioSingleton.instance.update(token);
    dataFetcher.sink.add(data);
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
