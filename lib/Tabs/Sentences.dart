import 'package:flutter/material.dart';
import 'package:wordit/helper/ExcelLoader.dart';
import 'package:wordit/helper/QuestionLoader.dart';
import 'package:wordit/screens/SentencesQuiz.dart';

class Sentences extends StatefulWidget {
  final List<String> list, meanings, images;

  Sentences(
      {@required this.list, @required this.meanings, @required this.images});

  @override
  _SentencesState createState() => _SentencesState();
}

class _SentencesState extends State<Sentences> {

  var score = List.filled(53, "0");
  String get(int index) {

    getScore((index).toString()).then((value) {
//      print(value);
      setState(() {
        if (value!= null) score[index] = value;
        else score[index] = "0";
      });
//      print(score);
    });
//    print(score[1]);
    return score[index];
  }


  QuestionLoader questionLoader = QuestionLoader();

  @override
  Widget build(BuildContext context) {
//    score = getScore("0").then((value) => print(value));

//    print(score);
    return Container(
      child: ListView.builder(
        itemCount: 53,
        itemBuilder: (context, index) {
          return listCard(index, context);
        },
      ),
    );
  }

  Widget listCard(int index, BuildContext context) {


//    print(score[0]);
    return InkWell(
      onTap: () {
        loadFirstScreen(widget.list, widget.meanings, widget.images);
        questionLoader.loadQuiz(index);

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SentenceQuiz(
            question: questionLoader,
            list: widget.list,
            meanings: widget.meanings,
            images: widget.images,
            index: index,
          );
        }));
      },
      child: Card(
        color: getColor(index + 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
//            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Word List #${index + 1}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    get(index),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: missing_return
  Color getColor(int index) {
    if (index % 2 == 0) return Color(0xFFEE4266);
    if (index % 2 == 1) return Color(0xFF0070C1);

  }


}
