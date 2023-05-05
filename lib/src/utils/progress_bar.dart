import 'package:ambulance/src/global/global.dart';
import 'package:flutter/material.dart';

circularProgress() {
  return Container(
    padding: const EdgeInsets.only(top: 12.0),
    alignment: Alignment.center,
    child: CircularProgressIndicator(
      backgroundColor: foregroundColor,
      valueColor: AlwaysStoppedAnimation(foregroundColor),
    ),
  );
}
