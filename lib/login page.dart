import 'dart:convert';
import 'package:expense_dummy/splashscreen.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'Registration.dart';
import 'Home_Page.dart';
import 'package:http/http.dart' as http;

import 'about_us.dart';
import 'main.dart';
import 'package:google_fonts/google_fonts.dart';



class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  // void _toggle(){
  //   setState(() {
  //     _obscureText = !_obscureText;
  //   });
  // }

  Get_Usrname() async {
    final _CustomersharedPrefs = await SharedPreferences.getInstance();
    await _CustomersharedPrefs.setString("username",get_username);
  }

  Get_Id() async {
    final _CustomersharedPrefs = await SharedPreferences.getInstance();
    await _CustomersharedPrefs.setString("id",get_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

       // title: Image.asset('assets/cool.png',height: 50,width: 50,),
        backgroundColor: Colors.white,
        elevation: 0,

      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 150),
           //Image.asset("assets/end-user.png",height: 170,width: 170,),
            Text("Login", style: GoogleFonts.poppins(color: Colors.black87,fontSize: 28,fontWeight: FontWeight.bold),),


            Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 32.0, right: 32.0, top: 15, bottom: 0),
                    child: TextFormField(
                      controller: username,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter username";
                        }
                        return null;
                      },
                      onSaved: (username) {},
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1, color: Colors.black87),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          // labelText: 'Email',
                          hintText: 'Username',hintStyle: GoogleFonts.poppins(fontSize:14,color: Colors.black87,)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 32.0, right: 32.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: password,

                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                      onSaved: (name) {},
                      style: TextStyle(),
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: (){
                              setState(() {
                                _obscureText=!_obscureText;
                              });

                            },
                          ),

                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1, color: Colors.black87),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          labelText: 'Password',labelStyle: GoogleFonts.poppins(fontSize:14,color: Colors.black87,),
                          hintText: 'Enter secure password'),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 55,),

            SizedBox(
              // height: MediaQuery.of(context).size.height / 15,
              // width: MediaQuery.of(context).size.width / 1.3,
              width: 325,
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),

                  primary: Color(0xff3B5998),
                  //Color(0xff151B54),

                ),
                // style: ButtonStyle(
                //   shape: MaterialStateProperty.all(
                //     RoundedRectangleBorder(
                //       // Change your radius here
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //   ),
                // ),
                onPressed: ()
                //async
                {
                  setState(() {
                    admin_Login();
                  });

                  if (formkey.currentState!.validate()) {
                    print("session id is $key_value");

                  }
                },
                // child: Text(
                //   'Login',
                //   style: TextStyle(color: Colors.white, fontSize: 18),
                //
                // ),
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(color:Colors.white,fontSize: 18.5),
                ),

              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New User?',
                  //style: TextStyle(color: Colors.black87, fontSize: 15),
                  style: GoogleFonts.poppins(color:Colors.black87,fontSize: 17),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>   Registration()));
                              //builder: (context) =>   About_us()));

                    },
                    child: Text("Create Account",//style: TextStyle(color:  Color(0xff151B54),fontWeight: FontWeight.w400),
                      style: GoogleFonts.poppins(color:Color(0xff151B54),fontSize: 15),  ))
              ],
            )
          ],
        ),
      ),
    );
  }


  Future admin_Login() async {
    var url = "http://$ip_address/Expense_Management/Login.php";
    var response = await http.post(Uri.parse(url), headers: {
      'Accept': 'application/json'
    }, body: {
      "username": username.text,
      "password": password.text,
    });

    var data = json.decode(response.body);
    // if (data.toString() == "Success") {
    if (data != null) {
      //var responseData = json.decode(response.body);

      for (var singleUser in data) {
        final SharedPreferences sharedpreferences =
        await SharedPreferences.getInstance();

        await sharedpreferences.setString('admin_id', singleUser["id"]);

        // admin_id = singleUser["id"];
        //
        get_username = singleUser["username"];
        get_id =singleUser["id"];
        // print('hello click ${email_text_admin}');
        //
        // // getid = singleUser["id"];
        //
        Get_Id();
         Get_Usrname();
      }

      final snackBar = SnackBar(
        content: Text('Login Successfull'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  Home_Page()));
    } else {
      final snackBar = SnackBar(
        content: Text('Username and password invalid'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}


