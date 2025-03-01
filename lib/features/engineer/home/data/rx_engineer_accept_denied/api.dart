import 'dart:convert';

import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class EngineerAcceptDeniedApi {
  static final EngineerAcceptDeniedApi _singleton =
      EngineerAcceptDeniedApi._internal();
  EngineerAcceptDeniedApi._internal();
  static EngineerAcceptDeniedApi get instance => _singleton;

  Future<Map> engineerAcceptDeniedApi(
      {required String status, required int id}) async {
    try {
      FormData data = FormData.fromMap({
        "status": status,
      });

      Response response =
          await postHttp(Endpoints.engineerAcceptDeniedEndpoint(id: id), data);

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
