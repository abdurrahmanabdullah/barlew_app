// import 'package:barlew_app/features/customer/payment_method/model/bank_details_model.dart';
// import 'package:barlew_app/networks/dio/dio.dart';
// import 'package:barlew_app/networks/endpoint.dart';
// import 'package:barlew_app/networks/exception_handler/data_source.dart';
// import 'package:dio/dio.dart';

// final class EngineerGetBankDetailsApi {
//   static final EngineerGetBankDetailsApi _singleton =
//       EngineerGetBankDetailsApi._internal();
//   EngineerGetBankDetailsApi._internal();
//   static EngineerGetBankDetailsApi get instance => _singleton;

//   Future<BankDetailsResponseModel> engineerGetBankDetailsApi() async {
//     try {
//       Response response =
//           await getHttp(Endpoints.engineerGetBankDetailsEndpoint());

//       if (response.statusCode == 200) {
//         final data = BankDetailsResponseModel.fromJson(response.data);
//         return data;
//       } else {
//         throw DataSource.DEFAULT.getFailure();
//       }
//     } catch (error) {
//       rethrow;
//     }
//   }
// }
