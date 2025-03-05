import 'dart:io';

import 'package:flutter/material.dart';

class EngineerEditProfileProvider with ChangeNotifier {
  // Controllers for text input fields
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController serviceController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();

  final List<File> portfolioImages = [];

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();

    serviceController.dispose();
    aboutController.dispose();
    super.dispose();
  }
}
