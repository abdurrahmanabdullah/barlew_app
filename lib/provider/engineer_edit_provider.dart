import 'dart:io';

import 'package:flutter/material.dart';

class EngineerEditProfileProvider with ChangeNotifier {
  // Controllers for text input fields
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController serviceController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();

  final List<File> portfolioImages = [];
  String _profileImageUrl = '';

  String get profileImageUrl => _profileImageUrl;
  void updateProfileImage(String newUrl) {
    _profileImageUrl = newUrl;
    notifyListeners(); // Notify UI to refresh
  }

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();

    serviceController.dispose();
    aboutController.dispose();
    super.dispose();
  }
}
