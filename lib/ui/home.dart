import 'package:flag_quiz/model/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  // const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name(
        "The U.S. Declaration of Independence was adopted in 1776", true),
    Question.name("The Supreme Law of the land is the Constitution", true),
    Question.name(
        "The two rights in the Declaration of Independence are: "
        " \n Life "
        " \n Pursuit of Happiness",
        true),
    Question.name("The (U.S.) Constitution has 26 Amendments.", false),
    Question.name(
        "Freedom of religion means:\nYou can practise any religion, "
        "or not practise a religion",
        true),
    Question.name("Journalist is one branch or part of the government.", false),
    Question.name("The Congress doesn't make federal laws.", false),
    Question.name("There are 100 U.S. Senators.", true),
    Question.name("We elect a U.S. Senator for 4 years", false),
    Question.name("We elect a U.S. Representative for 2 years.", true),
    Question.name(
        "A U.S. Senator represents all people of the United States.", false),
    Question.name("We vote for President in January.", false),
    Question.name("Who vetoes bills is the President", true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        //backgroundColor: Colors.blueGrey,
      ),
      //backgroundColor: Colors.blueGrey,
      // we use [Builder] here to use a [context] that is descendant of [Scaffold]
      // or else [Scaffold.of] will return null
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Center(
            // horizontally center
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // vertically center
              children: <Widget>[
                Center(
                  child: Image.asset(
                    "images/flag.png",
                    width: 250,
                    height: 250,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(14.4),
                        border: Border.all(
                            color: Colors.blueGrey.shade800,
                            style: BorderStyle.solid)),
                    height: 120.0,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${_currentQuestionIndex+1}. " +
                            questionBank[_currentQuestionIndex].questionText,
                        //style: TextStyle(fontSize: 16.9, color: Colors.white),
                      ),
                    )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => _prevQuestion(),
                      color: Colors.blueGrey.shade800,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => _checkAnswer(true, context),
                      color: Colors.blueGrey.shade800,
                      child: Text(
                        "TRUE",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => _checkAnswer(false, context),
                      color: Colors.blueGrey.shade800,
                      child: Text(
                        "FALSE",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => _nextQuestion(),
                      color: Colors.blueGrey.shade800,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      // correct answer
      final snackBar = SnackBar(
          backgroundColor: Colors.greenAccent,
          duration: Duration(milliseconds: 500),
          content: Text(
            "Correct!",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent.shade200),
          ));
      Scaffold.of(context).showSnackBar(snackBar);
      _updateQuestion();
    } else {
      final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          duration: Duration(milliseconds: 500),
          content: Text(
            "Incorrect!",
            style: TextStyle(
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade200),
          ));
      Scaffold.of(context).showSnackBar(snackBar);
      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
      debugPrint("QuestionIndex: $_currentQuestionIndex");
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }
}
