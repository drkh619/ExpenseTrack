import 'dart:convert';
import 'package:expense_dummy/Add_Transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'Data Model/Data_Model3.dart';
import 'main.dart';

class Budget extends StatefulWidget {
  const Budget({Key? key}) : super(key: key);

  @override
  State<Budget> createState() => _BudgetState();

}

class _BudgetState extends State<Budget> {
  var limits = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
       // title: Text('Budget Limit Status'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        height: 300,
        width: 400,
        child: FutureBuilder(
          future: getRequest(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  SizedBox(height: 50),
                  Text(
                    "Budget Limit Status",
                  style: GoogleFonts.poppins(color: Colors.black87,fontSize: 24,fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 50,),
                  Flexible(
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (ctx, index) => Card(
                        child: ListTile(
                          leading: Text(snapshot.data[index].category),
                          trailing: Text(snapshot.data[index].budget_limit_value_send),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<Data_Model3>> getRequest() async {
    String url = "http://$ip_address/Expense_Management/Display_budget_limit.php?uid=$get_id";

    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);
    List<Data_Model3> users = [];
    for (var singleUser in responseData) {
      Data_Model3 user = Data_Model3(
        id: singleUser["id"].toString(),
        category: singleUser["category"].toString(),
        budget_limit_value_send: singleUser["budget_limit_value_send"],
      );
      setState(() {
        limits = users;
      });
      users.add(user);
    }
    return users;
  }
}
