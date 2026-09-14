import 'package:agentapp/src/constants/app_colors.dart';
import 'package:agentapp/src/constants/app_strings.dart';
import 'package:agentapp/src/widgets/body_widget.dart';
import 'package:agentapp/src/widgets/custom_appbar.dart';
import 'package:agentapp/src/widgets/custom_long_input.dart';
import 'package:agentapp/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrcodeAndNfcScreen extends StatelessWidget {
  const QrcodeAndNfcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;
    return BodyWidget(
      scafoldBody: Scaffold(
        appBar: CustomAppbar(
          title: "Qr Code / Nfc",
          showBtn: true,
          showBtnAction: false,
          centerTitle: false,
          icon: Icons.person,
        ),
        body: Column(
          children: [
            SizedBox(height: h * 0.02),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.location_on,
                  color: AppColors.primaryColor,
                ),
              ),
              title: CustomText(
                title: "Point de Controle",
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
              subtitle: CustomText(
                title: "Site : Casablanca",
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: AppColors.blackColor,
              ),
              trailing: Card(
                margin: EdgeInsets.zero,
                elevation: 0.0,
                color: AppColors.valideColor.withValues(alpha: 0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    spacing: 4.0,
                    mainAxisSize: MainAxisSize.min,
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
            ),

            SizedBox(height: 30.0),
            // code qr
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: w,
                child: Card(
                  margin: EdgeInsets.zero,
                  elevation: 0.0,
                  color: AppColors.primaryColor.withValues(alpha: 0.05),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(
                      color: AppColors.primaryColor.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 15.0,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color:
                                AppColors.primaryColor.withValues(alpha: 0.3),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.qr_code,
                            color: AppColors.primaryColor,
                            size: 35.0,
                          ),
                        ),
                        CustomText(
                          title: "Code QR",
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                        CustomText(
                          title:
                              "Scanner le QR Code du point de controle pour démarrer la vérification",
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: AppColors.blackColor,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            // nfc
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: w,
                child: Card(
                  margin: EdgeInsets.zero,
                  elevation: 0.0,
                  color: AppColors.valideColor.withValues(alpha: 0.05),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(
                      color: AppColors.valideColor.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 15.0,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: AppColors.valideColor.withValues(alpha: 0.3),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.nfc,
                            color: AppColors.valideColor,
                            size: 35.0,
                          ),
                        ),
                        CustomText(
                          title: "NFC",
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                        CustomText(
                          title:
                              "Approcher votre appareil NFC pour identifiez le point de controle",
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: AppColors.blackColor,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: AppString.horizontalPadding),
      ),
    );
  }
}
