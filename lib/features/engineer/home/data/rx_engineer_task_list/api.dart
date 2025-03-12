import 'package:barlew_app/features/engineer/home/model/engineer_task_list_model.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class EngineerTaskListApi {
  static final EngineerTaskListApi _singleton = EngineerTaskListApi._internal();
  EngineerTaskListApi._internal();
  static EngineerTaskListApi get instance => _singleton;

  Future<EngineerTaskResponseModel> engineerTaskListApi(String endPart) async {
    try {
      Response response =
          await getHttp(Endpoints.engineeTaskListEndpoint(endPart: endPart));

      if (response.statusCode == 200) {
        final data = EngineerTaskResponseModel.fromJson(response.data);
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
