import 'package:agentapp/src/constants/app_colors.dart';
import 'package:agentapp/src/constants/app_strings.dart';
import 'package:agentapp/src/widgets/body_widget.dart';
import 'package:agentapp/src/widgets/custom_appbar.dart';
import 'package:agentapp/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;
    return BodyWidget(
      scafoldBody: Scaffold(
        appBar: CustomAppbar(
          title: "Questions Controle",
          showBtn: true,
          showBtnAction: false,
          centerTitle: false,
          icon: Icons.person,
        ),
        body: ListView(
          children: [
            SizedBox(height: h * 0.02),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Card(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Flexible(
                          child: CustomText(
                            title: "Hello agent app check please cettre zone ?",
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            color: AppColors.blackColor,
                          ),
                        ),
                        Row(
                          spacing: 6.0,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: AppColors.errorColor
                                      .withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.close_rounded,
                                  color: AppColors.errorColor,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: AppColors.valideColor
                                      .withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.check_rounded,
                                  color: AppColors.valideColor,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 6),
              itemCount: 10,
            ),
            SizedBox(height: h * 0.10),
          ],
        ).paddingSymmetric(horizontal: AppString.horizontalPadding),
      ),
    );
  }
}
