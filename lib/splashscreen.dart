import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home_Page.dart';
import 'about_us.dart';
import 'login page.dart';
import 'main.dart';



var key_value;
var Admin_key;

class Splashscreen extends StatefulWidget {
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  void initState() {
    getValidationData().whenComplete(() async {
      await Timer(Duration(seconds: 3), () {
        Admin_key == null
            ? Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => loginpage()))
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Home_Page()));
                        //  loginpage()));
                   // About_us()));
      });
    });
    setState(() {
      Get_Username();
      Get_Id();

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/card-payment.png",height: 100,width: 90,),
            Text(
              "ExTracker - The road to financial clarity..",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),
            ),

            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: Colors.lightBlue,
            ),
          ],
        ),
      ),
    );
  }


  Future getValidationData() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtainedemail = await sharedprefs.getString('admin_id');
    setState(() {
      Admin_key = obtainedemail;
    });
    print('thisis service  value $Admin_key');
  }


  Get_Username() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtain_admin = await sharedprefs.getString('username');

    setState(() {});
    get_username = obtain_admin;
  }


  Get_Id() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtain_admin = await sharedprefs.getString('id');

    setState(() {});
    get_id = obtain_admin;
  }

}
