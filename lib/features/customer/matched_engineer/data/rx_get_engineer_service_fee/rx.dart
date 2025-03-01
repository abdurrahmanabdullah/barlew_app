import 'dart:developer';

import 'package:barlew_app/features/customer/matched_engineer/data/rx_get_engineer_service_fee/api.dart';
import 'package:barlew_app/features/customer/matched_engineer/model/customer_service_fee_model.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

final class EngineerServiceFeeRX
    extends RxResponseInt<ServiceFeeResponseModel> {
  final api = EngineerServiceFeeApi.instance;

  EngineerServiceFeeRX({required super.empty, required super.dataFetcher});

  ValueStream get customerProfileSteam => dataFetcher.stream;

  Future<ServiceFeeResponseModel?> engineerServiceFeeRX() async {
    try {
      final ServiceFeeResponseModel data = await api.engineerServiceFeeApi();
      handleSuccessWithReturn(data);
      return data;
    } catch (error) {
      // Handle the error locally and return a fallback response
      if (error is DioException) {
        ToastUtil.showShortToast(
            error.response!.data["message"] ?? "Unknown error");
      }
      log(error.toString());
    }
    return null;
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 422) {
        ToastUtil.showShortToast(error.response!.data["message"]);
      } else {
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    // throw error;
    return false;
  }
}
