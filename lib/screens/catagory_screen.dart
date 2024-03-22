import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/questions.dart';
import 'package:flutter_application_1/screens/data_list.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz categories',
          style: TextStyle(fontFamily: "Joan", fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 100.0),
        children: [
          categoryContainer("Science", context, scienceQuizQuestionsAndAnswers),
          SizedBox(height: 30.0),
          categoryContainer("AI", context, aiQuizQuestionsAndAnswers),
          SizedBox(height: 30.0),
          categoryContainer("Math", context, mathQuizQuestionsAndAnswers),
          SizedBox(height: 39.0),
          categoryContainer("General", context, generalQuizQuestionsAndAnswers),
        ],
      ),
    );
  }

  Widget categoryContainer(String quizName, BuildContext context, List qList) {
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
        height: 100.0,
        child: Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              colors: [const Color.fromRGBO(121, 68, 243, 1), Color.fromARGB(255, 231, 142, 253)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Text(
              quizName,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
