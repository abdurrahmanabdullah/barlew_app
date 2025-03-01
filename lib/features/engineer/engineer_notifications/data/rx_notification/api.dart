import 'package:barlew_app/features/engineer/engineer_notifications/model/notification_model.dart';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';
import '../../../../../../../networks/exception_handler/data_source.dart';

final class NotificationApi {
  static final NotificationApi _singleton = NotificationApi._internal();
  NotificationApi._internal();
  static NotificationApi get instance => _singleton;

  Future<NotificationModel> notificationApi() async {
    try {
      Response response = await getHttp(Endpoints.notificationEndpoint());

      if (response.statusCode == 200) {
        final data = NotificationModel.fromJson(response.data);
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
