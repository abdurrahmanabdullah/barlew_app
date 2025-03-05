import 'dart:developer';

import 'package:barlew_app/features/engineer/home/data/rx_post_engineer_denied/api.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../helpers/toast.dart';
import '../../../../../networks/rx_base.dart';

class EngineerDeniedRX extends RxResponseInt<Map> {
  final api = EngineerDeniedApi.instance;

  EngineerDeniedRX({required super.empty, required super.dataFetcher});

  ValueStream get customerProfileSteam => dataFetcher.stream;

  Future<bool?> engineerDeniedRX(
      {required int id, required String status}) async {
    try {
      Map data = await api.engineerDeniedApi(id: id, status: status);
      handleSuccessWithReturn(data);

      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response != null && error.response!.data != null) {
        String? errorMessage =
            error.response!.data["error"] ?? error.response!.data["message"];
        if (errorMessage != null) {
          ToastUtil.showShortToast(errorMessage);
        } else {
          ToastUtil.showShortToast("An unknown error occurred.");
        }
      } else {
        ToastUtil.showShortToast("No response from server.");
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    return false;
  }
}
