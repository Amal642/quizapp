import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Quizz());
}

class Quizz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  List<String> questions = [
    'Neil Armstrong was the first person to step on the moon?',
    'The Great Wall of China is visible from space.',
    'Elephants are the only mammals that can\'t jump.',
    'The human body has four lungs.',
    'Mars in our solar system is known as the "Red Planet"?',
  ];

  List<bool> answers = [
    true,
    false,
    true,
    false,
    true,
  ];

  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[number],
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    if (answers[number] == true) {
                      scoreKeeper.add(Icon(
                        Icons.check_box_rounded,
                        color: Colors.green,
                      ));
                    } else {
                      scoreKeeper.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                    if (number < 4) {
                      number++;
                    } else {
                      Alert(
                        context: context,
                        title: "Congratulations!",
                        desc: "You have reached the end of quiz.",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "OK",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {
                                number = 0;
                                scoreKeeper.clear();
                              });
                            },
                            width: 120,
                          )
                        ],
                      ).show();
                    }
                  });
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.green[700], // Background Color
                ),
                child: const Text(
                  'True',
                  style: TextStyle(fontSize: 24),
                ),
              )),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    if (answers[number] == false) {
                      scoreKeeper.add(Icon(
                        Icons.check_box_rounded,
                        color: Colors.green,
                      ));
                    } else {
                      scoreKeeper.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                    if (number < 4) {
                      number++;
                    } else {
                      {
                        Alert(
                          context: context,
                          title: "Congratulations!",
                          desc: "You have reached the end of quiz.",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "OK",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                setState(() {
                                  number = 0;
                                  scoreKeeper.clear();
                                });
                              },
                              width: 120,
                            )
                          ],
                        ).show();
                      }
                    }
                  });
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.red, // Background Color
                ),
                child: const Text(
                  'False',
                  style: TextStyle(fontSize: 24),
                ),
              )),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
