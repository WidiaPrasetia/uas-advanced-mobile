import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/auth/signin.dart';
import 'package:project/public/questions.dart' as pertanyaan;
import 'package:project/public/users.dart';
import 'package:project/public/tags.dart';
import 'package:project/coba-coba.dart' as coba;
import 'package:project/findJobs/jobs.dart' as job;
import 'package:project/findJobs/companies.dart';
import 'package:project/auth/authservice.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blue,
        actions: [
          Row(
            children: <Widget>[
              IconButton(
                  padding: EdgeInsets.only(right: 20.0),
                  icon: Icon(Icons.search_outlined),
                  onPressed: () {}),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signOut();
                },
                child: Text('Sign Out'),
              )
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
               accountEmail: Text('hary@gmail.com'),
               accountName: Text('hary kurniawan'),
              ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home_filled),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
            ExpansionTile(
              childrenPadding: EdgeInsets.only(left: 10.0),
              title: Text("Public"),
              leading: Icon(Icons.public),
              children: <Widget>[
                ListTile(
                    title: Text("Questions"),
                    leading: Icon(Icons.question_answer_outlined),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pertanyaan.Question(),
                        ),
                      );
                    }),
                ListTile(
                  title: Text("Tags"),
                  leading: Icon(Icons.tag),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Tag()));
                  },
                ),
                ListTile(
                  title: Text("Users"),
                  leading: Icon(Icons.account_circle),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => User()));
                  },
                ),
                // ListTile(
                //   title: Text("NYOBAK"),
                //   leading: Icon(Icons.markunread_mailbox),
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => coba.Coba(),
                //       ),
                //     );
                //   },
                // )
              ],
            ),
            ExpansionTile(
                childrenPadding: EdgeInsets.only(left: 10.0),
                title: Text("Find A Job"),
                leading: Icon(Icons.work),
                children: <Widget>[
                  ListTile(
                      title: Text("Jobs"),
                      leading: Icon(Icons.work_outline),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => job.Job(),
                          ),
                        );
                      }),
                  ListTile(
                      title: Text("Companies"),
                      leading: Icon(Icons.home_work),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Companies(),
                          ),
                        );
                      }),
                ]),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
            crossAxisCount: 2,
            children:<Widget> [
          Card(
            margin: EdgeInsets.all(8.0) ,
            child: InkWell(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => User()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:<Widget>[
                    Icon(Icons.account_circle, size: 70.0,),
                    Text("Users", style : new TextStyle(fontSize: 17.0))
                  ],
                ),
                ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0) ,
            child: InkWell(
              onTap: (){
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => pertanyaan.Question(),
                ));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:<Widget>[
                    Icon(Icons.question_answer_outlined, size: 70.0,),
                    Text("Question", style : new TextStyle(fontSize: 17.0))
                  ],
                ),
                ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0) ,
            child: InkWell(
              onTap: (){
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => job.Job(),
                ),
               );
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:<Widget>[
                    Icon(Icons.work_outline, size: 70.0,),
                    Text("Jobs", style : new TextStyle(fontSize: 17.0))
                  ],
                ),
                ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0) ,
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => Companies(),
                  ),
                );
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:<Widget>[
                    Icon(Icons.home_work, size: 70.0,),
                    Text("Companies", style : new TextStyle(fontSize: 17.0))
                  ],
                ),
                ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}
