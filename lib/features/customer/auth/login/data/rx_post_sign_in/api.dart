// ignore_for_file: unused_import

import 'dart:convert';
import 'package:barlew_app/features/customer/auth/login/model/sign_in_response_model.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class CustomerSignInApi {
  static final CustomerSignInApi _singleton = CustomerSignInApi._internal();
  CustomerSignInApi._internal();
  static CustomerSignInApi get instance => _singleton;

  Future<CustomerSignInResponseModel> customerSignInApi({
    required String email,
    required String password,
  }) async {
    try {
      Map data = {
        "email": email,
        "password": password,
      };

      Response response = await postHttp(Endpoints.customerSignInEndpoint(), data);

      if (response.statusCode == 200) {
        final data = CustomerSignInResponseModel.fromJson((response.data));
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