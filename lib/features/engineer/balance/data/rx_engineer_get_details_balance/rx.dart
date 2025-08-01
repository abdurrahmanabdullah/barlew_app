// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, body_might_complete_normally_nullable

import 'dart:developer';

import 'package:barlew_app/features/engineer/balance/data/rx_engineer_get_details_balance/api.dart';
import 'package:barlew_app/features/engineer/balance/model/engineer_balance_details_model.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

final class EngineerBalanceDetailsRX
    extends RxResponseInt<BalanceDetailsResponseModel> {
  final api = EngineerBalanceDetailsApi.instance;

  EngineerBalanceDetailsRX({required super.empty, required super.dataFetcher});

  ValueStream get customerProfileSteam => dataFetcher.stream;

  Future<BalanceDetailsResponseModel?> engineerBalanceDetailsRX() async {
    try {
      final BalanceDetailsResponseModel data =
          await api.engineerBalanceDetailsApi();
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
