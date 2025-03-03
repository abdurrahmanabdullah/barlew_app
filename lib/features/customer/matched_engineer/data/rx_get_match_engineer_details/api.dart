
// library;

// import 'package:barlew_app/features/customer/matched_engineer/model/match_engineer_details_model.dart';
// import 'package:barlew_app/networks/dio/dio.dart';
// import 'package:barlew_app/networks/endpoint.dart';
// import 'package:dio/dio.dart';
// import '../../../../../networks/exception_handler/data_source.dart';

// final class MatchEngineerDetailsApi {
//   static final MatchEngineerDetailsApi _singleton =
//       MatchEngineerDetailsApi._internal();
//   MatchEngineerDetailsApi._internal();
//   static MatchEngineerDetailsApi get instance => _singleton;

//   Future<EngineerDetailsPageModel> matchEngineerDetailsApi() async {
//     try {
//       Response response =
//           await getHttp(Endpoints.engineerMatchDetailsEndpoint());

//       if (response.statusCode == 200) {
//         final data = EngineerDetailsPageModel.fromJson(response.data);
//         return data;
//       } else {
//         throw DataSource.DEFAULT.getFailure();
//       }
//     } catch (error) {
//       // Handle generic errors
//       // throw ErrorHandler.handle(error).failure.responseMessage;
//       rethrow;
//     }
//   }
// }
