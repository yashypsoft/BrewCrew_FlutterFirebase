import 'package:brewcrew/screen/authentication/authentication.dart';
import 'package:brewcrew/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brewcrew/models/users.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    
    if(user == null)
    {
      return Auth();
    }
    else{
      return Home();
    }
  }
}