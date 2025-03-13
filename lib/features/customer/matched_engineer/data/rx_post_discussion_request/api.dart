// ignore_for_file: unused_import

import 'dart:convert';

import 'package:barlew_app/features/engineer/engineer_auth/engineer_login/model/engineer_login_response_model.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class UserRequestToEngineerApi {
  static final UserRequestToEngineerApi _singleton =
      UserRequestToEngineerApi._internal();
  UserRequestToEngineerApi._internal();
  static UserRequestToEngineerApi get instance => _singleton;

  Future<Map> customerResetPassApi({
    required int engineerid,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "engineer_id": engineerid,
      });

      Response response =
          await postHttp(Endpoints.customerToRequestEndpoint(), data);

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
