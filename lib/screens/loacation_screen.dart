import 'dart:convert';

import 'package:clime_weatherapp/screens/city_screen.dart';
import 'package:clime_weatherapp/services/weather.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen(this.weatherLocation);
  final weatherLocation;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  WeatherModel weather = WeatherModel();
    int temperature=0;
    String? weatherIcon;
    String? cityName;
    String? message;

  @override
  void initState(){
    super.initState();
    updateUi(widget.weatherLocation);
  }

void updateUi(dynamic weatherLocation){
   setState(() {
     
    if(weatherLocation==null){
      temperature=0;
      weatherIcon='lafda hai';
      cityName='';
      message='error';
    }
    
    var longitude= weatherLocation['coord']['lon'];
    var latitude= weatherLocation['coord']['lat'];
    double temp=weatherLocation['main']['temp']; 
    temperature=temp.toInt();
    int condition=weatherLocation['weather'][0]['id']; 
     weatherIcon= weather.getWeatherIcon(condition);
    cityName=weatherLocation[''];
    message=weather.getMessage(temperature);
    print("weatherLocation"); 
   
   }); 

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() async {
                        var weatherdata= await weather.getLocationWeather();
                        updateUi(weatherdata);
                        
                      });
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                     var changedCityName= await Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context){
                        return CityScreen();
                         }
                       )
                      );
                      print(changedCityName);
                      if(changedCityName!=null){
                        var weatherdata=await weather.getcityWeather(changedCityName);
                        print(weatherdata);
                        updateUi(weatherdata);  
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "$temperature",
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

