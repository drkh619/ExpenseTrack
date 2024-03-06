import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:lottie/lottie.dart';
class About_us  extends StatefulWidget {
  const About_us ({Key? key}) : super(key: key);

  @override
  State<About_us> createState() => _sampleState();
}

class _sampleState extends State<About_us> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(flex: 2, child: Container(color: Theme.of(context).brightness == Brightness.dark ? Colors.purple.shade500 : Color(0xff3B5998),)),
            Expanded(child: Container(color: Theme.of(context).brightness == Brightness.dark ? Color(0xFF121212) : Colors.white)),
          ],
        ),
        Align(
          alignment: Alignment(0, 0.2),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 1.2,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              elevation: 12,
              child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                         'assets/card-payment.png',
                         height: 90,
                         width: 100,
                       ),
                        // Padding(
                        //   padding: EdgeInsets.all(20),
                        //   child: Text(
                        //     "Tech4Good",
                        //     style: GoogleFonts.alexandria(
                        //       color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                        //       fontSize: 30.0,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            "Welcome to ExTracker, your trusted companion in financial management and awareness. \nAt Expense Tracker, we believe that understanding and controlling your expenses is the key to achieving your financial goals. Our app is designed with simplicity and effectiveness in mind, empowering individuals to take charge of their finances anytime, anywhere.\nWe provide a user-friendly and comprehensive solution for expense tracking, categorization, analysis, and control."
                            "\n\n--Smart Categorization\nExpense Tracker provides a pre-defined list of categories, but we understand everyone's spending habits are unique. Customize your expense categories to align with your lifestyle, giving you a deeper understanding of your spending patterns.\n\nDownload Expense Tracker now and take the first step towards a financially secure future.\nThank you for choosing ExTracker!",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15,
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ],
                    ),
                  )
              ),
            ),
          ),
        ),
     ],
    );
  }
}