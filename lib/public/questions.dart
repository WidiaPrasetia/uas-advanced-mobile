// import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/public/questions.dart' as pertanyaan;
import 'package:project/home/home.dart' as utama;

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  var onPressed;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users =
        FirebaseFirestore.instance.collection('questions');
    CollectionReference tags = FirebaseFirestore.instance.collection('tags');

    return Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          new IconButton(
              padding: EdgeInsets.only(right: 15.0),
              icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              ),
              onPressed: onPressed)
        ],
        title: Text("Questions"),
      ),
      body: ListView(
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Question',
                          hintText: 'Search Q&A',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(icon: Icon(Icons.close), onPressed: onPressed),
                  ],
                ),
              ),
            ],
          ),
          StreamBuilder(
            stream: users.snapshots(),
            builder: (BuildContext ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (!snapshot.hasData) {
                return Text('tidak ada data pertanyaan');
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
                        title: Text('${data['questions']}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${data['idUser']}'),
                            Text('${data['idQuestion']}')
                          ],
                        ));
                  }).toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
