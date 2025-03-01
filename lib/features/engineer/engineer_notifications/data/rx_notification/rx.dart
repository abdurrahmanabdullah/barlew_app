// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, body_might_complete_normally_nullable

import 'dart:developer';
import 'package:barlew_app/features/engineer/engineer_notifications/data/rx_notification/api.dart';
import 'package:barlew_app/features/engineer/engineer_notifications/model/notification_model.dart';

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../../helpers/toast.dart';
import '../../../../../../../networks/rx_base.dart';

final class NotificationRX extends RxResponseInt<NotificationModel> {
  final api = NotificationApi.instance;

  NotificationRX({required super.empty, required super.dataFetcher});

  ValueStream get customerProfileSteam => dataFetcher.stream;

  Future<NotificationModel?> notificationRX() async {
    try {
      final NotificationModel data = await api.notificationApi();
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
