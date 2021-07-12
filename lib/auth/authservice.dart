import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
Future <void> signUp(String email, String password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=AIzaSyBR6l2lK8vzaN7ZWdFqPHDh_STxaqmOWBs';

    final response = await http.post(url, body: json.encode(
    {
      'email' : email,
      'password' : password,
      'returnSecureToken': true,
    }
    ));
    final responseData = json.decode(response.body);
    print(responseData);
  }
}