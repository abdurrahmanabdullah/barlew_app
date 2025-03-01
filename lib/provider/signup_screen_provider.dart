import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreenProvider with ChangeNotifier {
  // Controllers for text input fields
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController serviceController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();

// Portfolio
  final List<File> portfolioImages = []; // List to hold portfolio image files

  ///password visibility toggle
  bool _obscurePassword = true;
  bool _confirmObscurePassword = true;
  // Getter methods for password visibility
  bool get obscurePassword => _obscurePassword;
  bool get confirmObscurePassword => _confirmObscurePassword;

  // Toggle password visibility
  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _confirmObscurePassword = !_confirmObscurePassword;
    notifyListeners();
  }

  // Method to pick multiple images
  Future<void> pickPortfolioImages() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    for (var file in pickedFiles) {
      portfolioImages.add(File(file.path));
    }
    notifyListeners();
  }

  void removePortfolioImage(int index) {
    portfolioImages.removeAt(index);
    notifyListeners();
  }

  // Function to add or remove skill from selected list

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    serviceController.dispose();
    aboutController.dispose();
    super.dispose();
  }
}
