import 'package:flutter/material.dart';
import 'package:trainingapp/pages/register_page.dart';
import 'login.dart'; // Import the login page

class EnjoyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0), // Adjust top padding for system UI
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Heading
            Text(
              'Air Quality Insights',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Description Text
            Text(
              'Here you will find detailed insights about air quality over time.',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),

            // Centered Image
            Image.asset('assets/images/park.png'), // Update the image path

            SizedBox(height: 50),

            // Green Button
            ElevatedButton(
              onPressed: () {
                // Navigate to Login Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 18),
              ),
              child: Text('Create an account'),
            ),
            SizedBox(height: 10),

            // Transparent Button
            TextButton(
              onPressed: () {
                // Navigate to Login Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
