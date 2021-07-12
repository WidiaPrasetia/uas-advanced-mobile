import 'dart:html';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:project/home/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key key }) : super(key: key);
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formkey = GlobalKey();
  void _submit(){

  }
  @override
  Widget build(BuildContext context) {
    //header
    return Scaffold(
      appBar: AppBar(
        title: Text ("Login"),
        //tombol sign up pojok kanan atas
        actions: <Widget>[
          FlatButton(
            child: Row (
              children: <Widget>[
                Text('Sign Up'),
                Icon(Icons.person_add)
              ],
              ),
              textColor: Colors.white,
              //navigasi untuk kehalamanan sign up
              onPressed: (){
                Navigator.of(context).pushReplacementNamed(SignUp.routeName);
              },
          )
        ],
      ),
      //body
      body: Stack(
        children:<Widget> [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:[
                  Colors.lightGreenAccent,
                  Colors.blue,
                ]
              )
            ),
          ),
          //box 
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Container(
                height : 260,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children:<Widget>[
                        //email registrasi
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          // validasi email jika email kosong dan harus berisi @, jika tidak maka print invalid email
                          validator: (value){
                            if (value.isEmpty || !value.contains('@'))
                            {
                              return 'invalid email';
                            }
                            return null;
                          },
                          onSaved: (value){

                          },
                        ),

                        //password
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                        
                        //validasi password jika kurang dari 5 dan kosong maka print invalid password 
                          validator: (value){
                            if (value.isEmpty || value.length<=5)
                            {
                              return 'invalid password';
                            }
                            return null;
                          },
                          onSaved: (value){

                          },  
                        ),

                        //jarak antara colom login dan tombol submit
                        SizedBox(
                          height:30,
                        ),
                        
                        // tomboll submit bosss
                        RaisedButton(
                          child: Text(
                            'Submit'
                          ),
                          onPressed: ()
                          {
                            Navigator.of(context).pushReplacementNamed(Home.routeName);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                          
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}