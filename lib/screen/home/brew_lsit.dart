import 'package:brewcrew/models/brew.dart';
import 'package:brewcrew/screen/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    // print(brews.documents);
    brews.forEach((brew){
      print(brew.name);
    });
    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (BuildContext context, int index) {
      return BrewTile(brew : brews[index]);
     },
    );
  }
}
