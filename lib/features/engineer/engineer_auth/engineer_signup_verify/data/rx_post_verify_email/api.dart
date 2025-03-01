
import 'package:barlew_app/features/engineer/engineer_auth/engineer_signup_verify/model/engineer_signup_otp_verify_model.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

import '../../../../../../networks/dio/dio.dart';

final class PostEngineerSignupOtpVerifyApi {
  static final PostEngineerSignupOtpVerifyApi _singleton =
      PostEngineerSignupOtpVerifyApi._internal();
  PostEngineerSignupOtpVerifyApi._internal();
  static PostEngineerSignupOtpVerifyApi get instance => _singleton;

  Future<EngineerSignupOtpVerifyModel> postEngineerSignupOtpVerifyApi({
    required String email,
    required int otp,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "email": email,
        "otp": otp,
      });

      Response response =
          await postHttp(Endpoints.engineerSignupOtpverifyEndPoint(), data);

      if (response.statusCode == 200) {
        final data = EngineerSignupOtpVerifyModel.fromJson(response.data);
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
