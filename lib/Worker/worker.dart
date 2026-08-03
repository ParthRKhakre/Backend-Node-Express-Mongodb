import 'dart:convert';
import 'package:http/http.dart';

class worker{

  worker({this.location}){
    location=this.location;
  }

  String? location;
  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? icon;

  //method

  Future <void> getdata() async{
    try{
      Response resopnse=await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid={your key}&units=metric"));
      final Map data =jsonDecode(resopnse.body);

      // If the response code isn't 200, handle error
      if (data["cod"] != 200) {
        temp = "NA";
        humidity = "NA";
        air_speed = "NA";
        description = "NA";
        main = "NA";
        icon = "NA";
        return;
      }

      // Otherwise, parse the valid response
      Map tempData = data["main"];
      Map windData = data["wind"];
      List weatherData = data["weather"];
      Map weatherMainData = weatherData[0];

      temp = tempData["temp"].toString();
      humidity = tempData["humidity"].toString();
      air_speed = windData["speed"].toString();
      description = weatherMainData["description"];
      main = weatherMainData["main"];
      icon = weatherMainData["icon"];
    } catch (e) {
      temp = "AN ERROR OCCURED";
      humidity = "AN ERROR OCCURED";
      air_speed = "AN ERROR OCCURED";
      description = "AN ERROR OCCURED";
      main = "AN ERROR OCCURED";
      icon = "AN ERROR OCCURED";
    }


  }
}

