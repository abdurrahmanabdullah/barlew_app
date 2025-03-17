import 'dart:convert';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class EngineerCreateNewPasswordApi {
  static final EngineerCreateNewPasswordApi _singleton =
      EngineerCreateNewPasswordApi._internal();
  EngineerCreateNewPasswordApi._internal();
  static EngineerCreateNewPasswordApi get instance => _singleton;

  Future<Map> engineerCreateNewPasswordApi({
    required String token,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "token": token,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      });

      Response response =
          await postHttp(Endpoints.customerResetPassEndpoint(), data);

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      rethrow;
    }
  }
}
