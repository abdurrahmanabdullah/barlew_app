import 'package:barlew_app/features/engineer/engineer_auth/engineer_register/model/engineer_lavel_model.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class EngineerLavelApi {
  static final EngineerLavelApi _singleton = EngineerLavelApi._internal();
  EngineerLavelApi._internal();
  static EngineerLavelApi get instance => _singleton;

  Future<engineerlavelmodel> engineerlavelApi() async {
    try {
      Response response = await getHttp(Endpoints.engineerlavelEndpoint());

      if (response.statusCode == 200) {
        final data = engineerlavelmodel.fromJson(response.data);
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
