import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class Location {
  late double latitude ;
 late  double longtitude ;
 // Location (this.latitude,this.longtitude);
 Future<void> getCurrentLocation () async{
   try {
     Position position = await Geolocator.getCurrentPosition(
         desiredAccuracy: LocationAccuracy.low);
     // LocationPermission  permission = await Geolocator.requestPermission();
     LocationPermission permission;
     permission = await Geolocator.requestPermission();
     latitude = position.latitude ;
     longtitude = position.longitude ;
     print(position);
   }
   catch (e){
     print(e);
   }
 }
}

