import 'dart:convert';
import 'dart:io';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../../helpers/toast.dart';
import '../../../../../../../networks/dio/dio.dart';
import '../../../../../../../networks/exception_handler/data_source.dart';

final class EngineerSignUpApi {
  static final EngineerSignUpApi _singleton = EngineerSignUpApi._internal();
  EngineerSignUpApi._internal();
  static EngineerSignUpApi get instance => _singleton;

  Future<Map> engineerSignUpApi({
    required String firstName,
    required String lastName,
    required String email,
    required String role,
    required String address,
    required String password,
    required String passwordConfirmation,
    required String service,
    required String about,
    required List<int> skills,
    required List<XFile> portfolio,
  }) async {
    try {
      Map<String, dynamic> mapData = {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "role": role,
        "address": address,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "service": service,
        "about": about,
      };
      // Dynamically add selected skills to the request
      for (int i = 0; i < skills.length; i++) {
        mapData["skills[$i]"] = skills[i];
      }

      // Dynamically add selected skills to the request
      // for (int i = 0; i < level.length; i++) {
      //   mapData["level[$i]"] = level[i];
      // }
      FormData data = FormData.fromMap(mapData);

      // Add photos to FormData if available
      if (portfolio.isNotEmpty) {
        for (XFile photo in portfolio) {
          if (await File(photo.path).exists()) {
            data.files.add(
              MapEntry(
                'portfolio[]', // Key for photos
                await MultipartFile.fromFile(photo.path),
              ),
            );
          }
        }
      }

      Response response = await postHttp(Endpoints.signUpEndpoint(), data);

      if (response.statusCode == 201) {
        final data = json.decode(json.encode(response.data));
        ToastUtil.showShortToast("Sign Up Successful");
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
