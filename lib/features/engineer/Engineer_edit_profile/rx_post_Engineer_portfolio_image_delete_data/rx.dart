import 'dart:developer';

import 'package:barlew_app/features/engineer/Engineer_edit_profile/rx_post_Engineer_portfolio_image_delete_data/api.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

final class EngineerPortfolioDeleteRX extends RxResponseInt<Map> {
  final api = EngineerPortfolioDelete.instance;

  EngineerPortfolioDeleteRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> engineerPortfolioDeleteRX({
    required int id,
  }) async {
    try {
      Map data = await api.postDeleteApi(id: id);
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
