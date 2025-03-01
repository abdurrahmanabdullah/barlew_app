// ignore_for_file: unused_import

import 'dart:convert';

import 'package:barlew_app/features/engineer/engineer_auth/engineer_login/model/engineer_login_response_model.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class LogInApi {
  static final LogInApi _singleton = LogInApi._internal();
  LogInApi._internal();
  static LogInApi get instance => _singleton;

  Future<engineer_login_response_model> logIn({
    required String email,
    required String password,
  }) async {
    try {
      Map data = {
        "email": email,
        "password": password,
      };

      Response response = await postHttp(Endpoints.loginEndPoint(), data);

      if (response.statusCode == 200) {
        final data = engineer_login_response_model.fromJson((response.data));
        ToastUtil.showShortToast("Sign In Successful");
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      // throw ErrorHandler.handle(error).failure.responseMessage;
      rethrow;
    }
  }
}
