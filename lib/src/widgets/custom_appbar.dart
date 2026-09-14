import 'package:agentapp/src/constants/app_colors.dart';
import 'package:agentapp/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.showBtn,
    this.onTap,
    this.onTapButton,
    required this.showBtnAction,
    required this.centerTitle,
    required this.icon,
  });
  final String title;
  final bool showBtn, centerTitle, showBtnAction;
  final void Function()? onTap;
  final void Function()? onTapButton;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
      surfaceTintColor: AppColors.primaryColor,
      leading: showBtn
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                // backgroundColor: AppColors.whiteColor,
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: AppColors.primaryColor,
                  size: 25,
                ),
              ),
            )
          : null,
      title: CustomText(
        title: title,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: AppColors.whiteColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12.0),
        ),
      ),

      centerTitle: centerTitle,
      // bottom: PreferredSize(
      //   preferredSize: const Size.fromHeight(1.0),
      //   child: Container(
      //     color: AppColors.primaryColor,
      //     height: 1,
      //   ),
      // ),
      actions: [
        // showBtn == true
        //     ? GestureDetector(
        //         onTap: onTap,
        //         child: Container(
        //           decoration: const BoxDecoration(
        //             color: AppColor.primaryColor,
        //             shape: BoxShape.circle,
        //           ),
        //           margin: EdgeInsets.symmetric(
        //             horizontal: MediaQuery.of(context).size.width * 0.015,
        //             vertical: MediaQuery.of(context).size.height * 0.008,
        //           ),
        //           child: const IconButton(
        //             onPressed: null,
        //             icon: Icon(
        //               Iconsax.add,
        //               color: AppColor.whiteColor,
        //               size: 25,
        //             ),
        //           ),
        //         ),
        //       )
        //     : const SizedBox.shrink(),
        showBtnAction == true
            ? GestureDetector(
                onTap: onTapButton,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  width: 40,
                  margin: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      icon,
                      color: AppColors.primaryColor,
                      size: 22,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
