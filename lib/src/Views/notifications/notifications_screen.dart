import 'package:agentapp/src/constants/app_colors.dart';
import 'package:agentapp/src/constants/app_strings.dart';
import 'package:agentapp/src/widgets/body_widget.dart';
import 'package:agentapp/src/widgets/custom_appbar.dart';
import 'package:agentapp/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;
    return BodyWidget(
      scafoldBody: Scaffold(
        appBar: CustomAppbar(
          centerTitle: false,
          title: "Notifications",
          showBtn: true,
          showBtnAction: false,
          icon: Icons.person,
        ),
        body: ListView(
          children: [
            SizedBox(height: h * 0.02),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border(
                      left: BorderSide(
                        color: AppColors.primaryColor,
                        width: 5.0,
                      ),
                    ),
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.notifications_active_rounded,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    title: CustomText(
                      title: "Title Notification",
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                    subtitle: CustomText(
                      title: "Description Notification de cette toure",
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.blackColor,
                    ),
                    trailing: CustomText(
                      title: "Il y a 2 jours",
                      fontSize: 10.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.blackColor,
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 14.0),
              itemCount: 10,
            ),
          ],
        ).paddingSymmetric(horizontal: AppString.horizontalPadding),
      ),
    );
  }
}
