import 'package:ambulance/src/global/global.dart';
import 'package:ambulance/src/pages/ambulance/components/design/design_ambulance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookedAmbulancePage extends StatelessWidget {
  const BookedAmbulancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Stream stream = FirebaseFirestore.instance
        .collection('phone')
        .doc(sharedPreferences.getString('phone'))
        .collection('ambulance')
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text(
          'Booked Ambulance',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        backgroundColor: foregroundColor,
      ),
      body: StreamBuilder(
        stream: stream,
        builder: ((context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: ((context, index) {
                return DesignAmbulanceCard(
                    address: snapshot.data.docs[index]['address'],
                    distance: snapshot.data.docs[index]['distance'],
                    name: snapshot.data.docs[index]['name']);
                // return Text(snapshot.data.docs[index]['name']);
              }),
            );
          }
        }),
      ),
    );
  }
}
