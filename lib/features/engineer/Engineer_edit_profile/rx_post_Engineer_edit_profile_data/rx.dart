import 'dart:developer';
import 'package:barlew_app/helpers/toast.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../networks/rx_base.dart';
import 'api.dart';

final class EngineerEditProfileRX extends RxResponseInt<Map> {
  final api = EngineerEditProfileApi.instance;

  EngineerEditProfileRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> engineerEditProfileRX({
    required String firstName,
    required String lastName,
    required String service,
    required String about,
    required List<int> skills,
    required List<XFile> portfolio,
    required XFile avatar,
  }) async {
    try {
      Map data = await api.engineerEditProfileApi(
        firstName: firstName,
        lastName: lastName,
        avatar: avatar,
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
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 400) {
        ToastUtil.showShortToast(error.response!.data["error"]);
      } else {
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    return false;
  }
}
