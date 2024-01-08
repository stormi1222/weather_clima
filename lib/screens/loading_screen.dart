import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:weather_clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_clima/screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();

  void getWeatherData(String newcity) {

  }
}


class _LoadingScreenState extends State<LoadingScreen> {
  String city ='';

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          size: 70.0,
          color: Colors.white,
        ),
      ),
    );
  }

  void getWeatherData() async{
    Networking networking = new  Networking();
    String data = await networking.getData(city);


    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(data);
    }));
  }
}