import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/questions.dart';
import 'package:flutter_application_1/screens/data_list.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/catagoryBackground.png",
              fit: BoxFit.cover,
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(78.0),
                child: Text(
                  'Choose Category',
                  style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Joan'),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 48.0), // Adjust the top padding to center the list items
                  children: [
                    categoryContainer("Science", context, scienceQuizQuestionsAndAnswers),
                    SizedBox(height: 12.0),
                    categoryContainer("AI", context, aiQuizQuestionsAndAnswers),
                    SizedBox(height: 12.0),
                    categoryContainer("Math", context, mathQuizQuestionsAndAnswers),
                    SizedBox(height: 12.0),
                    categoryContainer("General", context, generalQuizQuestionsAndAnswers),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget categoryContainer(String quizName, BuildContext context, List qList) {
    // Map quiz names to corresponding icons
    Map<String, IconData> quizIcons = {
      "Science": Icons.science,
      "AI": Icons.computer,
      "Math": Icons.calculate,
      "General": Icons.book,
      // Add more quiz names and icons as needed
    };

    // Get the icon for the current quiz name, default to a generic icon if not found
    IconData iconData = quizIcons[quizName] ?? Icons.category;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => QuestionScreen(
              questionsAndAnswersList: qList.map((e) => e as Map<String, dynamic>).toList(),
            ),
          ),
        );
      },
      child: SizedBox(
        height: 120.0,
        child: Container(
          padding: EdgeInsets.all(5.0),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              colors: [Color(0xFF9C32E3), Color(0xFFD79DD7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, color: Colors.white, size: 30), // Use the iconData variable
              SizedBox(width: 10),
              Text(
                quizName,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
