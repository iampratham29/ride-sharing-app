import 'package:flutter/material.dart';
import 'package:scratch/authfiles/authenticate.dart';
import 'package:scratch/authfiles/dash.dart';
import 'package:scratch/authfiles/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if(user==null){
      return Authenticate();
    }
    else{
      return dashboard();
    }
  }
}