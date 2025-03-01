import 'dart:developer';

import 'package:barlew_app/features/customer/matched_engineer/data/rx_post_match_engineer/api.dart';
import 'package:barlew_app/features/customer/matched_engineer/model/match_engineer_model.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

final class MatchEngineerRX extends RxResponseInt<MatchEngineerResponseModel> {
  final api = EngineerMatchApi.instance;

  MatchEngineerRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  /// Fetch engineers based on selected level and skills
  Future<bool> matchEngineerRX({
    required List<int> skillList,
  }) async {
    try {
      MatchEngineerResponseModel data = await api.engineerMatchApi(
        skillList: skillList,
      );

      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      handleErrorWithReturn(error);
      return false;
    }
  }

  @override
  handleSuccessWithReturn(MatchEngineerResponseModel data) {
    ToastUtil.showShortToast("Match Successful");
    dataFetcher.sink.add(data);
  }

  @override
  handleErrorWithReturn(dynamic error) {
    String errorMessage = (error is DioException)
        ? error.response?.data["message"] ?? "Error"
        : "An unexpected error occurred.";

    ToastUtil.showShortToast(errorMessage);
    log(error.toString());
    dataFetcher.sink.addError(error);
  }
}
