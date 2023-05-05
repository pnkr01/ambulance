import 'package:ambulance/src/global/global.dart';
import 'package:flutter/material.dart';

class CprPage extends StatelessWidget {
  const CprPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: foregroundColor),
        height: 50,
        child: const Center(
            child: Text(
          'Ambulance is coming in 10 min',
          style: TextStyle(color: Colors.white),
        )),
      ),
      appBar: AppBar(
        backgroundColor: foregroundColor,
        title: const Text('Breathing'),
      ),
      body: Column(
        children: [
          Image.network(
              'https://img.freepik.com/free-vector/emergency-cardiopulmonary-resuscitation_74855-16872.jpg?w=1060&t=st=1683258171~exp=1683258771~hmac=6f59a8718a5e9a1d4ab34e824cc3933d22eb9db8ee5caaa1193aa210af58fd86'),
          Text(
            'Does this person breath?',
            style: TextStyle(fontSize: 24, color: foregroundColor),
          ),
          const SizedBox(height: 50),
          Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: foregroundColor),
                  onPressed: () {},
                  child: const Text('Yes'))),
          Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: foregroundColor),
                  onPressed: () {},
                  child: const Text('No, Start CPR'))),
          // ElevatedButton(onPressed: () {}, child: const Text('No, Start CPR')),
        ],
      ),
    );
  }
}
