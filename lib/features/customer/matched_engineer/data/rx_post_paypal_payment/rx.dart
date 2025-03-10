import 'dart:developer';
import 'package:barlew_app/features/customer/matched_engineer/model/paypal_pay_response_model.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'api.dart';

final class PaypalPayRequestRX extends RxResponseInt<PaypalpayResponseModel> {
  final api = PaypalPayRequestApi.instance;
  String? _paymentUrl;
  PaypalPayRequestRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;
  String? get paymentUrl => _paymentUrl;

  /// Returns `true` on success and `false` on error
  Future<bool> paypalPayRequestRX({
    required int discussionrequestid,
  }) async {
    try {
      PaypalpayResponseModel data =
          await api.paypalPayRequest(discussionrequestid: discussionrequestid);

      // Extract payment URL
      _paymentUrl = data.data?.paymentUrl;
      handleSuccessWithReturn(data);
      return true; // Return true on success
    } catch (error) {
      handleErrorWithReturn(error);
      return false; // Return false on error
    }
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response?.statusCode == 422) {
        ToastUtil.showShortToast(error.response?.data["message"] ?? "Error");
      } else {
        ToastUtil.showShortToast(error.response?.data["message"] ?? "Error");
      }
    } else {
      ToastUtil.showShortToast("An unexpected error occurred.");
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
  }
}
