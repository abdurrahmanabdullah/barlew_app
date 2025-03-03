// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:developer';

import 'package:barlew_app/helpers/toast.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../networks/rx_base.dart';
import 'api.dart';

final class SubmitProblemRX extends RxResponseInt<Map> {
  final api = SubmitProblemApi.instance;

  SubmitProblemRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> submitProblemRX({
    required int serviceId,
    required String description,
    required List<int> questionId,
    required List<int> skills,
    required List<int> answerId,
    required List<XFile> images,
  }) async {
    try {
      Map data = await api.submitProblemApi(
        serviceId: serviceId,
        description: description,
        questionId: questionId,
        images: images,
        skills: skills,
        answerId: answerId,
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









// // ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

// import 'dart:developer';
// import 'dart:io';

// import 'package:barlew_app/features/customer/problmes/data/api.dart';
// import 'package:barlew_app/networks/rx_base.dart';
// import 'package:dio/dio.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:rxdart/rxdart.dart';
// import '../../../../../../helpers/toast.dart';

// final class SubmitProblemRX extends RxResponseInt<Map> {
//   final api = SubmitProblemApi.instance;

//   SubmitProblemRX({required super.empty, required super.dataFetcher});

//   ValueStream get getFileData => dataFetcher.stream;
//   Future<Map> submitProblemApi({
//     required String description,
//     required List<int> question_id,
//     required List<int> answer_id,
//     required List<XFile> portfolio,
//   }) async {
//     try {
//       // Create the map with the new fields
//       Map<String, dynamic> mapData = {
//         "description": description,
//         "question_id": question_id,
//         "answer_id": answer_id,
//       };

//       // Create FormData from the map
//       FormData data = FormData.fromMap(mapData);

//       // Add portfolio files to FormData if available
//       if (portfolio.isNotEmpty) {
//         for (XFile photo in portfolio) {
//           if (await File(photo.path).exists()) {
//             data.files.add(
//               MapEntry(
//                 'portfolio[]', // Key for portfolio files
//                 await MultipartFile.fromFile(photo.path),
//               ),
//             );
//           }
//         }
//       }

//       // Submit the data via your API
//       var response = await Dio().post('your_api_endpoint', data: data);
//       return response.data; // Return the response data
//     } catch (e) {
//       rethrow; // Throw the error if something goes wrong
//     }
//   }
// }
