import 'package:flutter/material.dart';
import 'package:quiz/Answer.dart';
import 'package:quiz/question.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override 
  State<StatefulWidget> createState() {
    return _MyStateApp();
  }
}

class _MyStateApp extends State<MyApp> {
final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ],
    },
  ];
  var _indexQuestion = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _indexQuestion = 0;
      _totalScore = 0;
    });
  }
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _indexQuestion = _indexQuestion + 1;
    });
    if (_indexQuestion < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Quiz App'),
        ),
        body: _indexQuestion < _questions.length ?
        Quiz(
          answerQuestion: _answerQuestion,
                questionIndex: _indexQuestion,
                questions: _questions,): Result(_totalScore, _resetQuiz), 
        ),
    );
  }
}

