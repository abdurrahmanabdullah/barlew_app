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

import 'package:barlew_app/features/engineer/home/data/rx_engineer_accept_denied/api.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../helpers/toast.dart';
import '../../../../../networks/rx_base.dart';

class EngineerAcceptDeniedRX extends RxResponseInt<Map> {
  final api = EngineerAcceptDeniedApi.instance;

  EngineerAcceptDeniedRX({required super.empty, required super.dataFetcher});

  ValueStream get customerProfileSteam => dataFetcher.stream;

  Future<Map?> engineerAcceptDeniedRX(
      {required int id, required String status}) async {
    try {
      Map data = await api.engineerAcceptDeniedApi(id: id, status: status);
      handleSuccessWithReturn(data);

      // Return the accepted_by details (engineer's info)
      return data['data']?['accepted_request']?['accepted_by'];
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
