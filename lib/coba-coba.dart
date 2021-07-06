import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// class Coba extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Coba'),
//         centerTitle: false,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.more_vert),
//             onPressed: () {},
//           )
//         ],
//       ),
//       body: ListView(
//         children: [

//         ],
//       ),
//     );
//   }
// }

class Coba extends StatefulWidget {
  const Coba({Key key}) : super(key: key);

  @override
  _CobaState createState() => _CobaState();
}

class _CobaState extends State<Coba> {
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
        title: Text('Coba'),
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
                        "https://cdn.undiknas.ac.id/assets/app-assets/no-photo.gif"),
                  ),
                  title: Text('${data['nama']}'),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
