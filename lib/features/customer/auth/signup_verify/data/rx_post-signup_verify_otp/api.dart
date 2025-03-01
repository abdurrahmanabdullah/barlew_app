// ignore_for_file: unused_import

import 'dart:convert';
import 'package:barlew_app/features/customer/auth/signup_verify/model/sign_up_verify_model.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class SignUpOtpVerifyApi {
  static final SignUpOtpVerifyApi _singleton = SignUpOtpVerifyApi._internal();
  SignUpOtpVerifyApi._internal();
  static SignUpOtpVerifyApi get instance => _singleton;

  Future<CustomerSignUpVerifyModel> signUpOtpVerifyApi({
    required String email,
    required String otp,
  }) async {
    try {
      Map data = {
        "email": email,
        "otp": otp,
      };

      Response response =
          await postHttp(Endpoints.customerSignUpOtpVerifyEndpoint(), data);

      if (response.statusCode == 200) {
        final data = CustomerSignUpVerifyModel.fromJson((response.data));
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
