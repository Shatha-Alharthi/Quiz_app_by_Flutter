import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/catagory_screen.dart';
import 'package:flutter_application_1/utils/global_variable.dart';


class ResultsScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultsScreen({Key? key, required this.score, required this.totalQuestions}) : super(key: key);

  double getPaddingSize(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide * 0.09; // 5% of shortest side
  }

  double getLogoSize(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide * 0.9; // 80% of shortest side for logo size
  }

  Widget buildText(BuildContext context) {
    return Column(
      children: [
        
        Image.asset('assets/congratslogo.png', width: getLogoSize(context), height: getLogoSize(context)),
        SizedBox(height: 30), 
        Text(
          'Congratulations',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 40,
            fontFamily: "Joan",
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${userNameController.text} !', textAlign: TextAlign.center,
          style: TextStyle(
          color: Colors.purple,
          fontSize: 28,
          fontFamily: "Joan",
          fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'You did a great job in the Quiz',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 28,
            fontFamily: "Joan",
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your score: ',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 24,
                fontFamily: "Joan",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' $score',
              style: TextStyle(
                color: Colors.purple, 
                fontSize: 24,
                fontFamily: "Joan",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' / $totalQuestions',
              style: TextStyle(
                color:  const Color.fromARGB(255, 255, 255, 255),
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
              colors: [Color.fromARGB(255, 121, 68, 243), Color.fromARGB(255, 231, 142, 253)],
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
            image: AssetImage('assets/background.jpg'),
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
