import 'package:flutter/material.dart';

class EngineerAuthProvider with ChangeNotifier {
  ////Login Screen Controller////
  final loginEmailController = TextEditingController();
  final logInPassController = TextEditingController();

  clearTextField() {
    loginEmailController.clear();
    logInPassController.clear();
  }

  @override
  void dispose() {
    loginEmailController.dispose();
    logInPassController.dispose();
    super.dispose();
  }
}
