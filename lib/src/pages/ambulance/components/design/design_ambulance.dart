import 'package:ambulance/src/global/global.dart';
import 'package:flutter/material.dart';

class DesignAmbulanceCard extends StatelessWidget {
  final String address;
  final String distance;
  final String name;
  const DesignAmbulanceCard({
    Key? key,
    required this.address,
    required this.distance,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: foregroundColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(28.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Name : $name',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Left Time : $distance min',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Address : $address',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
