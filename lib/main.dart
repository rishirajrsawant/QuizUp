import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(QuizUp());

class QuizUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: Text('QuizUp'),
          backgroundColor: Colors.redAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  int questionNo = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.questionBank[questionNo].questionText,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    bool correctAnswer =
                        quizBrain.questionBank[questionNo].questionAnswer;
                    if (correctAnswer == true) {
                      print('right');
                    } else {
                      print('wrong');
                    }
                    questionNo++;
                  });
                },
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                color: Colors.green,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    bool correctAnswer =
                        quizBrain.questionBank[questionNo].questionAnswer;
                    if (correctAnswer == false) {
                      print('right');
                    } else {
                      print('wrong');
                    }
                    questionNo++;
                  });
                },
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                color: Colors.red,
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
