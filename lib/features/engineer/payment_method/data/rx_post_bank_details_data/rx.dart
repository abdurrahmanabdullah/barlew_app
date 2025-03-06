import 'dart:developer';
import 'package:barlew_app/helpers/toast.dart';
import 'package:dio/dio.dart';

import 'package:rxdart/rxdart.dart';
import '../../../../../../networks/rx_base.dart';
import 'api.dart';

final class EngineerBankDetailsRX extends RxResponseInt<Map> {
  final api = EngineerBankDetailsApi.instance;

  EngineerBankDetailsRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> engineerBankDetailsRX({
    required String bankName,
    required String accountNumber,
    required String accountHolderName,
    required String branchname,
    required String swiftCode,
    required String ifscCode,
  }) async {
    try {
      Map data = await api.engineerBankDetailsApi(
          accountHolderName: accountHolderName,
          bankName: bankName,
          accountNumber: accountNumber,
          branchname: branchname,
          swiftCode: swiftCode,
          ifscCode: ifscCode);
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
