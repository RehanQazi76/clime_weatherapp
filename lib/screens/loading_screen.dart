import 'package:clime_weatherapp/screens/loacation_screen.dart';
import 'package:clime_weatherapp/services/location.dart';
import 'package:clime_weatherapp/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

// import 'package:geolocator/geolocator.dart';


double? lat;
double? long;
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

  void getLocation()async {
  Location loc= Location();
  await loc.getLocation();
  lat=loc.latitute;
  long=loc.longitute;
  NetworkHelper networkHelper=NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=12a6ff277349ce7856d4f317373b287f');

  var weatherdata= await networkHelper.getData();
  Navigator.push(context , MaterialPageRoute(builder: (context){
    return LocationScreen();
  }));

}
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}



