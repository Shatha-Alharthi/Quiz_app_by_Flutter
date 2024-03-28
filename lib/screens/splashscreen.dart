import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _slideAnimationController;
  late Animation<Offset> _logoSlideAnimation;
  late Animation<Offset> _buttonSlideAnimation;

  @override
  void initState() {
    super.initState();
    _slideAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _logoSlideAnimation = Tween<Offset>(
      begin: Offset(0, -1.0), // Start above the screen
      end: Offset.zero,
    ).animate(_slideAnimationController);
    _buttonSlideAnimation = Tween<Offset>(
      begin: Offset(0, 1.0), // Start below the screen
      end: Offset.zero,
    ).animate(_slideAnimationController);
    _slideAnimationController.forward();
  }

  @override
  void dispose() {
    _slideAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/resultscreen.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height) * 0.17,
            ),
            SlideTransition(
              position: _logoSlideAnimation,
              child: Image.asset(
                "assets/logo.png",
                height: 275,
                width: 270,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Quizz",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 42.0,
                fontFamily: "Joan",
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "quiz application to train your \n knowledge",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(200, 50, 50, 50),
                fontSize: 25.0,
                fontFamily: "Joan",
              ),
            ),
            SizedBox(
              height: 140,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: SlideTransition(
                position: _buttonSlideAnimation,
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
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Color(0xFF9C32E3),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Joan',
                      fontWeight: FontWeight.w900,
                      color: Color.fromRGBO(236, 236, 236, 1),
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
