
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ImagePickerProvider with ChangeNotifier {
//   List<String> imagePaths2 = []; // To store file paths of selected images
//   List<XFile> pickedFiles2 = [];

//   Future<void> pickMultipleImages2() async {
//     final ImagePicker picker2 = ImagePicker();
//     try {
//       // Try picking multiple images
//       final pickedFiles = await picker2.pickMultiImage();

//       // Check if files were selected
//       if (pickedFiles.isNotEmpty) {
//         // Add the selected files to the list
//         pickedFiles2 = pickedFiles;
//         imagePaths2.addAll(pickedFiles.map((file) => file.path));
//         print(
//             "Images picked: ${pickedFiles.map((file) => file.path).toList()}"); // Debugging line
//       } else {
//         print("No images selected.");
//       }
//       notifyListeners(); // Notify listeners to update the UI
//     } catch (e) {
//       print('Error picking multiple images: $e');
//     }
//   }

//   // Function to remove an image
//   void removeImage(int index) {
//     imagePaths2.removeAt(index);
//     pickedFiles2.removeAt(index); // Ensure both lists are in sync
//     notifyListeners(); // Notify listeners when an image is removed
//   }
// }

// class AvatarImagePickerProvider with ChangeNotifier {
//   List<String> imagePaths3 = []; // To store avatar image file paths
//   List<XFile> pickedFiles3 = [];

//   // Function to pick multiple avatar images
//   Future<void> pickMultipleImages3() async {
//     final ImagePicker picker3 = ImagePicker();
//     try {
//       final pickedFiles = await picker3.pickMultiImage();
//       pickedFiles3 = pickedFiles;
//       imagePaths3.addAll(pickedFiles.map((file) => file.path));
//       notifyListeners(); // Notify listeners when new images are picked
//     } catch (e) {
//       print('Error picking multiple images: $e');
//     }
//   }

//   // Function to remove an avatar image
//   void removeImage(int index) {
//     imagePaths3.removeAt(index);
//     notifyListeners(); // Notify listeners when an image is removed
//   }
// }
