import 'package:barlew_app/features/engineer/personal_information/model/engineer_profile_model.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class EngineerProfileApi {
  static final EngineerProfileApi _singleton = EngineerProfileApi._internal();
  EngineerProfileApi._internal();
  static EngineerProfileApi get instance => _singleton;

  Future<EngineerProfileModel> engineerProfileApi() async {
    try {
      Response response = await getHttp(Endpoints.engineerProfileEndpoint());

      if (response.statusCode == 200) {
        final data = EngineerProfileModel.fromJson(response.data);
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
