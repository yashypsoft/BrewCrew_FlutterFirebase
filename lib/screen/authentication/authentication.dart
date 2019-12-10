import 'package:brewcrew/screen/authentication/register.dart';
import 'package:brewcrew/screen/authentication/sign_in.dart';
import 'package:flutter/material.dart';


class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool showSignIn =true;
    void toggleView(){
      setState(() =>
        showSignIn  = !showSignIn
      );
    }
  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}