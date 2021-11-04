import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';
import 'package:mobileappweek1/screen/Store/adddata.dart';
import 'package:mobileappweek1/screen/Store/viewdata.dart';

class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Store"),
        ),
        body: TabBarView(
          children: [
            AddData(),
            ViewData(),
          ],
        ),
        bottomNavigationBar: Container(
          color: sColor,
          child: TabBar(
            indicatorColor: Colors.redAccent,
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: "AppData",
              ),
              Tab(
                text: "View Data",
              )
            ],
          ),
        ),
      ),
    );
  }
}
