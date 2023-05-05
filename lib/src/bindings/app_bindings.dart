import 'package:ambulance/src/pages/auth/controller/auth_controller.dart';
import 'package:ambulance/src/pages/splash/controller/splash_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
  }
}
