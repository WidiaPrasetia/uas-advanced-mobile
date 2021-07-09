// import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/public/questions.dart' as pertanyaan;
import 'package:project/home/home.dart' as utama;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/coba-coba.dart' as coba;

class User extends StatefulWidget {
  const User({Key key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    users.snapshots().listen((event) {
      print('user = ${(event.docs[0].data() as Map<String, dynamic>)['nama']}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
      ),
      body: StreamBuilder(
        stream: users.snapshots(),
        builder: (BuildContext ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData) {
            return Text('tidak ada data users');
          } else {
            return Column(
              children: snapshot.data?.docs.map<Widget>((e) {
                final data = e.data() as Map<String, dynamic>;
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://instagram.fdps5-1.fna.fbcdn.net/v/t51.2885-19/s320x320/208997280_197715405602010_3462236833419659857_n.jpg?tp=1&_nc_ht=instagram.fdps5-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=biNXmnrVnPoAX9w3SDr&edm=ABfd0MgBAAAA&ccb=7-4&oh=fd83b8573e833dbf5ab809a264c6462e&oe=60EBAF4C&_nc_sid=7bff83"),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.add_circle),
                  ),
                  title: Text('${data['nama']}'),
                  subtitle: Text('${data['email']}'),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
