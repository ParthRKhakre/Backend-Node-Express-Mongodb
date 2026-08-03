import 'dart:convert';
// import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchcontroller = new TextEditingController();

  void getdata() async {
    Response response = await get(
        Uri.parse('https://mytimeapi.herokuapp.com/time/Asia/Kolkata'));
    Map data = jsonDecode(response.body);
    //to get the data we write print(data['key name'])
  }

  @override
  Widget build(BuildContext context) {
    //to get data from loading.dart file after loading splash screen
    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;
    String temp = (info?['temp_value']).toString();
    String air = (info?['air_speed_value']).toString();
    if (temp == 'NA') {
      print("Error occured");
    } else {
      temp = (info?['temp_value']).toString().substring(0, 4);
      air = (info?['air_speed_value']).toString().substring(0, 4);
    }
    String icon = info?['icon_value'];
    String city = info?["city_value"];
    String hum = info?['hum_value'];

    String desc = info?['des_value'];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.blueAccent,
          )),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.1,
              0.9,
            ],
            colors: [
              Colors.blueAccent,
              Colors.white,
            ],
          )),
          child: Column(
            children: [
              Container(
                //search cotnainer
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(30.0)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if ((searchcontroller.text).replaceAll(" ", "") == "") {
                          print("Blank Search");
                        } else {
                          Navigator.pushReplacementNamed(context, "/loading", arguments: {
                            "searchtext": searchcontroller.text,
                          });
                        }
                      },
                      child: Container(
                          margin: EdgeInsets.fromLTRB(7, 0, 10, 0),
                          child: Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          )),
                    ),
                    Expanded(
                        child: TextField(
                      controller: searchcontroller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search any City Name"),
                    )),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          // Image.network("src"),
                          Image.network(
                              "https://openweathermap.org/img/wn/$icon@2x.png"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "$desc",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "In $city",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        padding: EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  temp,
                                  style: TextStyle(
                                    fontSize: 90,
                                  ),
                                ),
                                Text(
                                  "C",
                                  style: TextStyle(
                                    fontSize: 40,
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      margin: EdgeInsets.fromLTRB(30, 0, 10, 0),
                      padding: EdgeInsets.all(26),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.wind_beaufort_0),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "$air",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "km/hr",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      margin: EdgeInsets.fromLTRB(10, 0, 30, 0),
                      padding: EdgeInsets.all(26),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.humidity),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "$hum",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "percent",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Data provided by Openweathermap.org",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
