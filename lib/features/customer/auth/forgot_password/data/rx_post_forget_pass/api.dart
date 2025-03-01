import 'dart:convert';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class CustomerForgetPassApi {
  static final CustomerForgetPassApi _singleton = CustomerForgetPassApi._internal();
  CustomerForgetPassApi._internal();
  static CustomerForgetPassApi get instance => _singleton;

  Future<Map> customerForgetPassApi({
    required String email,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "email": email,
      });

      Response response = await postHttp(Endpoints.customerForgetPassEndpoint(), data);

      if (response.statusCode == 201) {
        final data = json.decode(json.encode(response.data));
        // ToastUtil.showShortToast("Updated Successfully");
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      rethrow;
    }
  }
}
