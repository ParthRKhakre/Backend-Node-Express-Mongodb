import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mausam/Worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? temp;
  String? hum;
  String? air_speed;
  String? des;
  String? main;
  String? icon;
  String? city="Jaipur";

  void startapp(String city) async {
    worker instance = worker(location: city);
    await instance.getdata();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon =instance.icon;
    
    Future.delayed(Duration(seconds: 2),() {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": hum,
        "air_speed_value": air_speed,
        "des_value": des,
        "main_value": main,
        "icon_value":icon,
        "city_value":city,
      });
    });

  }

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    Map? search = args is Map ? args : null;

    // If the route had arguments, set the city from the search map
    if (search != null && search.isNotEmpty && search["searchtext"] != null) {
      city = search["searchtext"];
    }

    // Now start the app with a guaranteed non-null city
    startapp(city!);

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/mlogo.png',
            height: 300,
            width: 300,
          ),
          Text(
            "Mausam App",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500,color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Made by Veer",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Colors.white),
          ),
          SizedBox(height: 50,),
          SpinKitWave(
            color: Colors.white,
            size: 50.0,
          )
        ],
      ),
    ),
      backgroundColor: Colors.blue[300],
    );
  }
}
