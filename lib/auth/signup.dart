import 'package:flutter/material.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key key }) : super(key: key);
  static const routeName = '/signup';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();
  void _submit(){

  }
  @override
  Widget build(BuildContext context) {
    //header
    return Scaffold(
      appBar: AppBar(
        title: Text ("SignUp"),
        //tombol login dihalaman sign
          actions: <Widget>[
          FlatButton(
            child: Row (
              children: <Widget>[
                Text('Login'),
                Icon(Icons.person)
              ],
              ),
              textColor: Colors.white,
              //navigasi untuk kehalamanan sign up
              onPressed: (){
                Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
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
                  Colors.limeAccent,
                  Colors.redAccent,
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
                height : 300,
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
                          controller: _passwordController,
                        //validasi password jika kurang dari = 5 dan kosong maka print invalid password 
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
                        //confirm password
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Confirm Password'),
                          obscureText: true,
                          
                        //pengulangan password 
                          validator: (value){
                            if (value.isEmpty || value!= _passwordController.text )
                            {
                              return 'invalid password';
                            }
                            return null;
                          },
                          onSaved: (value){

                          },  
                        ),
                        //jarak antara untuk tombol submit
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
                            Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
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