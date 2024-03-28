import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/catagory_screen.dart';
import 'package:flutter_application_1/utils/global_variable.dart';

class ResultsScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultsScreen({Key? key, required this.score, required this.totalQuestions}) : super(key: key);

  double getPaddingSize(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide * 0.07; // 5% of shortest side
  }

  double getLogoSize(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide * 0.9; // 80% of shortest side for logo size
  }

  Widget buildText(BuildContext context) {
    String message;
    Color messageColor;
    String imagePath;

    if (score >= 4) {
      message = 'You did a great job in the Quiz';
      messageColor = Color(0xFF38005D);
      imagePath = 'assets/congratslogo.png';
    } else {
      message = 'Better luck next time !';
      messageColor = Color(0xFF9C32E3);
      imagePath = 'assets/scooore.png';
    }

    return Column(
      children: [
        SizedBox(height: 100),
        Image.asset(
          imagePath,
          width: getLogoSize(context),
          height: getLogoSize(context),
        ),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: messageColor,
            fontSize: 28,
            fontFamily: "Joan",
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          '${userNameController.text} ',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF38005D),
            fontSize: 28,
            //fontFamily: "Joan",
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your score is  ',
              style: TextStyle(
                color: Color(0xFF38005D),
                fontSize: 24,
                fontFamily: "Joan",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' $score',
              style: TextStyle(
                color: Color(0xFF9C32E3),
                fontSize: 24,
                fontFamily: "Joan",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' / $totalQuestions',
              style: TextStyle(
                color: Color(0xFF38005D),
                fontSize: 24,
                fontFamily: "Joan",
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildButton(BuildContext context, String label, VoidCallback onPressed) {
    return SizedBox(
      height: 35,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.4),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF9C32E3), Color(0xFFD79DD7)],
            ),
            borderRadius: BorderRadius.circular(3.5),
          ),
          child: Container(
            constraints: BoxConstraints(minWidth: 88.0, minHeight: 36.0),
            alignment: Alignment.center,
            child: Text(
              label,
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
            image: AssetImage('assets/resultscreen.png'),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(getPaddingSize(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildText(context),
              SizedBox(height: 95),
              buildButton(
                context,
                'Play again',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => CategoryScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 15),
              buildButton(
                context,
                'Quit',
                () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
