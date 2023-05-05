import 'package:ambulance/src/pages/splash/splash.dart';
import 'package:get/get.dart';

class AppRoute {
  static List<GetPage> pages() => [
        GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
      ];
}
