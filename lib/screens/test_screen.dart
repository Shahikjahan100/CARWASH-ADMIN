import 'package:carwash_admin/models/led.models.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class test_screen extends StatefulWidget {
  @override
  _test_screenState createState() => _test_screenState();
}

class _test_screenState extends State<test_screen> {
  final DatabaseReference _databaseRef =
      FirebaseDatabase.instance.ref().child('controllers');

  Future<List<LedModel>> _fetchLEDData() async {
    DataSnapshot snapshot = await _databaseRef.get();
    List<LedModel> leds = [];
    if (snapshot.exists) {
      Map<String, dynamic> data =
          Map<String, dynamic>.from(snapshot.value as Map);
      data.forEach((key, value) {
        leds.add(LedModel.fromJson(Map<String, dynamic>.from(value)));
      });
    }
    return leds;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All LED Data'),
      ),
      body: FutureBuilder<List<LedModel>>(
        future: _fetchLEDData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            List<LedModel>? leds = snapshot.data;
            return ListView.builder(
              itemCount: leds?.length ?? 0,
              itemBuilder: (context, index) {
                LedModel led = leds![index];
                return ListTile(
                  title: Text('LED ${index + 1}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Color: ${led.c}'),
                      Text('Col: ${led.col}'),
                      Text('G: ${led.g}'),
                      Text('Status: ${led.status}'),
                      Text('V: ${led.v}'),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: Text('No data available.'));
        },
      ),
    );
  }
}
