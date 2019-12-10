import 'package:brewcrew/models/brew.dart';
import 'package:brewcrew/screen/home/brew_lsit.dart';
import 'package:brewcrew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brewcrew/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
        value: DatabaseService().brews,
          child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text("Brewcrew"),
          backgroundColor: Colors.brown[400],
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text("Logout"),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
