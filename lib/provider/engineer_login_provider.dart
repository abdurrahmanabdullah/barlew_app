import 'package:flutter/material.dart';

class EngineerLoginProvider with ChangeNotifier {
  ////Login Screen Controller////
  final loginEmailController = TextEditingController();
  final logInPassController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _obscureEngineerPassword = true;
  bool _value = true;
  bool get obscureEngineerPassword => _obscureEngineerPassword;
  bool get value => _value;
  void togglePasswordVisibility() {
    _obscureEngineerPassword = !_obscureEngineerPassword;
    notifyListeners();
  }

  void toggleSaveInfo(bool value) {
    _value = value;
    notifyListeners();
  }

  clearTextField() {
    loginEmailController.clear();
    logInPassController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    loginEmailController.dispose();
    logInPassController.dispose();
    super.dispose();
  }
}
