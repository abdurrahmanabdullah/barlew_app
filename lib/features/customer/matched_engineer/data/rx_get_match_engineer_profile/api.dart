library;

import 'package:barlew_app/features/customer/matched_engineer/model/match_engineer_profile_model.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class MatchEngineerProfileApi {
  static final MatchEngineerProfileApi _singleton =
      MatchEngineerProfileApi._internal();
  MatchEngineerProfileApi._internal();
  static MatchEngineerProfileApi get instance => _singleton;

  Future<MatchEngineerProfileModel> matchEngineerProfileApi(
    String requestId,
  ) async {
    try {
      Response response = await getHttp(
          Endpoints.engineerMatchProfileEndpoint(requestId: requestId));

      if (response.statusCode == 200) {
        final data = MatchEngineerProfileModel.fromJson(response.data);
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
