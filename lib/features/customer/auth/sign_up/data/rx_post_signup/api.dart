// ignore_for_file: unused_import

import 'dart:convert';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';
import '../../../../../../helpers/toast.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../../../networks/exception_handler/data_source.dart';

final class CustomerSignUpApi {
  static final CustomerSignUpApi _singleton = CustomerSignUpApi._internal();
  CustomerSignUpApi._internal();
  static CustomerSignUpApi get instance => _singleton;

  Future<Map> customerSignUpApi({
    required String firstName,
    required String lasttName,
    required String email,
    required String role,
    required String address,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      Map data = {
        "first_name": firstName,
        "last_name": lasttName,
        "email": email,
        "role": role,
        "address": address,
        "password": password,
        "password_confirmation": passwordConfirmation
      };

      Response response =
          await postHttp(Endpoints.customerSignUpEndpoint(), data);

      if (response.statusCode == 201) {
        final data = json.decode(json.encode(response.data));
        ToastUtil.showShortToast("varify  Successful");
        return data;
      } else {
        // ToastUtil.showShortToast("Anything wrong");
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      // throw ErrorHandler.handle(error).failure.responseMessage;
      rethrow;
    }
  }
}
