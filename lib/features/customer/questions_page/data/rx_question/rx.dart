// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, body_might_complete_normally_nullable

import 'dart:developer';

import 'package:barlew_app/features/customer/questions_page/data/rx_question/api.dart';
import 'package:barlew_app/features/customer/questions_page/model/question_model.dart';

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../helpers/toast.dart';

class QuestionRX {
  final api = QuestionApi.instance;
  final _dataFetcher =
      BehaviorSubject<QuestionModel?>(); // Change to BehaviorSubject

  ValueStream<QuestionModel?> get customerProfileStream => _dataFetcher.stream;

  QuestionRX();

  Future<QuestionModel?> questionRX(int id) async {
    try {
      final QuestionModel data = await api.questionApi(id);
      _dataFetcher.sink.add(data); // Add data to the stream
      return data;
    } catch (error) {
      handleErrorWithReturn(error);
      return null;
    }
  }

  // Error handling
  void handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response?.statusCode == 422) {
        ToastUtil.showShortToast(error.response?.data["message"]);
      } else {
        ToastUtil.showShortToast(error.response?.data["message"]);
      }
    }
    log(error.toString());
    _dataFetcher.sink.addError(error); // Add error to the stream
  }

  // Close the stream when it's no longer needed
  void dispose() {
    _dataFetcher.close();
  }
}
