import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordit/helper/ExcelLoader.dart';
import 'package:wordit/helper/QuestionLoader.dart';

class SentenceQuiz extends StatefulWidget {
  @override
  _SentenceQuizState createState() => _SentenceQuizState();
  final QuestionLoader question;
  final List<String> list, meanings, images;
  final int index;

  SentenceQuiz(
      {@required this.question,
      @required this.list,
      @required this.meanings,
      @required this.images,
      @required this.index});
}

class _SentenceQuizState extends State<SentenceQuiz> {
  QuestionLoader ques;
  List<String> list, meaning, images;
  int score = 0;

  @override
  void initState() {
    super.initState();
    ques = widget.question;
    list = widget.list;
    meaning = widget.meanings;
    images = widget.images;

    loadFirstScreen(list, meaning, images);
//    ques.loadQuiz();
  }

  String p;

  @override
  Widget build(BuildContext context) {
    List<String> options = ques.getOptions();
//    print(" j ${widget.index}");
    return Scaffold(
      body: Container(
        color: Color(0xFFFFFFFF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              ques.getQuestion(),
              style: (TextStyle(
                fontSize: 20.0,
              )),
            ),
            FlatButton(
              child: Text(options[0]),
              onPressed: () {
                checkAns(options[0]);
              },
            ),
            FlatButton(
              child: Text(options[1]),
              onPressed: () {
                checkAns(options[1]);
              },
            ),
            FlatButton(
              child: Text(options[2]),
              onPressed: () {
                checkAns(options[2]);
              },
            ),
            FlatButton(
              child: Text(options[3]),
              onPressed: () {
                checkAns(options[3]);
              },
            ),
          ],
        ),
      ),
    );
  }

  void saveScore(int index, int score) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(index.toString(), score.toString());
  }

  Future<String> getScore(String index) async {
    final prefs = await SharedPreferences.getInstance();
    p = await prefs.get(index);
//    print("d $p");
    return await prefs.get(index);
  }

  void checkAns(String chosen) {
    String correct = ques.getAnswer();

    if (ques.isFinished()) {
      if (correct == chosen) score++;
      print('finished');
      saveScore(widget.index, score);
      Alert(
        context: context,
        type: AlertType.error,
        title: "Finished!",
        desc: "You have reached the end of the quiz. \n Your Score is : $score",
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.pop(context);
            },
            width: 120,
          )
        ],
      ).show();

      ques.reset();
      score = 0;
    } else {
      setState(() {
        if (correct == chosen) {
          score += 1;
//          score.add(Icon(
//            Icons.check,
//            color: Colors.green,
//));
          print('correct');
        } else {
//          score.add(Icon(
//            Icons.close,
//            color: Colors.red,
//          ));

          print('wrong');
        }
        print("$score");

        ques.nextQ();
      });
    }
  }
}

Future<String> getScore(String index) async {
  final prefs = await SharedPreferences.getInstance();
  return await prefs.get(index);
}
