import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class PackageLocation extends StatefulWidget {
  const PackageLocation({Key? key}) : super(key: key);

  @override
  _PackageLocationState createState() => _PackageLocationState();
}

class _PackageLocationState extends State<PackageLocation> {
  dynamic latitude;
  dynamic longitude;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(location);
    print(location.latitude);
    print(location.longitude);

    setState(() {
      latitude = '${location.latitude}';
      longitude = '${location.longitude}';
    });

    //convert Latitude And Longitude To Map
    var address =
        await placemarkFromCoordinates(17.4742, 101.7300);
    print(address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ละติจูด ' + latitude,
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            Text(
              'ลองติจูด ' + longitude,
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
