import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileappweek1/screen/dashboard.dart';
import 'package:mobileappweek1/screen/firebaselogin.dart';
import 'package:mobileappweek1/screen/firebaseregister.dart';
import 'package:mobileappweek1/screen/packagelocation.dart';
import 'package:mobileappweek1/screen/packagevideo.dart';
import 'package:mobileappweek1/screen/register.dart';
import 'package:mobileappweek1/screen/store.dart';
import 'config/constant.dart';
import 'screen/home.dart';
import 'screen/index.dart';
import 'screen/login.dart';
import 'screen/packageimage.dart';

//void main() => runApp(Myapp());
Future<void> main() async {
  //connect firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //run app
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Index(), //ref.Name Class
      routes: {
        'Login': (context) => FirebaseLogin(),
        'Register': (context) => FirebaseRegister(),
        'Dashboard': (context) => Dashboard(),
        'Image': (context) => PackageImage(),
        'Video': (context) => PackageVideo(),
        'Location': (context) => PackageLocation(),
        'Store' : (context) => Store(),
        'Home': (context) => Index(),
      },
      theme: ThemeData(
        primaryColor: pColor,
        secondaryHeaderColor: sColor,
      ),
    );
  }
}
