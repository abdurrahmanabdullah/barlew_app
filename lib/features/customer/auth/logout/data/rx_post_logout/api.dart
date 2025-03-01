import 'dart:convert';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '../../../../../../networks/dio/dio.dart';

final class CustomerLogoutApi {
  static final CustomerLogoutApi _singleton = CustomerLogoutApi._internal();
  CustomerLogoutApi._internal();
  static CustomerLogoutApi get instance => _singleton;

  Future<Map> customerLogoutApi() async {
    try {
      FormData data = FormData.fromMap({});

      Response response = await postHttp(Endpoints.customerLogoutEndpoint(), data);

      if (response.statusCode == 200) {
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
