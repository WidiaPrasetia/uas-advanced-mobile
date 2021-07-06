import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/database_services.dart';
import 'package:project/public/questions.dart' as pertanyaan;
import 'package:project/home/home.dart' as utama;

class Tag extends StatefulWidget {
  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<Tag> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firestore Demo'),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('Add Users'),
                    onPressed: () {
                      DatabaseServices.createOrUpdateUsers(
                        "1",
                        nama: "babang",
                        email: 'babang@gmail.com',
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
