import 'dart:developer';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'api.dart';

final class CustomerToEngineerRequestRX extends RxResponseInt<Map> {
  final api = UserRequestToEngineerApi.instance;

  CustomerToEngineerRequestRX(
      {required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> customerToEngineerRequestRX({required int engineerid}) async {
    try {
      Map data = await api.customerResetPassApi(
        engineerid: engineerid,
      );
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
