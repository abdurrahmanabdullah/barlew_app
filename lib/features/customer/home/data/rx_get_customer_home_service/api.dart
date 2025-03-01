import 'package:barlew_app/features/customer/home/model/customer_home_model.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';

import '../../../../../../networks/exception_handler/data_source.dart';

final class CustomerHomeService {
  static final CustomerHomeService _singleton = CustomerHomeService._internal();
  CustomerHomeService._internal();
  static CustomerHomeService get instance => _singleton;

  Future<CustomerHomeServiceModel> customerHomeService() async {
    try {
      Response response = await getHttp(Endpoints.customerserviceEndpoint());

      if (response.statusCode == 200) {
        final data = CustomerHomeServiceModel.fromJson(response.data);
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
