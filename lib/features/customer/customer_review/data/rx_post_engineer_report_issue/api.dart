// ignore_for_file: unused_import

import 'dart:convert';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';
import '../../../../../../helpers/toast.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../../../networks/exception_handler/data_source.dart';

final class EngineerReportApi {
  static final EngineerReportApi _singleton = EngineerReportApi._internal();
  EngineerReportApi._internal();
  static EngineerReportApi get instance => _singleton;

  Future<Map> engineerReportApi({
    required int discussionrequestid,
    required String type,
    required String description,
  }) async {
    try {
      Map data = {
        "discussion_request_id": discussionrequestid,
        "type": type,
        "description": description,
      };

      Response response =
          await postHttp(Endpoints.engineerReportEndpoint(), data);

      if (response.statusCode == 201) {
        final data = json.decode(json.encode(response.data));
        ToastUtil.showShortToast("Give  report   Successful");
        return data;
      } else {
        // ToastUtil.showShortToast("Anything wrong");
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      // throw ErrorHandler.handle(error).failure.responseMessage;
      rethrow;
    }
  }
}
