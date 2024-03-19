import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  double getPaddingSize(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide * 0.07; // 5% of shortest side
  }

  Widget buildTextField({
    required BuildContext context,
    required String labelText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        obscureText: obscureText,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {Navigator.pushNamed(context, '/category');},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.0),
        ),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 21.0, fontFamily: 'RumRaisin', fontWeight: FontWeight.bold,),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(getPaddingSize(context)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50.0), // Add a SizedBox to create space at the top
              Image.asset('assets/logo.png',  fit: BoxFit.contain), // Add your logo here
              SizedBox(height: 20.0),
              Text(
                'Hello, welcome back!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'RumRaisin',),
                textAlign: TextAlign.center,
                
              ),
              SizedBox(height: 20.0),
              buildTextField(context: context, labelText: 'User name', icon: Icons.person),
              SizedBox(height: 10.0), // Added SizedBox to create space between fields
              buildTextField(context: context, labelText: 'Password', icon: Icons.lock, obscureText: true),
              SizedBox(height: 20.0), // Added SizedBox to create space between field and button
              buildButton(context),
            
            ],
          ),
        ),
      ),
    );
  }
}
