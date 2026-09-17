import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageAndCommentController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  // final List<File> selectedImages = <File>[];
  final TextEditingController commentController = TextEditingController();

  final int maxImages = 10;

  Future<XFile?> compressImage(XFile file) async {
    final String targetPath = "${file.path}_compressed.jpg";

    var result = await FlutterImageCompress.compressAndGetFile(
      file.path,
      targetPath,
      quality: 70,
    );

    return result != null ? XFile(result.path) : null;
  }

  List<XFile> selectedImages = [];

  Future<void> selectedImagesBySource({required ImageSource source}) async {
    try {
      log("image open");
      XFile? result = await ImagePicker().pickImage(source: source);

      if (result != null) {
        XFile? compressed = await compressImage(result);
        if (compressed != null) {
          selectedImages.add(compressed);
          update();
        }
      }
    } catch (e) {
      log("Error taking photo: $e");
    }
  }

  // Future<void> takePhotoFromCamera() async {
  //   try {
  //     if (selectedImages.length >= maxImages) {
  //       log("Vous pouvez ajouter maximum $maxImages photos.");
  //       return;
  //     }

  //     final XFile? image = await _picker.pickImage(
  //       source: ImageSource.camera,
  //       imageQuality: 85,
  //     );

  //     if (image != null) {
  //       selectedImages.add(File(image.path));
  //       update();
  //     }
  //   } catch (e) {
  //     log("error catch take photo from camera $e");
  //   }
  // }

  // Future<void> pickFromGallery() async {
  //   try {
  //     if (selectedImages.length >= maxImages) {
  //       log("Vous pouvez ajouter maximum $maxImages photos.");
  //       return;
  //     }

  //     final List<XFile> images = await _picker.pickMultiImage(
  //       imageQuality: 85,
  //     );

  //     if (images.isEmpty) {
  //       return;
  //     }

  //     final remainingSlots = maxImages - selectedImages.length;

  //     final imagesToAdd = images.take(remainingSlots);

  //     selectedImages.addAll(
  //       imagesToAdd.map(
  //         (image) => File(image.path),
  //       ),
  //     );
  //     update();

  //     if (images.length > remainingSlots) {
  //       log("Vous pouvez ajouter maximum $maxImages photos.");
  //     }
  //   } catch (e) {
  //     log("error catch pick from gallery $e");
  //   }
  // }

  void removeImage(int index) {
    selectedImages.removeAt(index);
    update();
  }

  @override
  void onClose() {
    commentController.dispose();
    super.onClose();
  }
}
