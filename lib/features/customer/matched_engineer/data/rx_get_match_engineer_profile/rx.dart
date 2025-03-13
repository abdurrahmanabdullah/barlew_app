import 'dart:developer';

import 'package:barlew_app/features/customer/matched_engineer/data/rx_get_match_engineer_profile/api.dart';

import 'package:barlew_app/features/customer/matched_engineer/model/match_engineer_profile_model.dart';

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../helpers/toast.dart';
import '../../../../../networks/rx_base.dart';

final class MatchEngineerProfileRX
    extends RxResponseInt<MatchEngineerProfileModel> {
  final api = MatchEngineerProfileApi.instance;

  MatchEngineerProfileRX({required super.empty, required super.dataFetcher});

  ValueStream get customerProfileSteam => dataFetcher.stream;

  Future<MatchEngineerProfileModel?> matchEngineerProfileRX(
      {required String requestId}) async {
    try {
      final MatchEngineerProfileModel data =
          await api.matchEngineerProfileApi(requestId);
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
