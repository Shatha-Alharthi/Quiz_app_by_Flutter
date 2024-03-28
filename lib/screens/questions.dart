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
  Map<int, String?> _selectedAnswers = {};

  void _answerQuestion(String selectedAnswer) {
    setState(() {
      _selectedAnswers[_currentIndex] = selectedAnswer;
    });

    String correctAnswer = widget.questionsAndAnswersList![_currentIndex]["correctAnswer"].toString();

    if (selectedAnswer.toString() == correctAnswer) {
      setState(() {
        _score++;
      });
    }
  }

  void _playAgain() {
    setState(() {
      _currentIndex = 0;
      _score = 0;
      _selectedAnswers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/Q.png"), // Add your image path here
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 20, right: 15, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Question:  ",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: "Joan",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${_currentIndex + 1} / ${widget.questionsAndAnswersList!.length}  ",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 117, 37, 171)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      widget.questionsAndAnswersList![_currentIndex]["question"],
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Joan",
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Column(
                    children: [
                      for (int i = 0;
                          i <
                              widget.questionsAndAnswersList![_currentIndex][
                                  "choices"]
                                  .length;
                          i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              _answerQuestion(widget.questionsAndAnswersList![_currentIndex]["choices"][i]);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.4),
                                // side: BorderSide(
                                //   color: _selectedAnswers[_currentIndex] == widget.questionsAndAnswersList![_currentIndex]["choices"][i] ? Colors.purple : Colors.transparent, // Change the border color to purple if selected
                                //   width: 4.5, // Set the border width
                                // ),
                              ),
                              padding: EdgeInsets.zero,
                              elevation: 0.1,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: _selectedAnswers[_currentIndex] == widget.questionsAndAnswersList![_currentIndex]["choices"][i] ? Color(0xFFD79DD7) : Colors.transparent, // Change the box color to purple if selected
                                borderRadius: BorderRadius.circular(7.4),
                              ),
                              constraints: BoxConstraints(minWidth: 150, minHeight: 65),
                              alignment: Alignment.center,
                              child: Text(
                                widget.questionsAndAnswersList![_currentIndex]["choices"][i],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF691D9C),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 20), // Add some space between the choices and the buttons
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _selectedAnswers[_currentIndex] != null
                            ? () {
                                if (_currentIndex + 1 <
                                    widget.questionsAndAnswersList!.length) {
                                  setState(() {
                                    _currentIndex++;
                                  });
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          ResultsScreen(
                                              score: _score,
                                              totalQuestions: widget
                                                  .questionsAndAnswersList!
                                                  .length),
                                    ),
                                  );
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple, // Change the background color to purple
                        ),
                        child: Text(
                          _currentIndex + 1 <
                                  widget.questionsAndAnswersList!.length
                              ? "    Next     "
                              : "    Done     ",
                          style: TextStyle(color: Colors.white), // Change the text color to white
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _currentIndex > 0
                            ? () {
                                setState(() {
                                  _currentIndex--;
                                });
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple, // Change the background color to purple
                        ),
                        child: Text(
                          "     Back     ",
                          style: TextStyle(color: Colors.white), // Change the text color to white
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _playAgain();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple, // Change the background color to purple
                        ),
                        child: Text(
                          "Play Again",
                          style: TextStyle(color: Colors.white), // Change the text color to white
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
