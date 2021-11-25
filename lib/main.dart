import 'package:flutter/material.dart';
import 'dart:core';
import 'MyHomePage.dart';
import 'dart:math';

void main() {
  runApp(Room());
}

class Room extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '오마상',
      theme: ThemeData(
        primaryColor:Color(0xFF538cc4),
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}
String emp="startapp";
String userMessage="startapp";
String botMessage="";
String botMessage2="";
String botMessage3="";
String botMessage4="";
String botMessage5="";
String botMessage6="";
String viewData="";
int rand=Random().nextInt(5)+1;
int count=0;
bool selected = false;
