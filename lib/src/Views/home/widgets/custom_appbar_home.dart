import 'package:agentapp/src/constants/app_colors.dart';
import 'package:agentapp/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomAppbarHome extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbarHome({
    super.key,
    required this.title,
    this.onTapProfile,
    this.onTapNotification,
  });
  final String title;
  final void Function()? onTapProfile, onTapNotification;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
      surfaceTintColor: AppColors.primaryColor,
      // leading: showBtn
      //     ? IconButton(
      //         onPressed: () {
      //           Get.back();
      //         },
      //         icon: Container(
      //           padding: EdgeInsets.all(6.0),
      //           decoration: BoxDecoration(
      //             color: AppColors.whiteColor,
      //             borderRadius: BorderRadius.circular(6.0),
      //           ),
      //           // backgroundColor: AppColors.whiteColor,
      //           child: const Icon(
      //             Icons.arrow_back_rounded,
      //             color: AppColors.primaryColor,
      //             size: 25,
      //           ),
      //         ),
      //       )
      //     : null,
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

      centerTitle: true,
      // bottom: PreferredSize(
      //   preferredSize: const Size.fromHeight(1.0),
      //   child: Container(
      //     color: AppColors.primaryColor,
      //     height: 1,
      //   ),
      // ),
      actions: [
        // showBtn == true
        // ?
        GestureDetector(
          onTap: onTapNotification,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(6.0),
            ),
            width: 40,
            margin: EdgeInsets.symmetric(
              // horizontal: 12,
              vertical: 10,
            ),
            child: const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.notifications_active_rounded,
                color: AppColors.primaryColor,
                size: 22,
              ),
            ),
          ),
        ),
        //     : const SizedBox.shrink(),
        GestureDetector(
          onTap: onTapProfile,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(6.0),
            ),
            width: 40,
            margin: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 10,
            ),
            child: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.person,
                color: AppColors.primaryColor,
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
