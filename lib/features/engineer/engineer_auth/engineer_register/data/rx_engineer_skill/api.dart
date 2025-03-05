import 'package:barlew_app/features/engineer/engineer_auth/engineer_register/model/engineer_skill_model.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class EngineerSkillApi {
  static final EngineerSkillApi _singleton = EngineerSkillApi._internal();
  EngineerSkillApi._internal();
  static EngineerSkillApi get instance => _singleton;

  Future<Engineerskillmodel> engineerskillApi() async {
    try {
      Response response = await getHttp(Endpoints.engineerskillEndpoint());

      if (response.statusCode == 200) {
        final data = Engineerskillmodel.fromJson(response.data);
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
