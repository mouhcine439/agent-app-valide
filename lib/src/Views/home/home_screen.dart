import 'package:agentapp/src/Controllers/initial_controller.dart';
import 'package:agentapp/src/Views/home/widgets/custom_appbar_home.dart';
import 'package:agentapp/src/Views/home/widgets/custom_card_home.dart';
import 'package:agentapp/src/constants/app_colors.dart';
import 'package:agentapp/src/constants/app_strings.dart';
import 'package:agentapp/src/helper/app_buttom_sheet.dart';
import 'package:agentapp/src/routes/name_routes.dart';
import 'package:agentapp/src/widgets/body_widget.dart';
import 'package:agentapp/src/widgets/custom_header_sheet.dart';
import 'package:agentapp/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;
    final InitialController initialController = Get.find();
    return BodyWidget(
      scafoldBody: Scaffold(
        appBar: CustomAppbarHome(
          title: "Agent app V1",
          onTapProfile: () => Get.toNamed(NameRoutes.profileScreen),
          onTapNotification: () => Get.toNamed(NameRoutes.notificationsScreen),
        ),
        body: Obx(
          () => initialController.isUserHasInternet.value
              ? Column(
                  children: [
                    SizedBox(height: h * 0.02),
                    // status tours cars
                    Card(
                      margin: EdgeInsets.zero,
                      color: AppColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                          color: AppColors.greyColor.withValues(alpha: 0.3),
                        ),
                      ),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          spacing: 6.0,
                          children: [
                            Expanded(
                              child: CustomCardHome(
                                color: AppColors.valideColor,
                                secondTitle: "10",
                                title: "Terminée",
                              ),
                            ),
                            Expanded(
                              child: CustomCardHome(
                                color: AppColors.orangeColor,
                                secondTitle: "55",
                                title: "En Cours",
                              ),
                            ),
                            Expanded(
                              child: CustomCardHome(
                                color: AppColors.errorColor,
                                secondTitle: "2",
                                title: "Annuléé",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 14.0),

                    // list tours
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12.0),
                                  ),
                                  color: AppColors.whiteColor,
                                  border: Border.all(
                                    color: AppColors.greyColor
                                        .withValues(alpha: 0.3),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 20.0,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryColor
                                              .withValues(alpha: 0.2),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Icon(
                                          Icons.tour_sharp,
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          spacing: 6.0,
                                          children: [
                                            CustomText(
                                              title: "Site Casablanca - Siége",
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.blackColor,
                                            ),
                                            CustomText(
                                              title: "Agence Casablanca",
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.normal,
                                              color: AppColors.blackColor,
                                            ),
                                            Row(
                                              spacing: 6.0,
                                              children: [
                                                Icon(
                                                  Icons.calendar_month,
                                                  color: AppColors.blackColor,
                                                  size: 18.0,
                                                ),
                                                CustomText(
                                                  title: "08:00 - 12:00",
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.normal,
                                                  color: AppColors.blackColor,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Card(
                                        margin: EdgeInsets.zero,
                                        elevation: 0.0,
                                        color: AppColors.valideColor
                                            .withValues(alpha: 0.2),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            spacing: 4.0,
                                            children: [
                                              Icon(
                                                Icons.check_circle,
                                                color: AppColors.valideColor,
                                                size: 18.0,
                                              ),
                                              CustomText(
                                                title: "Terminée",
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.normal,
                                                color: AppColors.valideColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        AppButtomSheet.showButtomSheet(
                                          child: SizedBox(
                                            width: w,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CustomHeaderSheet(
                                                  title: "Détails",
                                                  onTap: () => Get.back(),
                                                ).paddingAll(AppString
                                                    .horizontalPadding),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    width: w,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: AppColors
                                                          .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    margin: EdgeInsets.symmetric(
                                                        horizontal: AppString
                                                            .horizontalPadding),
                                                    alignment: Alignment.center,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      spacing: 8.0,
                                                      children: [
                                                        CustomText(
                                                          title: "Commencer",
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: AppColors
                                                              .whiteColor,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .arrow_circle_right_sharp,
                                                          color: AppColors
                                                              .whiteColor,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10.0),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: w,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: AppColors.greyColor
                                              .withValues(alpha: 0.5),
                                          borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(12.0),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          spacing: 8.0,
                                          children: [
                                            CustomText(
                                              title: "Détails",
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal,
                                              color: AppColors.blackColor,
                                            ),
                                            Icon(
                                              Icons.remove_red_eye,
                                              color: AppColors.blackColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: w,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(12.0),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        spacing: 8.0,
                                        children: [
                                          CustomText(
                                            title: "Commencer",
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.whiteColor,
                                          ),
                                          Icon(
                                            Icons.arrow_circle_right_sharp,
                                            color: AppColors.whiteColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: 14.0),
                        itemCount: 10,
                      ),
                    ),
                    SizedBox(height: h * 0.02),
                  ],
                ).paddingSymmetric(horizontal: AppString.horizontalPadding)
              : ListView(
                  children: [
                    Center(
                      child: CustomText(
                        title: "Connection offline",
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
