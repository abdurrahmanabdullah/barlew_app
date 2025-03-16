import 'package:barlew_app/features/customer/work_history/model/work_history_response_model.dart';

import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class CustomerWorkHistoryApi {
  static final CustomerWorkHistoryApi _singleton =
      CustomerWorkHistoryApi._internal();
  CustomerWorkHistoryApi._internal();
  static CustomerWorkHistoryApi get instance => _singleton;

  Future<WorkHistoryResponseModel> customerWorkHistoryApi(
      String endPart) async {
    try {
      Response response = await getHttp(
          Endpoints.customerWorkHistoryEndpoint(endPart: endPart));

      if (response.statusCode == 200) {
        final data = WorkHistoryResponseModel.fromJson(response.data);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
