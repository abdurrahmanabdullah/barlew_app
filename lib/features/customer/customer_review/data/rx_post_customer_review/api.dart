// ignore_for_file: unused_import

import 'dart:convert';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';
import '../../../../../../helpers/toast.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../../../networks/exception_handler/data_source.dart';

final class CustomerRatingApi {
  static final CustomerRatingApi _singleton = CustomerRatingApi._internal();
  CustomerRatingApi._internal();
  static CustomerRatingApi get instance => _singleton;

  Future<Map> customerRatingApi({
    required int userId,
    required int rating,
    required String review,
  }) async {
    try {
      Map data = {
        "user_id": userId,
        "rating": rating,
        "review": review,
      };

      Response response =
          await postHttp(Endpoints.customerReviewsEndpoint(), data);

      if (response.statusCode == 201) {
        final data = json.decode(json.encode(response.data));
        ToastUtil.showShortToast("Give Rating  Successful");
        return data;
      } else {
        // ToastUtil.showShortToast("Anything wrong");
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      // throw ErrorHandler.handle(error).failure.responseMessage;
      rethrow;
    }
  }
}
