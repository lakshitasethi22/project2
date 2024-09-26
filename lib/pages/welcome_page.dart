import 'package:flutter/material.dart';
import 'second_page.dart'; // Import the second page
import 'enjoy.dart';
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/firstPage.png'), // Update the image path

            Text(
              'Welcome to Our App',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),

            Text(
              'Spin up your backend without managing servers. Effortlessly scale to support millions of users with Firebase databases.',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DotIndicator(isActive: true),
                DotIndicator(isActive: false),
                DotIndicator(isActive: false),
              ],
            ),
            SizedBox(height: 80),

            ElevatedButton(
              onPressed: () {
                // Navigate to the second page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 140, vertical: 12),
              ),
              child: Text('Continue'),
            ),
            SizedBox(height: 10),

            TextButton(
              onPressed: () {
                // Navigate to the second page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EnjoyPage()),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: Text('Skip'),
            ),
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  final bool isActive;

  DotIndicator({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.green : Colors.grey,
      ),
    );
  }
}
