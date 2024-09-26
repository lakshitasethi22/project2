import 'package:flutter/material.dart';
// import 'second_page.dart'; // Import the second page
import 'third_page.dart';
import 'enjoy.dart';
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/secondPage.png'),

            Text(
              'Interactive Map View Mode',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),

            Text(
              'Identify areas with clean air and areas that require extra attention to maintain your health.',
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
                DotIndicator(isActive: false),
                DotIndicator(isActive: true),
                DotIndicator(isActive: false),
              ],
            ),
            SizedBox(height: 80),

            ElevatedButton(
              onPressed: () {
                // Navigate to the second page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => thirdPage()),
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


// import 'package:flutter/material.dart';
//
// class SecondPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Centered Image
//             Image.asset('assets/images/secondPage.png'),
//
//             // Heading
//             Text(
//               'Interactive Map View Mode',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 24,
//               ),
//             ),
//             SizedBox(height: 20),
//
//             // Description Text
//             Text(
//               'Identify areas with clean air and areas that require extra attention to maintain your health.',
//               style: TextStyle(
//                 color: Colors.black54,
//                 fontSize: 16,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 50),
//
//             // Slider
//             Slider(
//               value: 50,
//               min: 0,
//               max: 100,
//               divisions: 100,
//               label: 'Slider Label',
//               onChanged: (double value) {
//                 // Handle slider changes
//               },
//             ),
//             SizedBox(height: 50),
//
//             // Green Button
//             ElevatedButton(
//               onPressed: () {
//                 // Action for the button
//               },
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 backgroundColor: Colors.green,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 140, vertical: 12),
//               ),
//               child: Text('Continue'),
//             ),
//             SizedBox(height: 10),
//
//             // Transparent Button
//             TextButton(
//               onPressed: () {
//                 // Action for the second button (e.g., Skip)
//               },
//               style: TextButton.styleFrom(
//                 foregroundColor: Colors.green,
//                 backgroundColor: Colors.transparent,
//                 padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//               ),
//               child: Text('Skip'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



//sliverAppBar