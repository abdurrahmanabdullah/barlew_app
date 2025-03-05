import 'dart:convert';

import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class EngineerAcceptApi {
  static final EngineerAcceptApi _singleton = EngineerAcceptApi._internal();
  EngineerAcceptApi._internal();
  static EngineerAcceptApi get instance => _singleton;

  Future<Map> engineerAcceptApi(
      {required String status, required int id}) async {
    try {
      FormData data = FormData.fromMap({
        "status": status,
      });

      Response response =
          await getHttp(Endpoints.engineerAcceptEndpoint(id: id), data);

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
