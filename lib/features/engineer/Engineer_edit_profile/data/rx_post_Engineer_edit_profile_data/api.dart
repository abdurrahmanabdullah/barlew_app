import 'dart:convert';
import 'dart:io';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../networks/dio/dio.dart';

final class EngineerEditProfileApi {
  static final EngineerEditProfileApi _singleton =
      EngineerEditProfileApi._internal();
  EngineerEditProfileApi._internal();
  static EngineerEditProfileApi get instance => _singleton;

  Future<Map> engineerEditProfileApi({
    required String firstName,
    required String lastName,
    required String service,
    required String about,
    required List<int> skills,
    required XFile avatar,
    required List<XFile> portfolio,
  }) async {
    try {
      // Initialize FormData to hold the request data.
      FormData data = FormData.fromMap({
        "first_name": firstName,
        "last_name": lastName,
        "service": service,
        "about": about,
        "avatar": avatar,
      });

      // Append skills as an array
      for (int i = 0; i < skills.length; i++) {
        data.fields.add(MapEntry("skills[$i]", skills[i].toString()));
      }

      // Add avatar file if present
      if (await File(avatar.path).exists()) {
        data.files.add(
          MapEntry(
            'avatar',
            await MultipartFile.fromFile(avatar.path),
          ),
        );
      }

//// portfolio data -------------

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
      // Send the HTTP POST request
      Response response =
          await postHttp(Endpoints.engineerProfileUpdateEndpoint(), data);

      // Check if the response is successful
      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        ToastUtil.showShortToast("Profile Updated Successfully");
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle errors
      rethrow;
    }
  }
}
