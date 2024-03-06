
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


//import 'ChangePasswordForm.dart';

import 'Budg_Limit.dart';
import 'Home_Page.dart';
import 'package:http/http.dart' as http;
import 'Plan.dart';


import 'Saving.dart';
import 'about_us.dart';
import 'changePassword.dart';
import 'concurrent_request.dart';
import 'confirm_dialog.dart';
import 'feedback.dart';
import 'main.dart';
import 'nested fb.dart';



class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  TextEditingController name_controler = TextEditingController();
  //


  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Menu",
        ),
        backgroundColor: Color(0xff3B5998),
      ),
      body: ListView(
        padding: EdgeInsets.all(
          12.0,
        ),
        children: [

          //
          // ListTile(
          //   onTap: () async {
          //    // String nameEditing = "";
          //     String? name = await showDialog(
          //       context: context,
          //       builder: (context) => AlertDialog(
          //         backgroundColor: Colors.grey[300],
          //         title: Text(
          //           "Enter new name",
          //         ),
          //         content: Container(
          //           decoration: BoxDecoration(
          //             color: Colors.white70,
          //             borderRadius: BorderRadius.circular(
          //               12.0,
          //             ),
          //           ),
          //           padding: EdgeInsets.symmetric(
          //             vertical: 8.0,
          //             horizontal: 16.0,
          //           ),
          //           child: TextFormField(
          //             controller: name_controler,
          //             decoration: InputDecoration(
          //               hintText: get_username,
          //               border: InputBorder.none,
          //             ),
          //             style: TextStyle(
          //               fontSize: 20.0,
          //             ),
          //             maxLength: 12,
          //             onChanged: (val) {
          //             ///  nameEditing = val;
          //             },
          //           ),
          //         ),
          //         actions: [
          //           ElevatedButton(
          //             onPressed: () {
          //           //    Update();
          //               Navigator.of(context).pop();
          //             //  Navigator.of(context).pop(nameEditing);
          //             },
          //             child: Text(
          //               "OK",
          //             ),
          //           ),
          //         ],
          //       ),
          //     );
          //     //
          //     if (name != null && name.isNotEmpty) {
          //       //DbHelper dbHelper = DbHelper();
          //      // await dbHelper.addName(name);
          //     }
          //   },
          //   tileColor: Colors.white,
          //   contentPadding: EdgeInsets.symmetric(
          //     vertical: 12.0,
          //     horizontal: 20.0,
          //   ),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(
          //       8.0,
          //     ),
          //   ),
          //   title: Text(
          //     "Change Name",
          //     style: TextStyle(
          //       fontSize: 20.0,
          //       fontWeight: FontWeight.w800,
          //     ),
          //   ),
          //   subtitle: Text(
          //     "Welcome {newname}",
          //   ),
          //   trailing: Icon(
          //     Icons.change_circle,
          //     size: 32.0,
          //     color: Colors.black87,
          //   ),
          // ),




    //       ListTile(
    //         onTap: ()async{
    //           // bool answer = await showConfirmDialog(context, "Warning",
    //           //     "Do You want to change password?");
    //           // if (answer) {
    //           //   final SharedPreferences sharedpreferences =
    //           //   await SharedPreferences.getInstance();
    //           //   sharedpreferences.remove('admin_id');
    //           //   // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AddName()));
    //           //   Navigator.of(context).pushNamedAndRemoveUntil(
    //           //       '/log', (Route<dynamic> route) => false);
    //           Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) =>  ChangePasswordForm()),
    // );
    //           },
    //
    //
    //
    //
    //
    //
    //         tileColor: Colors.white,
    //         contentPadding: EdgeInsets.symmetric(
    //           vertical: 12.0,
    //           horizontal: 20.0,
    //         ),
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(
    //             8.0,
    //           ),
    //         ),
    //
    //         title: Text(
    //           "Change Password",
    //           style: TextStyle(
    //             fontSize: 20.0,
    //             fontWeight: FontWeight.w800,
    //           ),
    //         ),
    //
    //         // trailing: Icon(
    //         //   Icons.exit_to_app,
    //         //   size: 32.0,
    //         //   color: Colors.black87,
    //         // ),
    //       ),
    //       SizedBox(height: 50,
    //       ),





          ListTile(
            onTap: ()async{
              // final SharedPreferences sharedpreferences =
              // await SharedPreferences.getInstance();
              // sharedpreferences.remove('admin_id');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ChangePasswordPage()),
              );
              // Navigator.of(context).pushNamedAndRemoveUntil('/log', (Route<dynamic> route) => false);

            },



            tileColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            title: Text(
              "Change Password",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),

            trailing: Icon(
              Icons.edit,
              size: 32.0,
              color: Colors.black87,
            ),
          ),
SizedBox(height: 50,),

          ListTile(
            onTap: ()async{
              // final SharedPreferences sharedpreferences =
              // await SharedPreferences.getInstance();
              // sharedpreferences.remove('admin_id');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Budget()),
              );
              // Navigator.of(context).pushNamedAndRemoveUntil('/log', (Route<dynamic> route) => false);

            },



            tileColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            title: Text(
              "Budget Limit",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),

            trailing: Icon(
              Icons.attach_money,
              size: 32.0,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 50,),
          ListTile(
            onTap: ()async{
              // final SharedPreferences sharedpreferences =
              // await SharedPreferences.getInstance();
              // sharedpreferences.remove('admin_id');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ExpenseTrackerApp()),
              );
              // Navigator.of(context).pushNamedAndRemoveUntil('/log', (Route<dynamic> route) => false);

            },



            tileColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            title: Text(
              "Advice",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),

            trailing: Icon(
              Icons.note,
              size: 32.0,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 50,),

          ListTile(
            onTap: ()async{
              // final SharedPreferences sharedpreferences =
              // await SharedPreferences.getInstance();
              // sharedpreferences.remove('admin_id');
              Navigator.push(
                context,
                //MaterialPageRoute(builder: (context) =>  About_us()),
                MaterialPageRoute(builder: (context) =>  GoalSettingPage()),
              );
              // Navigator.of(context).pushNamedAndRemoveUntil('/log', (Route<dynamic> route) => false);

            },



            tileColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            title: Text(
              "Set Goal",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),

            trailing: Icon(
              Icons.app_registration,
              size: 32.0,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 50,),

          ListTile(
            onTap: ()async{
              // final SharedPreferences sharedpreferences =
              // await SharedPreferences.getInstance();
              // sharedpreferences.remove('admin_id');
              Navigator.push(
                context,
                //MaterialPageRoute(builder: (context) =>  About_us()),
                MaterialPageRoute(builder: (context) =>  About_us()),
              );
              // Navigator.of(context).pushNamedAndRemoveUntil('/log', (Route<dynamic> route) => false);

            },



            tileColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            title: Text(
              "About Us",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),

            trailing: Icon(
              Icons.info_outline_rounded,
              size: 32.0,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 50,),

          ListTile(
            onTap: ()async{
              // final SharedPreferences sharedpreferences =
              // await SharedPreferences.getInstance();
              // sharedpreferences.remove('admin_id');
              Navigator.push(
                context,
                //MaterialPageRoute(builder: (context) =>  About_us()),
                MaterialPageRoute(builder: (context) =>  OrgFeedbackPage()),
              );
              // Navigator.of(context).pushNamedAndRemoveUntil('/log', (Route<dynamic> route) => false);

            },



            tileColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            title: Text(
              "Feedback",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),

            trailing: Icon(
              Icons.feedback,
              size: 32.0,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 50,),

          ListTile(
            onTap: () async {
              bool answer = await showConfirmDialog(context, "Warning",
                  "This is irreversible. Your entire data will be Lost");
              if (answer) {
                // await dbHelper.cleanData();
                await delrecord();
                Navigator.of(context).pop();
              }
            },
            tileColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            title: Text(
              "Clean Data",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            subtitle: Text(
              "This is irreversible",
            ),
            trailing: Icon(
              Icons.delete_forever,
              size: 32.0,
              color: Colors.black87,
            ),
          ),
          //
          SizedBox(
            height: 20.0,
          ),

          //

          // SizedBox(
          //   height: 20.0,
          // ),
          ListTile(
            onTap: ()async{
              bool answer = await showConfirmDialog(context, "Warning",
                  "Do You Want To Log Out?");
              if (answer) {
                final SharedPreferences sharedpreferences =
                await SharedPreferences.getInstance();
                sharedpreferences.remove('admin_id');
                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AddName()));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/log', (Route<dynamic> route) => false);
              }

            },



            tileColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),

            title: Text(
              "Logout",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),

            trailing: Icon(
              Icons.exit_to_app,
              size: 32.0,
              color: Colors.black87,
            ),
          ),



          // ListTile(
          //   onTap: ()async{
          //     final SharedPreferences sharedpreferences =
          //     await SharedPreferences.getInstance();
          //     sharedpreferences.remove('admin_id');
          //    Navigator.push(
          //      context,
          //      MaterialPageRoute(builder: (context) => ChangePasswordPage()),
          //     );
          //     // Navigator.of(context).pushNamedAndRemoveUntil('/log', (Route<dynamic> route) => false);
          //
          //   },
          //
          //
          //
          //   tileColor: Colors.white,
          //   contentPadding: EdgeInsets.symmetric(
          //     vertical: 12.0,
          //     horizontal: 20.0,
          //   ),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(
          //       8.0,
          //     ),
          //   ),
          //   title: Text(
          //     "Change Password",
          //     style: TextStyle(
          //       fontSize: 20.0,
          //       fontWeight: FontWeight.w800,
          //     ),
          //   ),
          //
          //   trailing: Icon(
          //     Icons.info_outline_rounded,
          //     size: 32.0,
          //     color: Colors.black87,
          //   ),
          // ),





        ],
      ),
    );
  }

  Future<void> delrecord() async {
    String url = "http://$ip_address/Expense_Management/Clean_all_data.php";
    var res = await http.post(Uri.parse(url), body: {

    });
    var resoponse = jsonDecode(res.body);
    if (resoponse["success"] == "true") {
      setState(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home_Page()));
      });
      print("success");
    }
  }






}
