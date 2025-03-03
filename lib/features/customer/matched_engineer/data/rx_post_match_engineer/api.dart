// // ignore_for_file: unused_import

// import 'dart:convert';

// import 'package:barlew_app/features/customer/matched_engineer/model/match_engineer_model.dart';
// import 'package:barlew_app/features/engineer/engineer_auth/engineer_login/model/engineer_login_response_model.dart';
// import 'package:barlew_app/helpers/toast.dart';
// import 'package:barlew_app/networks/dio/dio.dart';
// import 'package:barlew_app/networks/endpoint.dart';
// import 'package:barlew_app/networks/exception_handler/data_source.dart';
// import 'package:dio/dio.dart';

// final class EngineerMatchApi {
//   static final EngineerMatchApi _singleton = EngineerMatchApi._internal();
//   EngineerMatchApi._internal();
//   static EngineerMatchApi get instance => _singleton;

//   Future<MatchEngineerResponseModel> engineerMatchApi({
//     required List<int> skillList,
//   }) async {
//     try {
//       Map<String, dynamic> data = {
//         "skills": skillList,
//       };

//       Response response =
//           await postHttp(Endpoints.engineerMatchEndpoint(), data);

//       if (response.statusCode == 200) {
//         return MatchEngineerResponseModel.fromJson(response.data);
//       } else {
//         throw DataSource.DEFAULT.getFailure();
//       }
//     } catch (error) {
//       throw error; // Allow error to be handled at a higher level
//     }
//   }
// }
