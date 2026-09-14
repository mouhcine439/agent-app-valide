import 'package:agentapp/src/Controllers/initial_controller.dart';
import 'package:agentapp/src/Views/qrcode_and_nfc/qrcode_and_nfc_screen.dart';
import 'package:agentapp/src/constants/app_colors.dart';
import 'package:agentapp/src/routes/app_routes.dart';
import 'package:agentapp/src/routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(InitialController());
      }),
      defaultTransition: Transition.rightToLeftWithFade,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: AppColors.bgColor,
      ),
      initialRoute: NameRoutes.splashScreen,
      home: const QrcodeAndNfcScreen(),
      getPages: AppRoutes.pages,
    );
  }
}
