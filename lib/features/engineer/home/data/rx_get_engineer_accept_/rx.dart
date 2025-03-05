// // ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, body_might_complete_normally_nullable

// import 'dart:developer';

// import 'package:barlew_app/features/engineer/home/data/rx_engineer_accept_denied/api.dart';
// import 'package:dio/dio.dart';
// import 'package:rxdart/rxdart.dart';
// import '../../../../../helpers/toast.dart';
// import '../../../../../networks/rx_base.dart';

// final class EngineerAcceptDeniedRX extends RxResponseInt<Map> {
//   final api = EngineerAcceptDeniedApi.instance;

//   EngineerAcceptDeniedRX({required super.empty, required super.dataFetcher});

//   ValueStream get customerProfileSteam => dataFetcher.stream;

//   Future<bool?> engineerAcceptDeniedRX(
//       {required int id, required String status}) async {
//     try {
//       Map data = await api.engineerAcceptDeniedApi(id: id, status: status);
//       handleSuccessWithReturn(data);
//       return true;
//     } catch (error) {
//       return handleErrorWithReturn(error);
//     }
//   }

//   @override
//   handleErrorWithReturn(dynamic error) {
//     if (error is DioException) {
//       if (error.response!.statusCode == 400) {
//         ToastUtil.showShortToast(error.response!.data["error"]);
//       } else {
//         ToastUtil.showShortToast(error.response!.data["message"]);
//       }
//     }
//     log(error.toString());
//     dataFetcher.sink.addError(error);
//     return false;
//   }
// }
///--------------------
// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, body_might_complete_normally_nullable

import 'dart:developer';

import 'package:barlew_app/features/engineer/home/data/rx_get_engineer_accept_/api.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../helpers/toast.dart';
import '../../../../../networks/rx_base.dart';

class EngineerAcceptRX extends RxResponseInt<Map> {
  final api = EngineerAcceptApi.instance;

  EngineerAcceptRX({required super.empty, required super.dataFetcher});

  ValueStream get customerProfileSteam => dataFetcher.stream;

  Future<bool?> engineerAcceptRX(
      {required int id, required String status}) async {
    try {
      Map data = await api.engineerAcceptApi(id: id, status: status);
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
