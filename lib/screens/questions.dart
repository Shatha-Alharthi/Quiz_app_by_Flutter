import 'package:flutter/material.dart';

class QuizQuestionsScreen extends StatelessWidget {
  const QuizQuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz Questions',
          style: TextStyle(fontFamily: "Joan", fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(121, 68, 243, 1),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          QuestionWidget(
            question: 'What is the capital of France?',
            choices: ['London', 'Paris', 'Berlin', 'Madrid'],
            correctAnswer: 'Paris',
          ),
          SizedBox(height: 20),
          QuestionWidget(
            question: 'Which planet is known as the Red Planet?',
            choices: ['Mars', 'Venus', 'Jupiter', 'Saturn'],
            correctAnswer: 'Mars',
          ),
          // Add more questions and choices as needed
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the results screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsScreen(),
                  ),
                );
              },
              child: Text(
                'Press here to see the Results',
                style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Joan", fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  final String question;
  final List<String> choices;
  final String correctAnswer;

  const QuestionWidget({
    required this.question,
    required this.choices,
    required this.correctAnswer,
    Key? key,
  }) : super(key: key);

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  String? selectedChoice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ...widget.choices.map(
          (choice) => GestureDetector(
            onTap: () {
              setState(() {
                selectedChoice = choice;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(121, 68, 243, 1), Color.fromARGB(255, 231, 142, 253)],
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: selectedChoice == choice ? Color.fromARGB(255, 83, 34, 146) : const Color.fromARGB(255, 252, 252, 252),
                  width: 4.0,
                ),
              ),
              child: Center(
                child: Text(
                  choice,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  double getPaddingSize(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide * 0.09; // 5% of shortest side
  }

  double getLogoSize(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide * 0.9; // 80% of shortest side for logo size
  }

  Widget buildText(BuildContext context) {
    return Column(
      children: [
        // Add your logo here
        Image.asset('assets/congratslogo.png', width: getLogoSize(context), height: getLogoSize(context)),
        SizedBox(height: 30), // Adjusted spacing for landscape orientation
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
          'you did a great job in the Quiz !',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 28,
            fontFamily: "Joan",
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildButton(BuildContext context, String label, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
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
                'Go back to the Quiz categories',
                () {
                  Navigator.pushNamed(context, '/category');
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



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Quiz App',
    home: QuizQuestionsScreen(),
  ));
}
