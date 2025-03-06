import 'dart:convert';
import 'dart:io';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

import '../../../../../../networks/dio/dio.dart';

final class EngineerWithDrawlRequestApi {
  static final EngineerWithDrawlRequestApi _singleton =
      EngineerWithDrawlRequestApi._internal();
  EngineerWithDrawlRequestApi._internal();
  static EngineerWithDrawlRequestApi get instance => _singleton;

  Future<Map> engineerWithDrawlRequestApi({
    required int bankDetails,
    required int amount,
  }) async {
    try {
      // Initialize FormData to hold the request data.
      FormData data = FormData.fromMap({
        "bank_details_id": bankDetails,
        "amount": amount,
      });

      // Send the HTTP POST request
      Response response =
          await postHttp(Endpoints.engineerWithdrawalrequestEndpoint(), data);

      // Check if the response is successful
      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        ToastUtil.showShortToast("withdrawl request Successfully");
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle errors
      rethrow;
    }
  }
}
