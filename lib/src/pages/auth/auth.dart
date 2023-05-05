import 'package:ambulance/src/global/global.dart';
import 'package:ambulance/src/pages/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late String _selectedHealthOption =
      'Select'; // Variable to store the selected option

  final List<String> _healthOptions = [
    'Select',
    'Diabetes',
    'Eye',
    'Heart',
    'Stomach',
    'Brain',
  ];
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: foregroundColor,
        title: const Text('Authentication'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.name,
                  decoration: InputDecoration(
                      focusColor: foregroundColor,
                      labelText: 'Enter your name',
                      hintText: 'e.g. ayush',
                      labelStyle: TextStyle(color: foregroundColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: foregroundColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: foregroundColor))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Save the form field value
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controller.email,
                  decoration: InputDecoration(
                      focusColor: foregroundColor,
                      labelText: 'Enter Email',
                      hintText: 'e.g. ayush@gmail.com',
                      labelStyle: TextStyle(color: foregroundColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: foregroundColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: foregroundColor))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Save the form field value
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controller.phone,
                  decoration: InputDecoration(
                      focusColor: foregroundColor,
                      labelText: 'Phone',
                      hintText: 'e.g. 6299261625',
                      labelStyle: TextStyle(color: foregroundColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: foregroundColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: foregroundColor))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Save the form field value
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controller.address,
                  decoration: InputDecoration(
                      focusColor: foregroundColor,
                      labelText: 'Address',
                      hintText: 'e.g. ITER Lane R5',
                      labelStyle: TextStyle(color: foregroundColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: foregroundColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: foregroundColor))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Save the form field value
                  },
                ),
                const SizedBox(height: 15),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    iconColor: foregroundColor,
                    labelText: 'Select a health option',
                    labelStyle: TextStyle(color: foregroundColor),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: foregroundColor)),
                  ),
                  value: _selectedHealthOption,
                  items: _healthOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option,
                          style: TextStyle(color: foregroundColor)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedHealthOption = value!;
                    });
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controller.emergencyContact,
                  decoration: InputDecoration(
                      focusColor: foregroundColor,
                      labelText: 'Emergency Contact No',
                      hintText: 'e.g. 6299261625',
                      labelStyle: TextStyle(color: foregroundColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: foregroundColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: foregroundColor))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Save the form field value
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controller.insurance,
                  decoration: InputDecoration(
                      focusColor: foregroundColor,
                      labelText: 'Insurance Details',
                      hintText: 'e.g. Insurance no',
                      labelStyle: TextStyle(color: foregroundColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: foregroundColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: foregroundColor))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Save the form field value
                  },
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: foregroundColor),
                    onPressed: () {
                      controller.checkBlanksAndStartAuthenticating(
                          _selectedHealthOption);
                    },
                    child: Obx(() => controller.isSending.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1,
                            ),
                          )
                        : const Text('Send OTP')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
