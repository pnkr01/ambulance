import 'package:ambulance/src/global/global.dart';
import 'package:ambulance/src/pages/ambulance/components/map_page.dart';
import 'package:ambulance/src/pages/auth/auth.dart';
import 'package:get/get.dart';

import '../../ambulance/ambulance_nav.dart';

class SplashController extends GetxController {
  checkForAuth() {
    if (sharedPreferences.getString('logged') != null) {
      Get.to(() => const AmbulanceNav());
    } else {
      Get.to(() => const AuthPage());
    }
  }
}
