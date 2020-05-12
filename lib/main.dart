import 'package:flutter/material.dart';
import 'package:scratch/authfiles/signIn.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,//to remove debug badge
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: signIN(),
    );
  }
}




