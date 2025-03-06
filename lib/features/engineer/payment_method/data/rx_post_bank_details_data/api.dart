import 'dart:convert';
import 'dart:io';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

import '../../../../../../networks/dio/dio.dart';

final class EngineerBankDetailsApi {
  static final EngineerBankDetailsApi _singleton =
      EngineerBankDetailsApi._internal();
  EngineerBankDetailsApi._internal();
  static EngineerBankDetailsApi get instance => _singleton;

  Future<Map> engineerBankDetailsApi({
    required String bankName,
    required String accountNumber,
    required String accountHolderName,
    required String branchname,
    required String swiftCode,
    required String ifscCode,
  }) async {
    try {
      // Initialize FormData to hold the request data.
      FormData data = FormData.fromMap({
        "bank_name": bankName,
        "account_number": accountNumber,
        "account_holder_name": accountHolderName,
        "branch_name": branchname,
        "swift_code": swiftCode,
        "ifsc_code": ifscCode,
      });

      // Send the HTTP POST request
      Response response =
          await postHttp(Endpoints.engineerBankDetailsEndpoint(), data);

      // Check if the response is successful
      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        ToastUtil.showShortToast("Profile Updated Successfully");
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle errors
      rethrow;
    }
  }
}
