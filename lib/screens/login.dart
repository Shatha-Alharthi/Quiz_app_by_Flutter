import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/catagory_screen.dart';
import 'package:flutter_application_1/utils/global_variable.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/loginBackground.png"), // Change to your background image path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 85,
                  ),
                  Image.asset(
                    "assets/logo.png",
                    height: 270,
                    width: 270,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Hello, welcome back!",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'RumRaisin',
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: TextFormField(
                      controller: userNameController,
                      validator: (textFromUserName) {
                        if (textFromUserName!.isEmpty) {
                          return "Please write your name";
                        } else if (!textFromUserName.startsWith(RegExp(r'[A-Z]'))) {
                          return "The first letter should be capital";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'UserName',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      // validator: (textFromPassword) {
                      //   //password validation logic here
                      // },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xC77614B8),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor: Color(0xFF9C32E3), // Change to your desired color
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) => const CategoryScreen(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 21.0,
                              fontFamily: 'Joan',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "No account? ",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign up now",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(200, 118, 20, 184),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/google_logo.png",
                        height: 55,
                        width: 55,
                      ),
                      Image.asset(
                        "assets/linkedin1.png",
                        height: 60,
                        width: 60,
                      ),
                      Image.asset(
                        "assets/facebook.png",
                        height: 40,
                        width: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
