import 'package:barlew_app/features/customer/home/model/customer_home_profile_model.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';

import '../../../../../../networks/exception_handler/data_source.dart';

final class CustomerHomeprofile {
  static final CustomerHomeprofile _singleton = CustomerHomeprofile._internal();
  CustomerHomeprofile._internal();
  static CustomerHomeprofile get instance => _singleton;

  Future<CustomerHomeProfileModel> customerHomeProfile() async {
    try {
      Response response =
          await getHttp(Endpoints.customerHomeProfileEndpoint());

      if (response.statusCode == 200) {
        final data = CustomerHomeProfileModel.fromJson(response.data);
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
