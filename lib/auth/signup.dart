import 'package:project/auth/authservice.dart';
import 'package:flutter/material.dart';
import 'package:project/auth/signin.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up with Us'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Input your Email address",
              ),
            ),
            TextField(
              // obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signUp(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInPage(),
                    ),
                  );
                  // context.read<AuthenticationService>().signIn(
                  //       email: emailController.text.trim(),
                  //       password: passwordController.text.trim(),
                  //     );
                },
                child: Text("Sign Up"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
