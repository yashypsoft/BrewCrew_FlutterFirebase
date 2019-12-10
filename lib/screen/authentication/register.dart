import 'package:brewcrew/screen/shared/constant.dart';
import 'package:brewcrew/screen/shared/loading.dart';
import 'package:brewcrew/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //Text field data
  String email = "";
  String password = "";
  String error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading():Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("SignUP BrewCREW"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Signin"),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Email"),
                validator: (val) =>
                    val.isEmpty ? '*Enter a email Address' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Password"),
                validator: (val) =>
                    val.length < 6 ? '*Enter 6 character password' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.pink[400],
                child: Text("Register"),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      loading=true;
                    });
                    dynamic result =
                        await _auth.registerWithEmailPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = "Enter valid email and password";
                        loading = false;
                      });
                    }
                  }
                },
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(error),
            ],
          ),
        ),
      ),
    );
  }
}
