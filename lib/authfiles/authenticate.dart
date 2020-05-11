import 'package:flutter/material.dart';
import 'package:scratch/main.dart';
import 'package:scratch/authfiles/register.dart';
import 'package:scratch/authfiles/signIn.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn=true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return signIN(toggleView: toggleView);
    }
    else{
      return register(toggleView: toggleView);
    }
  }
}