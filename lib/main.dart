import 'package:flutter/material.dart';
import 'package:mausam/Activity/home.dart';
import 'package:mausam/Activity/loading.dart';
import 'package:mausam/Activity/location.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/" : (context) =>Loading(),  //default route
      "/home" : (context) =>Home(),  //home route
      "/loading" : (context) => Loading()
    },

  ));
}

