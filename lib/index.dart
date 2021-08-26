import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              top: -20,
              left: -30,
              child: Image.asset(
                "asset/image/orange-circle.png",
                width: size.width * 0.2,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "asset/image/logo-kmutnb.png",
                  width: size.width * 0.35,
                  //height: size.height * 0.35,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome to KMUTNB",
                  style: TextStyle(
                    color: Colors.amber[900],
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "asset/image/1.png",
                  width: size.width * 0.9,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber[900],
                    padding: EdgeInsets.fromLTRB(130, 12, 130, 12),
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    print("Hello World");
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber[900],
                    padding: EdgeInsets.fromLTRB(130, 12, 130, 12),
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    "SINGUP",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    print("Hello World");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
