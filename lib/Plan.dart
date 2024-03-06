import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExpenseTrackerHomePage(),
    );
  }
}

class ExpenseTrackerHomePage extends StatefulWidget {
  @override
  _ExpenseTrackerHomePageState createState() => _ExpenseTrackerHomePageState();
}

class _ExpenseTrackerHomePageState extends State<ExpenseTrackerHomePage> {
  final TextEditingController _salaryController = TextEditingController();
  double _salary = 0;
  double _foodPercentage = 0.15;
  double _shoppingPercentage = 0.15;
  double _entertainmentPercentage = 0.1;
  double _travelPercentage = 0.15;
  double _otherPercentage=0.25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        // title: Image.asset('assets/cool.png',height: 50,width: 50,),
        backgroundColor: Colors.white,
        elevation: 0,

      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 150,),
              TextFormField(
                controller: _salaryController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 1, color: Colors.black87),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    // labelText: 'Email',
                    hintText: 'Enter your salary',hintStyle: GoogleFonts.poppins(fontSize:14,color: Colors.black87,)),
              ),
              SizedBox(height: 40),

              SizedBox(
                width: 345,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _salary = double.tryParse(_salaryController.text) ?? 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),

                    primary: Color(0xff3B5998),
                    //Color(0xff151B54),

                  ),
                  child: Text('Submit'),
                ),
              ),
              SizedBox(height: 40),
              Text('Advice on Spending:',style: GoogleFonts.poppins(color: Colors.black87,fontSize: 14,fontWeight: FontWeight.w500),),
              SizedBox(height: 20),
              AdviceCard(
                category: 'Food',
                percentage: _foodPercentage,
                amount: _salary * _foodPercentage,
              ),
              AdviceCard(
                category: 'Shopping',
                percentage: _shoppingPercentage,
                amount: _salary * _shoppingPercentage,
              ),
              AdviceCard(
                category: 'Entertainment',
                percentage: _entertainmentPercentage,
                amount: _salary * _entertainmentPercentage,
              ),
              AdviceCard(
                category: 'Travel',
                percentage: _travelPercentage,
                amount: _salary * _travelPercentage,
              ),
              AdviceCard(
                category: 'Others',
                percentage: _otherPercentage,
                amount: _salary * _otherPercentage,
              ),
              SizedBox(height: 40),
              Text(
                'You Saved: ${(_salary - (_salary * _foodPercentage) - (_salary * _shoppingPercentage) - (_salary * _entertainmentPercentage) - (_salary * _travelPercentage)- (_salary * _otherPercentage)).toStringAsFixed(2)}',style: GoogleFonts.poppins(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.w500),

              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdviceCard extends StatelessWidget {
  final String category;
  final double percentage;
  final double amount;

  const AdviceCard({
    Key? key,
    required this.category,
    required this.percentage,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Allocate ${percentage * 100} % of your salary  ( ${amount.toStringAsFixed(2)}) to $category.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
