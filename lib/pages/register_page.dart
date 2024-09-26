import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isNameFocused = false;
  bool _isEmailFocused = false;
  bool _isPasswordFocused = false;

  bool _isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  Future<void> _register() async {
    if (_nameController.text.isEmpty || !_isValidEmail(_emailController.text) || _passwordController.text.length < 8) {
      return; // Validate input
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'name': _nameController.text,
        'email': _emailController.text,
      });
      // Clear the input fields
      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration successful!')));
    } catch (e) {
      // Handle registration error (show a message to the user)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration failed: $e')));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back Button
                    IconButton(
                      icon: Image.asset('assets/images/backbutton.png'),
                      onPressed: () {
                        Navigator.pop(context); // Navigate back to LoginPage
                      },
                    ),
                    SizedBox(height: 20),

                    // Heading
                    Text(
                      'Register Here',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 10),

                    // Description Text
                    Text(
                      'All fields are mandatory',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 40),

                    // Name Input
                    Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          _isNameFocused = hasFocus;
                        });
                      },
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: _isNameFocused ? Colors.green : Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Email Input
                    Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          _isEmailFocused = hasFocus;
                        });
                      },
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'name@email.com',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: _isEmailFocused ? Colors.green : Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Password Input
                    Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          _isPasswordFocused = hasFocus;
                        });
                      },
                      child: TextField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Your password',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: _isPasswordFocused ? Colors.green : Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),

                    // Green Register Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (_nameController.text.isNotEmpty &&
                            _isValidEmail(_emailController.text) &&
                            _passwordController.text.length >= 8)
                            ? _register // Call the register method
                            : null,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: (_nameController.text.isNotEmpty &&
                              _isValidEmail(_emailController.text) &&
                              _passwordController.text.length >= 8)
                              ? Colors.green
                              : Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 18),
                        ),
                        child: Text('Register'),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Divider with "or"
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('or'),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),

                    SizedBox(height: 20),

                    // Google Register Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Perform Google register action
                          print('Register with Google button pressed');
                        },
                        icon: Image.asset(
                          'assets/images/google_icon.png',
                          height: 24,
                        ),
                        label: Text('Register with Google'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Already have an account? Login prompt
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ", style: TextStyle(color: Colors.black)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigate back to LoginPage
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
