

import 'package:expense_dummy/Home_Page.dart';
import 'package:expense_dummy/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';



import 'login page.dart';
var ip_address = "192.168.18.85";
// var ip_address = " 192.168.0.177"; //integos
var get_username;
var get_id;

var percentage1;
var budget_limit_value_send;


void main() {
  runApp(const MyApp());
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',

      theme: ThemeData(fontFamily: 'poppins'),
     home: Splashscreen(),
        //home: Home_Page(),
      routes: {
        '/log':(context)=>const loginpage(),
      },
    );
  }
}
