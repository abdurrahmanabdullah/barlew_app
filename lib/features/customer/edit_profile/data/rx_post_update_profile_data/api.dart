import 'dart:convert';
import 'dart:io';
import 'package:barlew_app/helpers/toast.dart';
import 'package:barlew_app/networks/endpoint.dart';
import 'package:barlew_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../networks/dio/dio.dart';

final class CustomerEditProfileApi {
  static final CustomerEditProfileApi _singleton =
      CustomerEditProfileApi._internal();
  CustomerEditProfileApi._internal();
  static CustomerEditProfileApi get instance => _singleton;

  Future<Map> customerEditProfileApi({
    required String firstName,
    required String lastName,
    required String address,
    required XFile avatar,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "first_name":firstName,
        "last_name":lastName,
        "address":address,
        "avatar":avatar,
      });
      if (await File(avatar.path).exists()) {
        data.files
            .add(MapEntry('avatar', await MultipartFile.fromFile(avatar.path)));
      }
      Response response =
          await postHttp(Endpoints.customerEditProfileEndpoint(), data);

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
