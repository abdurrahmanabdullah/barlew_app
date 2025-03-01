import 'dart:convert';
import 'dart:io';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../helpers/toast.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../../../networks/exception_handler/data_source.dart';

final class SubmitProblemApi {
  static final SubmitProblemApi _singleton = SubmitProblemApi._internal();
  SubmitProblemApi._internal();
  static SubmitProblemApi get instance => _singleton;

  Future<Map> submitProblemApi({
    required int serviceId,
    required String description,
    required List<int> questionId,
    required List<int> answerId,
    required List<XFile> images,
  }) async {
    try {
      Map<String, dynamic> mapData = {
        "service_id": serviceId,
        "description": description,
        "question_id[]": questionId,
        "answer_id[][]": answerId
      };

      FormData data = FormData.fromMap(mapData);

      // Add photos to FormData if available
      if (images.isNotEmpty) {
        for (XFile photo in images) {
          if (await File(photo.path).exists()) {
            data.files.add(
              MapEntry(
                'images[]', // Key for photos
                await MultipartFile.fromFile(photo.path),
              ),
            );
          }
        }
      }

      Response response = await postHttp(Endpoints.userAnswerEndpoint(), data);

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        ToastUtil.showShortToast("Submit Answer  Successful");
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
