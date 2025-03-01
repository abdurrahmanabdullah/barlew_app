// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, body_might_complete_normally_nullable

import 'dart:developer';

import 'package:barlew_app/features/engineer/personal_information/data/rx_engineer_profile/api.dart';

import 'package:barlew_app/features/engineer/personal_information/model/engineer_profile_model.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../helpers/toast.dart';
import '../../../../../networks/rx_base.dart';

final class EngineerProfileRX extends RxResponseInt<EngineerProfileModel> {
  final api = EngineerProfileApi.instance;

  EngineerProfileRX({required super.empty, required super.dataFetcher});

  ValueStream get customerProfileSteam => dataFetcher.stream;

  Future<EngineerProfileModel?> engineerProfileRX() async {
    try {
      final EngineerProfileModel data = await api.engineerProfileApi();
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
