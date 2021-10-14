import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileappweek1/screen/dashboard.dart';
import 'package:mobileappweek1/screen/packagelocation.dart';
import 'package:mobileappweek1/screen/packagevideo.dart';
import 'package:mobileappweek1/screen/register.dart';
import 'config/constant.dart';
import 'screen/home.dart';
import 'screen/index.dart';
import 'screen/login.dart';
import 'screen/packageimage.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Index(), //ref.Name Class
      routes: {
        'Login': (context) => Login(),
        'Register': (context) => Register(),
        'Dashboard': (context) => Dashboard(),
        'Image': (context) => PackageImage(),
        'Video': (context) => PackageVideo(),
        'Location': (context) => PackageLocation(),
      },
      theme: ThemeData(
        primaryColor: pColor,
        secondaryHeaderColor: sColor,
      ),
    );
  }
}
