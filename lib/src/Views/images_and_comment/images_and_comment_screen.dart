import 'dart:io';

import 'package:agentapp/src/Controllers/images_and_comment/images_and_comment_controller.dart';
import 'package:agentapp/src/Views/images_and_comment/widgets/custom_selected_image.dart';
import 'package:agentapp/src/constants/app_colors.dart';
import 'package:agentapp/src/constants/app_strings.dart';
import 'package:agentapp/src/helper/app_buttom_sheet.dart';
import 'package:agentapp/src/widgets/body_widget.dart';
import 'package:agentapp/src/widgets/custom_appbar.dart';
import 'package:agentapp/src/widgets/custom_button.dart';
import 'package:agentapp/src/widgets/custom_header_sheet.dart';
import 'package:agentapp/src/widgets/custom_long_input.dart';
import 'package:agentapp/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagesAndCommentScreen extends StatelessWidget {
  const ImagesAndCommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;
    final ImageAndCommentController imageAndCommentController =
        Get.put(ImageAndCommentController());
    return BodyWidget(
      scafoldBody: Scaffold(
        appBar: CustomAppbar(
          title: "Ajouter des photos",
          showBtn: true,
          showBtnAction: false,
          centerTitle: false,
          icon: Icons.person,
        ),
        body: ListView(
          children: [
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                AppButtomSheet.showButtomSheet(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 6.0,
                    children: [
                      CustomHeaderSheet(
                        title: "Ajouter des photos",
                        onTap: () {},
                      ).paddingAll(AppString.horizontalPadding),
                      CustomSelectedImage(
                        title: "Camera",
                        icon: Icons.camera_alt_outlined,
                        onTap: () {
                          Get.back();
                          imageAndCommentController.selectedImagesBySource(
                              source: ImageSource.camera);
                        },
                      ).paddingSymmetric(
                          horizontal: AppString.horizontalPadding),
                      CustomSelectedImage(
                        title: "Galerie",
                        icon: Icons.image_outlined,
                        onTap: () {
                          Get.back();
                          imageAndCommentController.selectedImagesBySource(
                              source: ImageSource.gallery);
                        },
                      ).paddingSymmetric(
                          horizontal: AppString.horizontalPadding),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                width: w,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: AppColors.greyColor.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.primaryColor,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomText(
                      title: "Ajouter des photos",
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(height: 7),
                    CustomText(
                      title:
                          "Prenez une photo ou choisissez\ndans votre galerie",
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.blackColor,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6.0),
            GetBuilder<ImageAndCommentController>(
              builder: (_) {
                if (imageAndCommentController.selectedImages.isEmpty) {
                  return SizedBox.shrink();
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8.0,
                    children: [
                      const SizedBox(height: 15),
                      CustomText(
                        title:
                            'Vos photos (${imageAndCommentController.selectedImages.length})',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                      SizedBox(
                        height: 105,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount:
                              imageAndCommentController.selectedImages.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(width: 12),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.file(
                                      File(imageAndCommentController
                                          .selectedImages[index].path),
                                      width: 105,
                                      height: 105,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  // Delete button
                                  Positioned(
                                    top: -6,
                                    right: -6,
                                    child: GestureDetector(
                                      onTap: () => imageAndCommentController
                                          .removeImage(index),
                                      child: Container(
                                        width: 28,
                                        height: 28,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff263238),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
            const SizedBox(height: 10.0),
            CustomLongInput(
              myController: imageAndCommentController.commentController,
              maxLines: 4,
              hint: 'Écrivez votre commentaire ici...',
              icon: Icons.chat_bubble_outline_rounded,
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {},
              bgColorButton: AppColors.primaryColor,
              title: "Envoyer",
              colorText: AppColors.whiteColor,
            ),
          ],
        ).paddingSymmetric(horizontal: AppString.horizontalPadding),
      ),
    );
  }
}
