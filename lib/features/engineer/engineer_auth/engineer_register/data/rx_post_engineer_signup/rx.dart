// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:developer';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_register/data/rx_post_engineer_signup/api.dart';
import 'package:barlew_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../../helpers/toast.dart';

final class EngineerSignUpRx extends RxResponseInt<Map> {
  final api = EngineerSignUpApi.instance;

  EngineerSignUpRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> engineerSignUpRx({
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
      Map data = await api.engineerSignUpApi(
        firstName: firstName,
        lastName: lastName,
        email: email,
        role: role,
        address: address,
        password: password,
        passwordConfirmation: passwordConfirmation,
        service: service,
        about: about,
        skills: skills,
        portfolio: portfolio,
      );
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(Map data) {
    // appData.write(kKeyAccessToken, data.accessToken);
    // appData.write(kKeyIsLoggedIn, true);
    // String token = appData.read(kKeyAccessToken);
    // DioSingleton.instance.update(token);
    // dataFetcher.sink.add(data);
    return data;
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 400) {
        ToastUtil.showShortToast(error.response!.data["message"]);
      } else {
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    // throw error;
    return false;
  }
}
