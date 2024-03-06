import 'dart:convert';

import 'package:expense_dummy/Home_Page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'Add_Custom_category.dart';
import 'package:http/http.dart' as http;

import 'Data Model/Data_Model.dart';
import 'Data Model/Data_Model2.dart';
import 'Data Model/Data_Model3.dart';
import 'list _Test.dart';
import 'main.dart';

class AddExpenseNoGradient extends StatefulWidget {
  const AddExpenseNoGradient({Key? key}) : super(key: key);

  @override
  _AddExpenseNoGradientState createState() => _AddExpenseNoGradientState();
}

class _AddExpenseNoGradientState extends State<AddExpenseNoGradient> {
  TextEditingController budget_controller = TextEditingController();

  var test;
  var test1;
  var test2;
  var test3;
  var test4;

  @override
  void initState() {
    budget_limit_value_send = '';
    percentage1;

    getRequest1();
    print(DateFormat('yyyy-MM').format(selectedDate));

    budget_item;

    // TODO: implement initState
    super.initState();
    getAllCategory();
    // List<String> defaultCategories = ['Entertainment', 'Food', 'Transport'];
    // allCategories = [...defaultCategories, ...categoryItemList.map((category) => category['category']).toList()];
  }

  var  hascontain_sal;

  String? selectedValue;
  var categoryItemList = [];
  var category_item = [];
  var budget_item;
  var limits = [];


