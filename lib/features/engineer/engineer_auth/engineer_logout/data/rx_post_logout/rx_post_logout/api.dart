import 'dart:convert';

import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class LogoutApi {
  static final LogoutApi _singleton = LogoutApi._internal();
  LogoutApi._internal();
  static LogoutApi get instance => _singleton;

  Future<Map> logoutApi() async {
    try {
      FormData data = FormData.fromMap({});

      Response response = await postHttp(Endpoints.logoutEndPoint(), data);

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        // ToastUtil.showShortToast("Updated Successfully");
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
