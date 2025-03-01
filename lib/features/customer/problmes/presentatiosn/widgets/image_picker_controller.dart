// ignore_for_file: avoid_print

// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class ImagePickerController extends GetxController {
//   RxList<String> imagePaths =
//       <String>[].obs; // To store file paths of selected images
//   List<XFile> pickedFiles = [];

//   // Function to pick multiple images
//   Future<void> pickMultipleImages() async {
//     final ImagePicker picker = ImagePicker();
//     try {
//       List<XFile> pickedFiles = await picker.pickMultiImage();
//       imagePaths.addAll(pickedFiles.map((file) => file.path));
//     } catch (e) {
//       print('Error picking multiple images: $e');
//     }
//   }

//   // Function to remove an image
//   void removeImage(int index) {
//     imagePaths.removeAt(index);
//   }
// }

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  RxList<String> imagePaths =
      <String>[].obs; // Stores file paths of selected images
  RxList<XFile> pickedFiles = <XFile>[].obs; // Stores selected image files

  // Function to pick multiple images
  Future<void> pickMultipleImages() async {
    final ImagePicker picker = ImagePicker();
    try {
      List<XFile> newFiles = await picker.pickMultiImage();

      if (newFiles.isNotEmpty) {
        pickedFiles.addAll(newFiles);
        imagePaths.addAll(newFiles.map((file) => file.path));
      }
    } catch (e) {
      print('Error picking multiple images: $e');
    }
  }

  // Function to remove an image
  void removeImage(int index) {
    if (index < pickedFiles.length) {
      pickedFiles.removeAt(index);
      imagePaths.removeAt(index);
    }
  }
}
