import 'package:brewcrew/screen/shared/constant.dart';
import 'package:flutter/material.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugar = ['0', '1', '2', '3', '4'];

  //form variable
  String _currentName;
  String _currentSugar;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            "Update Your Brew Setting",
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
            initialValue: _currentName ?? "new Member",
          ),
          //DropDown
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentSugar ?? "0",
            items: sugar.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text("$sugar sugars"),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentSugar = val),
          ),
          //slider
          Slider(
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (val) => setState(() => _currentStrength = val.round()),
            value: (_currentStrength ?? 100).toDouble(),
            activeColor: Colors.brown[_currentStrength ?? 100],
            inactiveColor: Colors.brown[_currentStrength ?? 100],
          ),
          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              "Update",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              print(_currentName);
              print(_currentStrength);
              print(_currentSugar);
            },
          )
        ],
      ),
    );
  }
}