  Future getAllCategory() async {
    var url = "http://$ip_address/Expense_Management/display_Custom_category.php?uid=$get_id";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categoryItemList = jsonData;
        List<String> defaultCategories = ['Entertainment', 'Food', 'Transport','Salary'];
        List<String> allCategories = [...defaultCategories, ...categoryItemList.map((category) => category['category']).toList()];
        // Update the dropdown items with all categories
        setState(() {
          categoryItemList = allCategories;
          print(categoryItemList);
        });
      });
    }
  }

  List<String> allCategories = [];

  Future<List<Data_Model1>> getRequest1() async {
    //replace your restFull API here.
    String url =
        "http://$ip_address/Expense_Management/Display_budget_limit.php?uid=$get_id";

    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);
    setState(() {
      category_item = responseData;
      hascontain_sal = category_item.contains('salary');
    });

    //Creating a list to store input data;
    List<Data_Model1> users = [];
    for (var singleUser in responseData) {
      Data_Model1 user = Data_Model1(
        id: singleUser["id"].toString(),
        category: singleUser["category"].toString(),
        budget_limit: singleUser["budget_limit"].toString(),
      );

      users.add(user);
    }
    return users;
  }

  DateTime selectedDate = DateTime.now();
  dynamic amount;
  dynamic note = "Expense";
  dynamic type = "Income";

  // List<dynamic> category=[
  //   "shop"
  //   "food"
  //   "travel"
  // ];

  List<dynamic> months = [
    "null",
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final category = limits.map((limits) {
      final category_val = limits.category.toString();
      final budget_val = limits.budget_limit_value_send.toString();



      return Row(
        children: [

          category_val.contains('salary') ? Text(test=budget_val)  :
          category_val.contains('food') ? Text(test1=budget_val)  :
          category_val.contains('shopping') ? Text(test2=budget_val)  :
          category_val.contains('transportation') ? Text(test3=budget_val)  :
          category_val.contains('entertainment') ? Text(test4=budget_val)  :


          Text("no"),

          // selectedValue == 'salary' ? budget_controller.text =
          //     budget_controller.text=budget_val
          //
          //     :


        ],
      );

    }).toList();


    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 0.0,
      // ),
      backgroundColor: Colors.white,
      //
      body: ListView(
        padding: EdgeInsets.only(
            left:20, bottom: 0, right: 20, top:0
        ),

        children: [
          SizedBox(height: 60,),
          //Image.asset("assets/earning.png",height: 30,width: 50,alignment: Alignment.topLeft,),
          Text(
            "\n  Add Transaction ",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(color: Colors.black87,fontSize: 25,fontWeight: FontWeight.bold),
            // style: TextStyle(
            //   fontSize: 32.0,
            //   fontWeight: FontWeight.w700,
            // ),
          ),
          //
          SizedBox(
            height: 20.0,
          ),
          //
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  //  color: Static.PrimaryColor,
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                ),
                padding: EdgeInsets.all(
                  12.0,
                ),
                child: Icon(
                  Icons.attach_money,
                  size: 26.0,
                  // color: Colors.grey[700],
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                width: 12.0,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "0",hintStyle: TextStyle(color: Colors.black87,fontSize: 20),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  onChanged: (val) {
                    try {
                      amount = int.parse(val);

                      amount >= 10 && amount <= 100
                          ? percentage1 = '20'
                          : amount >= 110 && amount <= 200
                          ? percentage1 = '40'
                          : amount >= 210 && amount <= 400
                          ? percentage1 = '60'
                          : amount >= 410 && amount <= 500
                          ? percentage1 = '80'
                          : amount == 500
                          ? 'budget exceeded'
                          : "no";
                    } catch (e) {
                      // show Error
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          duration: Duration(
                            seconds: 2,
                          ),
                          content: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                "Enter only Numbers as Amount",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  // textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          //
          SizedBox(
            height: 20.0,
          ),
          //

          //
          // TextFormField(
          //   controller: budget_controller,
          // ),
          //
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  //   color: Static.PrimaryColor,
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                ),
                padding: EdgeInsets.all(
                  12.0,
                ),
                child: Icon(
                  Icons.category_outlined,
                  size: 24.0,
                  // color: Colors.grey[700],
                  color: Colors.black87,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 20),
                  child: DropdownButtonFormField(
                    hint: Text(
                      "Select your category",
                      style: GoogleFonts.poppins(color: Colors.black87),
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    dropdownColor: Color(0xffe2e7ef),
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;

                        // Update budget controller text based on selected category
                        if (newValue == 'salary') {
                          budget_controller.text = test;
                        } else if (newValue == 'food') {
                          budget_controller.text = test1;
                        } else if (newValue == 'shopping') {
                          budget_controller.text = test2;
                        } else if (newValue == 'transportation') {
                          budget_controller.text = test3;
                        } else if (newValue == 'entertainment') {
                          budget_controller.text = test4;
                        } else {
                          budget_controller.text = ''; // Reset to empty text
                        }
                      });
                    },
                    items: categoryItemList.map((category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                  ),
                ),
              ),

            ],
          ),

          //  Text(dropdownValue),

          // selectedValue == 'salary'
          //     ? SizedBox(
          //         height: 5,
          //       )
          //     :
          type == "Expense" ?
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.monetization_on,
                  color: Colors.black87,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 25, right: 20, top: 20),
                  child: TextFormField(
                    controller: budget_controller,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a Budget Limit";
                      }
                      return null;
                    },
                    onSaved: (name) {},
                    obscureText: false,
                    decoration: InputDecoration(
                      label: Text("Set Budget Limit",style: GoogleFonts.poppins(color: Colors.black87),),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            // color: Colors.grey[400],
                            color: Colors.black87,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade500,
                          )),
                    ),
                  ),
                ),
              ),
            ],
          )
          :
          (() {
            budget_controller.text = "Income";
            return SizedBox(height: 0);
          }()),
          SizedBox(height: 10,),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  //   color: Static.PrimaryColor,
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                ),
                padding: EdgeInsets.all(
                  12.0,
                ),
                child: Icon(
                  Icons.description_outlined,
                  size: 24.0,
                  // color: Colors.grey[700],
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                width: 12.0,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Note on Transaction",hintStyle: GoogleFonts.poppins(color: Colors.black87,fontSize: 18),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  onChanged: (val) {
                    note = val;
                  },
                ),
              ),
            ],
          ),
          //
          SizedBox(
            height: 20.0,
          ),
          //
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  //    color: Static.PrimaryColor,
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                ),
                padding: EdgeInsets.all(
                  12.0,
                ),
                child: Icon(
                  Icons.wallet,
                  size: 24.0,
                  // color: Colors.grey[700],
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                width: 12.0,
              ),
              ChoiceChip(
                label: Text(
                  "Income",
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,fontWeight: FontWeight.w500,
                    color: type == "Income" ? Colors.white : Colors.black,
                  ),
                ),
                selectedColor: Color(0xff3B5998),
                onSelected: (val) {
                  if (val) {
                    setState(() {
                      type = "Income";
                      if (note.isEmpty || note == "Expense") {
                        note = 'Income';
                      }
                    });
                  }
                },
                selected: type == "Income" ? true : false,
              ),
              SizedBox(
                width: 8.0,
              ),
              ChoiceChip(
                label: Text(
                  "Expense",
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,fontWeight: FontWeight.w500,
                    color: type == "Expense" ? Colors.white : Colors.black,
                  ),
                ),
                selectedColor: Color(0xff3B5998),
                onSelected: (val) {
                  if (val) {
                    setState(() {
                      type = "Expense";

                      if (note.isEmpty || note == "Income") {
                        note = 'Expense';
                      }
                    });
                  }
                },
                selected: type == "Expense" ? true : false,
              ),
            ],
          ),
          //
          SizedBox(
            height: 20.0,
          ),
          //
          SizedBox(
            height: 50.0,
            child: TextButton(
              onPressed: () {
                _selectDate(context);
                //
                // to make sure that no keyboard is shown after selecting Date
                FocusScope.of(context).unfocus();
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.zero,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // color: Static.PrimaryColor,
                      borderRadius: BorderRadius.circular(
                        16.0,
                      ),
                    ),
                    padding: EdgeInsets.all(
                      12.0,
                    ),
                    child: Icon(
                      Icons.date_range_outlined,
                      size: 24.0,
                      // color: Colors.grey[700],
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    // "${selectedDate.day } - ${selectedDate.month} -${selectedDate.year} ",
                    "${selectedDate.day} ${months[selectedDate.month]}",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 20.0,
          ),
          //
          //
          // category_item == 'shopping' && budget_item =='2000' ? Text(""):
          // TextButton(onPressed: (){}, child: Text("add")),
          //
          // category_item == 'food' && budget_item =='500' ? Text(""):
          // TextButton(onPressed: (){}, child: Text("add")),

          SizedBox(
            width: 300,
            height: 65.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff3B5998),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
              onPressed: () {
                print("Type = "+type);
                if (amount != null) {
                  print(category_item);
                  print(budget_item);

                  setState(() {
                    Submit();

                    selectedValue == 'salary' && amount > 20000
                        ? print("limited")
                        : print("go");
                    selectedValue == 'shopping' && amount > 5000
                        ? print("limited")
                        : print("go");
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red[700],
                      content: Text(
                        "Please enter a valid Amount !",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }
              },
              child: Text(
                "Add",
                style: GoogleFonts.poppins(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 300,
            height: 65.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff3B5998),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Custom_category()));
              },
              child: Text(
                "Add Custom Category",
                style: GoogleFonts.poppins(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 50,
          ),


        ],
      ),
    );
  }

  Future Submit() async {
    var APIURL = "http://$ip_address/Expense_Management/Add_transaction.php";

    //json maping user entered details
    Map maped_data = {
      'amount': amount.toString(),
      'type': type.toString(),
      'date': DateFormat('yyyy-MM-dd').format(selectedDate),
      'note': note.toString(),
      'category': selectedValue,
      'budget_limit_value_send': budget_controller.text,
      'uid': get_id,
      'monthyear': DateFormat('yyyy-MM').format(selectedDate),
    };
    //send  data using http post to our php code
    http.Response reponse =
    await http.post(Uri.parse(APIURL), body: maped_data);

    //getting response from php code, here
    var data = jsonDecode(reponse.body);
    var responseMessage = data["message"];
    var responseError = data["error"];

    // print("DATA: ${data}");
    print(data);

    if (responseError) {
      setState(() {});
    } else {
      setState(() {});
      Fluttertoast.showToast(
          msg: "Add successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home_Page()));
    }
  }
}
