// // ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, body_might_complete_normally_nullable

// import 'dart:developer';

// import 'package:barlew_app/features/customer/history_details/data/rx_get_work_history_details/api.dart';
// import 'package:barlew_app/features/customer/history_details/model/history_details_response_model.dart';

// import 'package:dio/dio.dart';
// import 'package:rxdart/rxdart.dart';
// import '../../../../../../helpers/toast.dart';
// import '../../../../../../networks/rx_base.dart';

// final class HistoryDetailsRX
//     extends RxResponseInt<HistoryDetailsResponseModel> {
//   final api = HistoryDetailsApi.instance;

//   HistoryDetailsRX({required super.empty, required super.dataFetcher});

//   ValueStream get customerProfileSteam => dataFetcher.stream;

//   Future<HistoryDetailsResponseModel?> historyDetailsRX(
//       {required int id}) async {
//     try {
//       final HistoryDetailsResponseModel data = await api.historyDetailsApi(
//         id: id,
//       );
//       handleSuccessWithReturn(data);
//       return data;
//     } catch (error) {
//       // Handle the error locally and return a fallback response
//       if (error is DioException) {
//         // ToastUtil.showShortToast(
//         //     error.response!.data["message"] ?? "Unknown error");
//       }
//       log(error.toString());
//     }
//   }

//   @override
//   handleErrorWithReturn(dynamic error) {
//     if (error is DioException) {
//       if (error.response!.statusCode == 422) {
//         ToastUtil.showShortToast(error.response!.data["message"]);
//       } else {
//         ToastUtil.showShortToast(error.response!.data["message"]);
//       }
//     }
//     log(error.toString());
//     dataFetcher.sink.addError(error);
//     // throw error;
//     return false;
//   }
// }
