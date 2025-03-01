// ignore_for_file: unused_import

import 'dart:convert';

import 'package:barlew_app/features/customer/matched_engineer/model/customer_service_fee_model.dart';
import 'package:barlew_app/features/customer/matched_engineer/model/match_engineer_model.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_login/model/engineer_login_response_model.dart';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class EngineerServiceFeeApi {
  static final EngineerServiceFeeApi _singleton =
      EngineerServiceFeeApi._internal();
  EngineerServiceFeeApi._internal();
  static EngineerServiceFeeApi get instance => _singleton;

  Future<ServiceFeeResponseModel> engineerServiceFeeApi() async {
    try {
      Response response = await getHttp(Endpoints.engineerServiceFeeEndpoint());

      if (response.statusCode == 200) {
        final data = ServiceFeeResponseModel.fromJson(response.data);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      // throw ErrorHandler.handle(error).failure.responseMessage;
      rethrow;
    }
  }
}
