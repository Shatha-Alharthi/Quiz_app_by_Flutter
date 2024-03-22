import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/results.dart';

class QuestionScreen extends StatefulWidget {
  final List<Map<String, dynamic>>? questionsAndAnswersList;

  QuestionScreen({Key? key, this.questionsAndAnswersList}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _currentIndex = 0;
  int _score = 0;

  void _answerQuestion(String selectedAnswer) {
    if (selectedAnswer == widget.questionsAndAnswersList![_currentIndex]["correctAnswer"]) {
      setState(() {
        _score++;
      });
    }

    if (_currentIndex + 1 < widget.questionsAndAnswersList!.length) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => ResultsScreen(score: _score, totalQuestions: widget.questionsAndAnswersList!.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz',
            style: TextStyle(fontFamily: "Joan", fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromARGB(255, 134, 76, 215),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 120, bottom: 20, right: 12, left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "Question: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Joan",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${_currentIndex + 1}/  ${widget.questionsAndAnswersList!.length}  ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 73, 50, 156)),
                  ),
                ],
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                widget.questionsAndAnswersList![_currentIndex]["question"],
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Joan",
                  color: const Color.fromARGB(255, 4, 4, 4),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Column(
                children: [
                  for (int i = 0;
                      i <
                          widget.questionsAndAnswersList![_currentIndex]["choices"]
                              .length;
                      i++)
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _answerQuestion(widget.questionsAndAnswersList![_currentIndex]["choices"][i]);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.4),
                            ),
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            elevation: 0.1,
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color.fromRGBO(121, 68, 243, 1),
                                  Color.fromARGB(255, 231, 142, 253),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(5.4),
                            ),
                            child: Container(
                              constraints: BoxConstraints(minWidth: 150, minHeight: 50),
                              alignment: Alignment.center,
                              child: Text(
                                widget.questionsAndAnswersList![_currentIndex]["choices"][i],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Add space between buttons
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
