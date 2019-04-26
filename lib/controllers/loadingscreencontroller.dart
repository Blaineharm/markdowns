
import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:markdowns/loading_screen.dart';
import 'package:markdowns/services/markdownInfoWebservice.dart';


class LoadingScreenController extends StatefulWidget {
  @override
  LoadingScreenControllerState createState() => LoadingScreenControllerState();

}

class LoadingScreenControllerState extends State<LoadingScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LoadingScreen(
          initializers: <dynamic>[TimeMessages.timer],
          navigateToWidget: Scaffold(
            appBar: AppBar(
              title: Text('Done'),
            ),
          ),
          loaderColor: Colors.white,
          backgroundColor: Colors.lightBlueAccent,
          styleTextUnderTheLoader: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.lightGreenAccent),
        ));
  }
}

class TimeMessages {
  static Future timer(MessageState state) async {
    print("1");
//    while (true) {
//      await Future.delayed(Duration(seconds: 5), () {
//        state.setMessage = DateTime.now().toIso8601String();
//        return;
//      });
//    }
  }
}