import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class Location{
  double? longitute;
  double? latitute;

   Future<void> getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    if( permission== LocationPermission.denied){
         //nothing
    }
    try{Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
     longitute=position.longitude;
     latitute=position.latitude;    
     
     print(position);
    }
    catch(e){
      print(e);
    };
   
  }
}