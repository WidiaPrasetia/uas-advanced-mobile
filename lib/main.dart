import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/coba-coba.dart';
import 'package:project/home/home.dart' as home;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (err) {
    print('Firebase already initialized');
  }
  runApp(MyUas());
}

class MyUas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new home.Home(),
    );
  }
}
