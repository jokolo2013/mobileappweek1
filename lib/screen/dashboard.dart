import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobileappweek1/config/constant.dart';
import 'package:mobileappweek1/model/tct.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var data;

  @override
  void initState() {
    super.initState();
    print("Hello");
    callAPI();
  }

  Future<void> callAPI() async {
    var url = Uri.parse("https://www.boredapi.com/api/activity");

    var response = await http.get(url);

    setState(() {
      data = tctFromJson(response.body);
    });
    // print(response.statusCode);
    //print(response.body);
    // print(data.activity);
    // print(data.type);
    // print(data.price);
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    print("logout");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: sColor,
              ),
              child: Text(
                'Package',
                style: TextStyle(
                  fontSize: 28,
                  color: pColor,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Video',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              leading: Icon(
                Icons.video_call,
                color: Colors.yellow,
                size: 36,
              ),
              onTap: () {
                print('Menu Video');
                Navigator.pushNamed(context, 'Video');
              },
            ),
            ListTile(
              title: Text(
                'Image',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              leading: Icon(
                Icons.image,
                color: Colors.pink,
                size: 36,
              ),
              onTap: () {
                print('Menu Image');
                Navigator.pushNamed(context, 'Image');
              },
            ),
            ListTile(
              title: Text(
                'Location',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              leading: Icon(
                Icons.gps_fixed,
                color: Colors.green,
                size: 36,
              ),
              onTap: () {
                print('Menu GPS');
                Navigator.pushNamed(context, 'Location');
              },
            ),ListTile(
              title: Text(
                'Store',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              leading: Icon(
                Icons.store,
                color: Colors.blue,
                size: 36,
              ),
              onTap: () {
                print('Menu Store');
                Navigator.pushNamed(context, 'Store');
              },
            ),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              leading: Icon(
                Icons.logout,
                color: Colors.red,
                size: 36,
              ),
              onTap: () {
                logout();
                Navigator.of(context).pop();
                Navigator.pushNamed(context, 'Home', arguments: []);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Icon(Icons.api),
            SizedBox(width: 10),
            Text('Dashboard'),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text("Activity"),
            Text(
              data?.activity ?? "Loading...",
              style: TextStyle(
                color: sColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Type"),
            Text(data?.type ?? "Loading...",
                style: TextStyle(
                  color: sColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            Text("Price"),
            Text('${data?.price ?? "Loading..."}',
                style: TextStyle(
                  color: sColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            Text("Participants"),
            Text('${data?.participants ?? "Loading..."}',
                style: TextStyle(
                  color: sColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }
}
