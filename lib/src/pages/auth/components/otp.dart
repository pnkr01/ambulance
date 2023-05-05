// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:ambulance/src/global/global.dart';
import 'package:ambulance/src/utils/global.dart';
import 'package:ambulance/src/utils/loading_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ambulance/ambulance_nav.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  const OtpScreen({
    Key? key,
    required this.phone,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController1 = TextEditingController();
  TextEditingController otp = TextEditingController();
  String verificationId = "";
  String smsCode = "";
  //AuthClass authClass = AuthClass();

  bool issend = false;
  int start = 30;
  void setTimer() {
    const onsec = Duration(seconds: 1);
    // ignore: unused_local_variable
    Timer timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          issend = true;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  void validate() async {
    if (otpController1.text.isNotEmpty && otpController1.text.length == 6) {
      showDialog(
          context: context,
          builder: (context) {
            //  print("loading screen");
            return const LoadingDialog(
              message: "Please Wait",
            );
          });
      // print("authenticate");
      await authenticate1();
    }
  }

  Future<void> authenticate1() async {
    UserCredential userCredential = await authClass.signInWithPhoneNumber(
      verificationId,
      smsCode,
      context,
      widget.phone,
    );

    // ignore: unnecessary_null_comparison
    if (userCredential != null) {
      //sucess
      //send to Map page
      SharedPreferences.getInstance()
          .then((value) => value.setString('logged', 'yes'));
      Get.offAll(() => const AmbulanceNav());

      // getDataAndSaveLocally();
      setState(() {
        start = 0;
      });
    } else {
      Navigator.pop(context);
      showSnackBar(context, 'Wrong OTP entered', Colors.red);
    }
  }

  @override
  void initState() {
    // setTimer();
    super.initState();

    //TODOS:1
    authClass.verifyPhoneNumber(
      "+91 ${widget.phone}",
      context,
      setData,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('OTP'),
          centerTitle: true,
          backgroundColor: foregroundColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('images/otp.jpg', width: 300),
              Text(
                "OTP has been sent to your registered mobile number",
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12.0,
                    fontFamily: "VarelaRound",
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "******${widget.phone.substring(6)}",
                  style: const TextStyle(fontSize: 12.0),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 8, right: 8),
                child: PinCodeTextField(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  backgroundColor: Colors.white,
                  onTap: () {
                    // canConfirmOtp.value = false;
                    // _otpCodeTextController.clear();
                    setState(() {
                      setState(() {
                        smsCode = otp.text;
                        otpController1.text = otp.text;
                      });
                    });
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp(r'\d'), allow: true)
                  ],
                  controller: otp,
                  //  enabled: canConfirmOtp.value ? false : true,
                  enableActiveFill: true,
                  appContext: context,
                  hintCharacter: "*",
                  length: 6,
                  // backgroundColor: Colors.grey.shade200,
                  onCompleted: (String pin) {
                    // controller.isStartingOtpVeryfication.value = true;
                    setState(() {
                      setState(() {
                        smsCode = pin;
                        otpController1.text = pin;
                      });
                    });
                  },
                  onChanged: (String s) {
                    //otpCode = s;
                  },

                  cursorColor: foregroundColor,
                  keyboardType: TextInputType.number,
                  textStyle:
                      const TextStyle(fontSize: 18, color: Colors.black87),
                  pinTheme: PinTheme(
                    borderRadius: BorderRadius.circular(5),
                    borderWidth: 0.0,
                    // fieldHeight: Get.width * 0.13,
                    fieldWidth: Get.width * 0.13,
                    shape: PinCodeFieldShape.box,
                    selectedFillColor: Colors.grey.shade100,
                    activeColor: Colors.transparent,
                    disabledColor: Colors.grey,
                    inactiveColor: Colors.transparent,
                    selectedColor: Colors.purple,
                    activeFillColor: Colors.grey.shade100,
                    inactiveFillColor: Colors.grey.shade100,
                  ),
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            issend
                                ? {
                                    //resend otp
                                    authClass.signInWithPhoneNumber(
                                      verificationId,
                                      smsCode,
                                      context,
                                      // widget.userName,
                                      widget.phone,
                                    ),
                                    // ignore: avoid_print
                                    print("resend otp"),
                                    start = 30,
                                    issend = false,
                                    setTimer(),
                                  }
                                : {
                                    const SnackBar(
                                      content: Text("Please wait until timer"),
                                    ),
                                    // ignore: avoid_print
                                    print("Please wait until timer"),
                                  };
                          },
                        text: "Resend OTP in",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: issend ? foregroundColor : Colors.grey,
                        ),
                      ),
                      const TextSpan(
                        text: "in",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: "00:$start",
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.pink,
                        ),
                      ),
                      const TextSpan(
                        text: " sec",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: foregroundColor),
                    onPressed: () {
                      validate();
                    },
                    child: const Text('SignUp'),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void setData(String verificationsId) {
    setState(() {
      verificationId = verificationsId;
    });
    setTimer();
  }
}
