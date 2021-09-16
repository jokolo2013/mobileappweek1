import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileappweek1/screen/register.dart';
import 'config/constant.dart';
import 'screen/home.dart';
import 'screen/index.dart';
import 'screen/login.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Index(), //ref.Name Class
      routes: {
        'Login': (context) => Login(),
        'Register': (context) => Register(),
      },
      theme: ThemeData(
        primaryColor: pColor,
        secondaryHeaderColor: sColor,
      ),
    );
  }
}
