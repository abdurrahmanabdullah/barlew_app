import 'package:barlew_app/features/customer/questions_page/model/question_model.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class QuestionApi {
  static final QuestionApi _singleton = QuestionApi._internal();
  QuestionApi._internal();
  static QuestionApi get instance => _singleton;

  Future<QuestionModel> questionApi(int id) async {
    try {
      Response response = await getHttp(Endpoints.questionEndpoint(id));

      if (response.statusCode == 200) {
        final data = QuestionModel.fromJson(response.data);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
