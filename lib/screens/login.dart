import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/screens/catagory_screen.dart';
import 'package:flutter_application_1/utils/global_variable.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                Image.asset(
                  "assets/logo.png",
                  height: 300,
                  width: 300,
                ),
                SizedBox(
                  height: 30,
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
                  height: 30,
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
                    border: Border.all(color: Color.fromARGB(255, 80, 79, 79)),
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
                  height: 60,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
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
                          "Login",
                          style: TextStyle(
                            fontSize: 21.0,
                            fontFamily: 'RumRaisin',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/gmail1.png",
                      height: 55,
                      width: 55,
                    ),
                    Image.asset(
                      "assets/linkedin1.png",
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
