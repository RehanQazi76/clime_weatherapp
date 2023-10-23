import 'package:clime_weatherapp/screens/loacation_screen.dart';
import 'package:clime_weatherapp/services/location.dart';
import 'package:clime_weatherapp/services/networking.dart';
import 'package:clime_weatherapp/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

  void getLocation()async {
  
  var weatherdata= await WeatherModel().getLocationWeather();
  Navigator.push(context , MaterialPageRoute(builder: (context){
    return LocationScreen(weatherdata);
  }));

}
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDualRing(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}



