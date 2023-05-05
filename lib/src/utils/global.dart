import 'package:ambulance/src/global/global.dart';
import 'package:ambulance/src/pages/auth/auth_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
AuthClass authClass = AuthClass();
void showSnackBar(BuildContext context, String text, Color? color) {
  final snakbar = SnackBar(
    backgroundColor: foregroundColor,
    duration: const Duration(seconds: 1),
    content: Text(text),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snakbar);
}
