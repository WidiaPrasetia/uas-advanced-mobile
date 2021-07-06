import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/database_services.dart';
import 'package:project/public/questions.dart' as pertanyaan;
import 'package:project/home/home.dart' as utama;

import '../item_card.dart';

class Job extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Jobs '),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text('Job List'),
        ],
      ),
      // body: Stack(
      //   children: [
      //     // ListView(
      //     //   children: [
      //     //     FutureBuilder<QuerySnapshot>(
      //     //       future: users.get(),
      //     //       builder: (_, snapshot) {
      //     //         if (snapshot.hasData) {
      //     //           return Column(
      //     //             children: snapshot.data.docs
      //     //                 .map<Widget>((e) =>
      //     //                     ItemCard(e.data()['nama'], e.data()['email']))
      //     //                 .toList(),
      //     //           );
      //     //         } else {
      //     //           return Text('Loading');
      //     //         }
      //     //       },
      //     //     ),
      //     //     SizedBox(
      //     //       height: 150.0,
      //     //     )
      //     //   ],
      //     // ),
      //     Align(
      //       alignment: Alignment.bottomCenter,
      //       child: Container(
      //         padding: const EdgeInsets.symmetric(horizontal: 15.0),
      //         decoration: BoxDecoration(color: Colors.white, boxShadow: [
      //           BoxShadow(
      //               color: Colors.black,
      //               offset: Offset(-5, 0),
      //               blurRadius: 15.0,
      //               spreadRadius: 3.0),
      //         ]),
      //         width: double.infinity,
      //         height: 130.0,
      //         child: Row(
      //           children: [
      //             SizedBox(
      //               width: MediaQuery.of(context).size.width - 160.0,
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   TextField(
      //                     controller: nameController,
      //                     decoration: InputDecoration(hintText: 'nama'),
      //                   ),
      //                   TextField(
      //                     controller: emailController,
      //                     decoration: InputDecoration(hintText: 'email'),
      //                   )
      //                 ],
      //               ),
      //             ),
      //             Container(
      //               height: 130.0,
      //               width: 130.0,
      //               padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
      //               child: RaisedButton(
      //                 shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(8.0)),
      //                 color: Colors.blue,
      //                 child: Text(
      //                   'Add Data',
      //                   style: TextStyle(
      //                       color: Colors.white, fontWeight: FontWeight.bold),
      //                 ),
      //                 onPressed: () {
      //                   users.add({
      //                     'nama': nameController.text,
      //                     'email': emailController.text
      //                   });

      //                   nameController.text = '';
      //                   emailController.text = '';
      //                 },
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
