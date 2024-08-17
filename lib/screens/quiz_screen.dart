import 'dart:async';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  int _timeLeft = 60; // Time in seconds
  Timer? _timer;

  final List<Map<String, Object>> _questions = [
    {
      'question': 'How many types of widgets are there in Flutter?',
      'options': ['2', '4', '6', '8'],
      'answer': '2',
    },
    {
      'question': 'What is Flutter?',
      'options': [
        'A programming language',
        'An SDK for building mobile apps',
        'A database',
        'A text editor'
      ],
      'answer': 'An SDK for building mobile apps',
    },
    {
      'question': 'Which programming language is used by Flutter?',
      'options': ['Java', 'Kotlin', 'Dart', 'Swift'],
      'answer': 'Dart',
    },
    {
      'question': 'Who developed Flutter?',
      'options': ['Facebook', 'Apple', 'Google', 'Microsoft'],
      'answer': 'Google',
    },
    {
      'question': 'Which of the following is a Flutter widget?',
      'options': ['Container', 'ViewController', 'Fragment', 'Activity'],
      'answer': 'Container',
    },
  ];

  void _startTimer() {
    _timer?.cancel();
    _timeLeft = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _timer?.cancel();
        _nextQuestion();
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _startTimer();
      });
    } else {
      Navigator.pushReplacementNamed(context, '/result', arguments: _score);
    }
  }

  void _answerQuestion(String answer) {
    if (answer == _questions[_currentQuestionIndex]['answer']) {
      _score++;
    }
    _nextQuestion();
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(219, 244, 219, 110), // Light purple background
      appBar: AppBar(
       backgroundColor: Color.fromARGB(219, 247, 207, 30), // Purple color
        title: Text('CODE-MANIA',style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: (_currentQuestionIndex + 1) / _questions.length,
                    backgroundColor: Color(0xFFD1C4E9), // Lighter purple
                    valueColor: AlwaysStoppedAnimation<Color>( Color.fromARGB(219, 247, 207, 30),), // Darker purple
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  '$_timeLeft s',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Question ${_currentQuestionIndex + 1} of ${_questions.length}',
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _questions[_currentQuestionIndex]['question'] as String,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            ...(_questions[_currentQuestionIndex]['options'] as List<String>).map((option) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEDE7F6), // Light purple background for button
                    foregroundColor: Colors.black, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.black12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () => _answerQuestion(option),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      option,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              );
            }).toList(),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:  Color.fromARGB(219, 247, 207, 30), // Purple color
                foregroundColor: Colors.white, // Text color
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: _nextQuestion,
              child: Text(
                'SKIP',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
