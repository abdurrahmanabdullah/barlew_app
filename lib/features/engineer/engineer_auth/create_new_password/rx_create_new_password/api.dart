// import 'dart:convert';

// import 'package:barlew_app/constant/app_constants.dart';
// import 'package:barlew_app/helpers/di.dart';
// import 'package:barlew_app/networks/endpoint.dart';
// import 'package:barlew_app/networks/exception_handler/data_source.dart';
// import 'package:dio/dio.dart';

// import '../../../../../networks/dio/dio.dart';

// final class PostResetPasswordApi {
//   static final PostResetPasswordApi _singleton =
//       PostResetPasswordApi._internal();
//   PostResetPasswordApi._internal();
//   static PostResetPasswordApi get instance => _singleton;

//   Future<Map> postResetPasswordApi({
//     required String email,
//     required String password,
//     required String passwordConfirmation,
//   }) async {
//     try {
//       FormData data = FormData.fromMap({
//         "email": email,
//         "password": password,
//         "password_confirmation": passwordConfirmation,
//       });

//       Response response =
//           await postHttp(Endpoints.chnagePasswordEndPoint(), data);

//       if (response.statusCode == 200) {
//         final data = json.decode(json.encode(response.data));
//         await appData.write(kKeyIsLoggedIn, false);
//         await appData.write(kKeyAccessToken, '');
//         // ToastUtil.showShortToast("Updated Successfully");
//         return data;
//       } else {
//         throw DataSource.DEFAULT.getFailure();
//       }
//     } catch (error) {
//       // Handle generic errors
//       rethrow;
//     }
//   }
// }
////---------------------
import 'dart:convert';
import 'package:barlew_app/networks/dio/dio.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class CustomerResetPassApi {
  static final CustomerResetPassApi _singleton =
      CustomerResetPassApi._internal();
  CustomerResetPassApi._internal();
  static CustomerResetPassApi get instance => _singleton;

  Future<Map> customerResetPassApi({
    required String token,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "token": token,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      });

      Response response =
          await postHttp(Endpoints.customerResetPassEndpoint(), data);

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
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
