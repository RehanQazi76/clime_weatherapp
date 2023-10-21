import 'package:clime_weatherapp/services/location.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}

void getLocation()async {
  Location loc= Location();
  await loc.getLocation();
  print(loc.latitute);
  print(loc.longitute);
}