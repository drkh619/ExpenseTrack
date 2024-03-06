import 'main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class OrgFeedbackPage extends StatefulWidget {
  @override
  _OrgFeedbackPageState createState() => _OrgFeedbackPageState();
}

class _OrgFeedbackPageState extends State<OrgFeedbackPage> {
  TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Feedback',style: GoogleFonts.poppins(),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We\'d love to hear your feedback!',
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black

              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _feedbackController,
              decoration: InputDecoration(
                labelText: 'Your feedback',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
              textCapitalization: TextCapitalization.sentences, // Capitalize first letter of each sentence
              textInputAction: TextInputAction.done, // Change keyboard action to Done
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed:_submitFeedback,
                // Disable the button if feedback submission is not allowed
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor, // Change button color based on feedback submission allowance
                  elevation: 3, // Add some elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Set button border radius
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }



  Future<void> _submitFeedback() async {
    final String url = 'http://$ip_address/Expense_Management/feedback.php';

    // Send the feedback to the server
    final response = await http.post(
      Uri.parse(url),
      body: {
        'feedback': _feedbackController.text,
        'uid': get_id,
        'user':get_username,
        // Add any additional parameters needed for the API
      },
    );

    if (response.statusCode == 200) {
      // Handle successful feedback submission
      // Display a confirmation dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Feedback Submitted'),
            content: Column(
              children: [
                Text('Thank you for your feedback!'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Handle errors if any
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to submit feedback. Please try again later.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
}