import 'package:flutter/material.dart';
import 'screens/start_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartScreen(),
      routes: {
        '/quiz': (context) => QuizScreen(),
        '/result': (context) => ResultScreen(),
      },
    );
  }
}

