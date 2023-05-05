import 'package:ambulance/src/firebase/firebase.dart';
import 'package:ambulance/src/global/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isSending = false.obs;
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController address;
  late TextEditingController emergencyContact;
  late TextEditingController insurance;
  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    address = TextEditingController();
    emergencyContact = TextEditingController();
    insurance = TextEditingController();
    super.onInit();
  }

  checkBlanksAndStartAuthenticating(String option) {
    if (name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        address.text.isNotEmpty &&
        emergencyContact.text.isNotEmpty &&
        insurance.text.isNotEmpty) {
      MyFirebase().sendUserDataToFirebase(name.text, email.text, phone.text,
          address.text, option, emergencyContact.text, insurance.text);
    } else {
      Get.snackbar('Ambulance', 'Fill all blanks',
          backgroundColor: foregroundColor,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
