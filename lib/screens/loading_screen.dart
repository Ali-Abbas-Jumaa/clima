import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

const apiKey = "5c7ec29125740f35f9fee92be747934d";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double long;
  double lat;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = new Location();
    await location.getCurrentLocation();
    long = location.longitude;
    lat = location.latitude;
    NetworkHelper netwrokHelper = new NetworkHelper(
        url:
            "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric");
    var weahterData = await netwrokHelper.getData();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(weatherData: weahterData);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 80.0,
      )),
    );
  }
}
