import 'dart:convert';

import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class EngineerDeniedApi {
  static final EngineerDeniedApi _singleton = EngineerDeniedApi._internal();
  EngineerDeniedApi._internal();
  static EngineerDeniedApi get instance => _singleton;

  Future<Map> engineerDeniedApi(
      {required String status, required int id}) async {
    try {
      FormData data = FormData.fromMap({
        "status": status,
      });

      Response response =
          await postHttp(Endpoints.engineerDeniedEndpoint(id: id), data);

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
