// import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:project/coba-coba.dart';
import 'package:project/home/home.dart' as home;
import 'package:project/auth/login.dart';
import 'package:project/auth/signup.dart';
import 'package:project/home/home.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers :[
        
      ],
        child: MaterialApp(
        title:  'Login App',
        theme: ThemeData(
          primaryColor: Colors.blue,
          ),
        home: LoginPage(),
          routes: {
            Home.routeName:(ctx)=>Home(),
            SignUp.routeName:(ctx)=>SignUp(),
            LoginPage.routeName:(ctx)=>LoginPage(),
          },
      ),
    );
  }
}
// class MyUas extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: new home.Home(),
//     );
//   }
// }
