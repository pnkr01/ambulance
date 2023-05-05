import 'package:ambulance/src/global/global.dart';
import 'package:ambulance/src/pages/auth/components/otp.dart';
import 'package:ambulance/src/pages/auth/controller/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MyFirebase {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference userPath = FirebaseFirestore.instance.collection('user');

  Future sendUserDataToFirebase(
      String name,
      String email,
      String phone,
      String address,
      String? health,
      String emergencyContact,
      String insurance) async {
    await userPath.doc(phone).set({
      "name": name,
      "email": email,
      "phone": phone,
      "health": health ?? "",
      "emergencyContact": emergencyContact,
      "insurance": insurance,
    }).then((value) {
      sharedPreferences.setString('phone', phone);
      Get.find<AuthController>().isSending.value = false;
      Get.to(() => OtpScreen(phone: phone));
    });
  }
}
