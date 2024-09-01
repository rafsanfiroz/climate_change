
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'location.dart';
import 'networking_helper.dart';
import 'location_screen.dart';
const apiKey = 'b8ae7eb9d195171d43e987bd433ca46b' ;
 class LoadingScreen extends StatefulWidget {
    const LoadingScreen({super.key});
  @override
  State<LoadingScreen> createState() { return _LoadingScreenState();}
}
class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude ;
  late double longtitude;
   void initState(){
     super.initState() ;
    getLocationData();
   }
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude=location.latitude;
   longtitude=location.longtitude;
    NetworkingHelper networkingHelper = NetworkingHelper('https://api.openweathermap.org/data/2.5/weather?lat '
        '=$latitude&lon=$longtitude&appid=$apiKey')  ;
    var weatherData = await networkingHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);

    }));

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  }
  @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.grey,
       body: Center(
         child: SpinKitDoubleBounce(
           color : Colors.white,
           size: 100.0,
         ),
       ),
     );
   }


