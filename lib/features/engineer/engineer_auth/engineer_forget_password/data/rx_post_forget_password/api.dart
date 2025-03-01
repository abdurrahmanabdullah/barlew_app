import 'dart:convert';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class PostSendOTPApi {
  static final PostSendOTPApi _singleton = PostSendOTPApi._internal();
  PostSendOTPApi._internal();
  static PostSendOTPApi get instance => _singleton;

  Future<Map> postSendOTPApi({
    required String email,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "email": email,
      });

      Response response =
          await postHttp(Endpoints.forgetpasswordotpEndpoint(), data);

      if (response.statusCode == 201) {
        final data = json.decode(json.encode(response.data));
        // ToastUtil.showShortToast("Updated Successfully");
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      rethrow;
    }
  }
}


// ForgetPasswordSendOTPRx