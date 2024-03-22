import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/screens/login.dart';



class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
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
              width: 200,
            ),
            Text(
              "Start our Quiz app,\ntest your knowledge and have fun!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 25.0,
                fontFamily: "Joan",
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => LoginScreen(),
                      ),
                    );
                  },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.4),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(121, 68, 243, 1),
                        Color.fromARGB(255, 231, 142, 253),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(3.5),
                  ),
                  child: Container(
                    constraints: BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.0,
                        fontFamily: 'RumRaisin',
                      ),
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
}
