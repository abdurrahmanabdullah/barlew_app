import 'dart:convert';
import 'dart:io';

import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../networks/dio/dio.dart';

final class PostProfilePicUpdateApi {
  static final PostProfilePicUpdateApi _singleton =
      PostProfilePicUpdateApi._internal();
  PostProfilePicUpdateApi._internal();
  static PostProfilePicUpdateApi get instance => _singleton;

  Future<Map> postProfilePicUpdateApi({
    required XFile avatar,
  }) async {
    try {
      FormData data = FormData.fromMap({});
      if (await File(avatar.path).exists()) {
        data.files
            .add(MapEntry('avatar', await MultipartFile.fromFile(avatar.path)));
      }
      Response response =
          await postHttp(Endpoints.engineerProfileUpdateEndpoint(), data);

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        ToastUtil.showShortToast("Profile Updated Successfully");
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
