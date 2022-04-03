import 'package:clima_flutter_flearner/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima_flutter_flearner/services/weather.dart';



class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude = 0.0;
  double longitude = 0.0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
    print('this line of code is triggered');
  }

   void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        )
      )
    );
  }
}