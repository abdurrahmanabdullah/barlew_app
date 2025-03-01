// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:developer';
import 'package:barlew_app/helpers/toast.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../networks/rx_base.dart';
import 'api.dart';

final class CustomerEditProfileRX extends RxResponseInt<Map> {
  final api = CustomerEditProfileApi.instance;

  CustomerEditProfileRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> customerEditProfileRX({
    required String firstName,
    required String lastName,
    required String address,
    required XFile avatar,
  }) async {
    try {
      Map data = await api.customerEditProfileApi(
        firstName: firstName,
        lastName: lastName,
        address: address,
        avatar: avatar,
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
