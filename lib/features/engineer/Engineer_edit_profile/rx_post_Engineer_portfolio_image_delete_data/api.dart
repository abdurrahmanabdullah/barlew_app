import 'dart:convert';

import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

import '../../../../../networks/dio/dio.dart';

final class EngineerPortfolioDelete {
  static final EngineerPortfolioDelete _singleton =
      EngineerPortfolioDelete._internal();
  EngineerPortfolioDelete._internal();
  static EngineerPortfolioDelete get instance => _singleton;

  Future<Map> postDeleteApi({
    required int id,
  }) async {
    try {
      Response response =
          await deleteHttp(Endpoints.engineerpostDeleteEndpoint(id: id));

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
