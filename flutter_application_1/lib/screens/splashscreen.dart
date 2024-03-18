import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  double getPaddingSize(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.05; // 5% of screen width
  }

  double getLogoSize(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.8; // 30% of screen width for logo size
  }

  Widget buildText(BuildContext context) {
    return Column(
      children: [
        // Add your logo here
        Image.asset('assets/logo.png', width: getLogoSize(context), height: getLogoSize(context)),
        SizedBox(height:65 ), // Add some space between the logo and the text
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
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.4),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 121, 68, 243), Color.fromARGB(255, 231, 142, 253)], // Define the gradient colors
            ),
            borderRadius: BorderRadius.circular(3.5),
          ),
          child: Container(
            constraints: BoxConstraints(minWidth: 88.0, minHeight: 36.0), // Button min size
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end, // Align content at the bottom
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 200.0), // Add bottom padding
                child: buildText(context),
              ),
              buildButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
