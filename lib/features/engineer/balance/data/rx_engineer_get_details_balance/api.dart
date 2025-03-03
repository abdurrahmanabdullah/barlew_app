import 'package:barlew_app/features/engineer/balance/model/engineer_balance_details_model.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class EngineerBalanceDetailsApi {
  static final EngineerBalanceDetailsApi _singleton =
      EngineerBalanceDetailsApi._internal();
  EngineerBalanceDetailsApi._internal();
  static EngineerBalanceDetailsApi get instance => _singleton;

  Future<BalanceDetailsResponseModel> engineerBalanceDetailsApi() async {
    try {
      Response response =
          await getHttp(Endpoints.engineerBalanceDetailsEndpoint());

      if (response.statusCode == 200) {
        final data = BalanceDetailsResponseModel.fromJson(response.data);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
