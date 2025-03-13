// ignore_for_file: unused_import

import 'dart:convert';

import 'package:barlew_app/features/customer/matched_engineer/model/paypal_pay_response_model.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_login/model/engineer_login_response_model.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class PaypalPayRequestApi {
  static final PaypalPayRequestApi _singleton = PaypalPayRequestApi._internal();
  PaypalPayRequestApi._internal();
  static PaypalPayRequestApi get instance => _singleton;

  Future<PaypalpayResponseModel> paypalPayRequest({
    required int discussionrequestid,
  }) async {
    try {
      Map data = {
        "discussion_request_id": discussionrequestid,
      };

      Response response =
          await postHttp(Endpoints.paypalPaymentEndpoint(), data);

      if (response.statusCode == 200) {
        final data = PaypalpayResponseModel.fromJson((response.data));
        ToastUtil.showShortToast("paypal  page show  Successful");
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
