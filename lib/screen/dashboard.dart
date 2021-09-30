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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
