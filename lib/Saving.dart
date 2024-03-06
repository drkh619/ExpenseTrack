import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'package:intl/intl.dart';

class GoalSettingPage extends StatefulWidget {
  @override
  _GoalSettingPageState createState() => _GoalSettingPageState();
}

class _GoalSettingPageState extends State<GoalSettingPage> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  List<dynamic> _goals = [];

  Future<void> _fetchGoals() async {
    final response = await http.get(
      Uri.parse('http://$ip_address/Expense_Management/savings.php?uid=$get_id'),
    );

    if (response.statusCode == 200) {
      setState(() {
        _goals = jsonDecode(response.body);
      });
    } else {
      // Handle error
      print('Failed to fetch goals');
    }
  }

  void _clearTextFields() {
    _amountController.clear();
    _categoryController.clear();
    _deadlineController.clear();
  }

  Future<void> _addGoal() async {
    final response = await http.post(
      Uri.parse('http://$ip_address/Expense_Management/savings.php?'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'goal_amount': _amountController.text,
        'goal_category': _categoryController.text,
        'deadline': DateFormat('yyyy-MM-dd').format(_selectedDate),
        'uid': get_id,
      }),
    );

    if (response.statusCode == 200) {
      // Goal added successfully, refresh goals list
      _fetchGoals();
      _clearTextFields();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blue[700],
          content: Text(
            "Successfully Added Goal!",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      );
      print('Goal added successfully');
    } else {
      // Error adding goal
      print('Failed to add goal');
    }
  }

  Future<void> _deleteGoal(int id) async {
    String url='http://$ip_address/Expense_Management/delete_goal.php?id=$id';

    final response = await http.delete(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red[700],
          content: Text(
            "Goal Deleted Successfully!",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      );
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GoalSettingPage()),
      );
      print('Goal deleted successfully');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red[700],
          content: Text(
            "Error Occured Please Try Again Later!",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      );
      print('Failed to delete goal');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchGoals();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _deadlineController.text = DateFormat('yyyy-MM-dd').format(_selectedDate);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Goal",style: GoogleFonts.poppins(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.w500),),
            SizedBox(height: 50,),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Goal Amount',prefix: Text('₹ '),),
            ),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Goal Name'),
            ),
            TextField(
              controller: _deadlineController,
              decoration: InputDecoration(labelText: 'Deadline'),
              onTap: () => _selectDate(context),
              readOnly: true,
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: 360,
              height: 60,
              child: ElevatedButton(
                onPressed: _addGoal,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),

                  primary: Color(0xff3B5998),
                ),
                child: Text('Set Goal'),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Your Goals:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _goals.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_goals[index]['goal_category']),
                    subtitle: Text('Amount: ${_goals[index]['goal_amount']} | Deadline: ${_goals[index]['deadline']}'),
                    trailing: GestureDetector(
                      onTap: () => _deleteGoal(int.parse(_goals[index]['id'])),
                      child: Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
