import 'package:flutter/material.dart';
import 'package:scratch/authfiles/auth.dart';
import 'package:scratch/screens/home.dart';
import 'package:scratch/authfiles/register.dart';

class signIN extends StatefulWidget {
  final Function toggleView;
  signIN({this.toggleView});
  @override
  _signINState createState() => _signINState();
}

class _signINState extends State<signIN> {final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email= '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/back.jpg"), fit: BoxFit.cover)),
      alignment: Alignment(0.0, -0.2),
      padding: EdgeInsets.only(left: 30,
      right: 30),
      child:Form(
        key: _formKey,
        child:
      Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Welcome Back",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
               validator: (val) => val.isEmpty ? 'Enter a email' : null,
              onChanged: (val){
                setState(() => email = val);
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter your Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0))),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              obscureText: true,
              validator: (val) => val.length < 6
                            ? 'Enter a password at least 6 characters long'
                            : null,
                onChanged: (val){
                  setState(() => password = val);
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0)))),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment(-1.0, 0.6),
              child: Text(
                "Not a user yet?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ButtonTheme(
              minWidth: 130.0,
              height: 45.0,
              child: RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                          dynamic result = await _auth.signInWithEmailandPassword(email, password);                      //if (result == null) {
                            if(result== null){
                            setState(
                               () => error = 'Could not sign in');
                  }
                  else{
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                  }
                  }
                },
                child: Text('LOGIN'),
                color: Colors.green[400],
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    side: BorderSide(color: Colors.tealAccent[400])),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ButtonTheme(
              minWidth: 160.0,
              height: 45.0,
              child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>register()));
                        },
                        child: Text('Create Account'),
                        color: Colors.green[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            side: BorderSide(color: Colors.tealAccent[400])),
                      ),
            ),
             SizedBox(
                      height: 30,
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    )
          ]),
    )));
  }
}
