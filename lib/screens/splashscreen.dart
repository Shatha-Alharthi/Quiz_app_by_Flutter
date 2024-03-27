import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';



class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/new_background1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height) * 0.25,
            ),
            Image.asset(
              "assets/logo.png",
              height: 240,
              width: 230,
            ),
            Text(
              "Quizz",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 48.0,
                fontFamily: "Joan",
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "quiz application to train your \n knowledge",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(190, 255, 255, 255),
                fontSize: 23.0,
                // fontFamily: "Joan",
                // fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => LoginScreen(),
                    ),
                  );
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 20.0,
                    //fontFamily: 'Joan',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}