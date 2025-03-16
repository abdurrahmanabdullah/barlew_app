import 'package:barlew_app/features/customer/history_details/model/history_details_response_model.dart';

import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';
import '../../../../../../networks/exception_handler/data_source.dart';

final class HistoryDetailsApi {
  static final HistoryDetailsApi _singleton = HistoryDetailsApi._internal();
  HistoryDetailsApi._internal();
  static HistoryDetailsApi get instance => _singleton;

  Future<HistoryDetailsResponseModel> historyDetailsApi(
      {required int id}) async {
    try {
      Response response =
          await getHttp(Endpoints.historyDetailsEndpoint(id: id));

      if (response.statusCode == 200) {
        final data = HistoryDetailsResponseModel.fromJson(response.data);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
