import 'package:agentapp/src/Views/home/home_screen.dart';
import 'package:agentapp/src/Views/notifications/notifications_screen.dart';
import 'package:agentapp/src/Views/profile/profile_screen.dart';
import 'package:agentapp/src/Views/qrcode_and_nfc/qrcode_and_nfc_screen.dart';
import 'package:agentapp/src/Views/splash_screen.dart';
import 'package:agentapp/src/routes/name_routes.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: NameRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: NameRoutes.profileScreen,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: NameRoutes.homeScreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: NameRoutes.qrcodeAndNfcScreen,
      page: () => const QrcodeAndNfcScreen(),
    ),
    GetPage(
      name: NameRoutes.notificationsScreen,
      page: () => const NotificationsScreen(),
    ),
  ];
}
