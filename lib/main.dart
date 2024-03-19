import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/splashscreen.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/catagory_screen.dart';
import 'package:flutter_application_1/screens/questions.dart'; // Make sure this import is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/category': (context) => CategoryScreen(),
        '/questions': (context) => QuizQuestionsScreen(), // Make sure this route is correct
      },
    );
  }
}
