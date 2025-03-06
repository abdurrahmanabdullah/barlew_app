import 'dart:developer';
import 'package:barlew_app/helpers/toast.dart';
import 'package:dio/dio.dart';

import 'package:rxdart/rxdart.dart';
import '../../../../../../networks/rx_base.dart';
import 'api.dart';

final class EngineerWithdrawlRequestRX extends RxResponseInt<Map> {
  final api = EngineerWithDrawlRequestApi.instance;

  EngineerWithdrawlRequestRX(
      {required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> engineerWithdrawlRequestRX({
    required int bankDetails,
    required int amount,
  }) async {
    try {
      Map data = await api.engineerWithDrawlRequestApi(
          bankDetails: bankDetails, amount: amount);
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 400) {
        ToastUtil.showShortToast(error.response!.data["error"]);
      } else {
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    return false;
  }
}
