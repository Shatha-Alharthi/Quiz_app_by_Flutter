import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  double getPaddingSize(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide * 0.05; // 5% of shortest side
  }

  double getLogoSize(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide * 0.8; // 80% of shortest side for logo size
  }

  Widget buildText(BuildContext context) {
    return Column(
      children: [
        // Add your logo here
        Image.asset('assets/logo.png', width: getLogoSize(context), height: getLogoSize(context)),
        SizedBox(height: 65), // Adjusted spacing for landscape orientation
        Text(
          'Start our Quiz app,\ntest your knowledge and have fun!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 25.0,
            fontFamily: "Joan",
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {Navigator.pushNamed(context, '/login');},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.4),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 121, 68, 243), Color.fromARGB(255, 231, 142, 253)],
            ),
            borderRadius: BorderRadius.circular(3.5),
          ),
          child: Container(
            constraints: BoxConstraints(minWidth: 88.0, minHeight: 36.0),
            alignment: Alignment.center,
            child: Text(
              'Start Quiz',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23.0,
                fontFamily: 'RumRaisin',
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(getPaddingSize(context)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 200.0),
                  child: buildText(context),
                ),
                buildButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
