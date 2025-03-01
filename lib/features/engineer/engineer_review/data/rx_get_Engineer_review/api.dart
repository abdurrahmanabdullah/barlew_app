import 'package:barlew_app/features/engineer/engineer_review/model/engineer_review_model.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class EngineerReviewApi {
  static final EngineerReviewApi _singleton = EngineerReviewApi._internal();
  EngineerReviewApi._internal();
  static EngineerReviewApi get instance => _singleton;

  Future<EngineerReviewModel> engineerReviewApi() async {
    try {
      Response response = await getHttp(Endpoints.engineerReviewEndpoint());

      if (response.statusCode == 200) {
        final data = EngineerReviewModel.fromJson(response.data);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
