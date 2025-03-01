// ignore_for_file: unused_import

import 'dart:convert';
import 'package:barlew_app/features/customer/auth/verify_email/model/customer_otp_response_model.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';


final class CustomerForgetOtpApi {
  static final CustomerForgetOtpApi _singleton = CustomerForgetOtpApi._internal();
  CustomerForgetOtpApi._internal();
  static CustomerForgetOtpApi get instance => _singleton;

  Future<CustomerOtpResponseModel> customerForgetOtpApi({
    required String email,
    required String otp,
  }) async {
    try {
      Map data = {
        "email": email,
        "otp": otp,
      };

      Response response = await postHttp(Endpoints.customerForgetOtpEndpoint(), data);

      if (response.statusCode == 201) {
        final data = CustomerOtpResponseModel.fromJson((response.data));
        ToastUtil.showShortToast("Verify Successful");
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