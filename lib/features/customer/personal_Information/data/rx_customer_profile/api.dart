import 'package:barlew_app/features/customer/personal_Information/model/customer_profile_model.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class CustomerProfileApi {
  static final CustomerProfileApi _singleton = CustomerProfileApi._internal();
  CustomerProfileApi._internal();
  static CustomerProfileApi get instance => _singleton;

  Future<CustomerProfileModel> customerProfileApi() async {
    try {
      Response response = await getHttp(Endpoints.customerProfileEndpoint());

      if (response.statusCode == 200) {
        final data = CustomerProfileModel.fromJson(response.data);
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
