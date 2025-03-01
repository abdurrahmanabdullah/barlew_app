import 'package:barlew_app/features/engineer/engineer_average_review/model/engineer_average_review_model.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class EngineerAverageReviewApi {
  static final EngineerAverageReviewApi _singleton =
      EngineerAverageReviewApi._internal();
  EngineerAverageReviewApi._internal();
  static EngineerAverageReviewApi get instance => _singleton;

  Future<EngineerAverageReviewModel> engineerAverageReviewApi() async {
    try {
      Response response =
          await getHttp(Endpoints.engineerAverageReviewEndpoint());

      if (response.statusCode == 200) {
        final data = EngineerAverageReviewModel.fromJson(response.data);
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
