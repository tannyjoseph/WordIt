import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:wordit/helper/indexed.dart';

class FlashCards extends StatefulWidget {
  final List<String> word, meaning;

  FlashCards({@required this.word, @required this.meaning});

  @override
  _FlashCardsState createState() => _FlashCardsState();
}

class _FlashCardsState extends State<FlashCards> {


  @override
  void initState() {
    super.initState();
//    print("pt");
//    print("pt ${widget.word.length}");
  }


  @override
  Widget build(BuildContext context) {
//    Widget itembuild(BuildContext context, int index) {
//
//
//      return Container(
//        height: 100.0,
//        padding: EdgeInsets.all(10.0),
//        child: FlipCard(
//          direction: FlipDirection.VERTICAL,
//          front: Container(
////              padding: EdgeInsets.all(70.0),
//              decoration: BoxDecoration(
//                  gradient: RadialGradient(
//                    radius: 2.5,
//                    colors: [
//                      Color(0xFFF0F2F0),
//                      Color(0XFF0082c8),
//                    ],
//                  ),
//                  borderRadius: BorderRadius.circular(10.0)),
//              child: Center(child: Text(widget.word[index]))),
//          back: Container(
////              padding: EdgeInsets.all(50.0),
//              decoration: BoxDecoration(
//                  gradient: RadialGradient(
//                    radius: 2.5,
//                    colors: [
//                      Color(0XFFa7fe0),
//                      Color(0xFF0082c8),
//                    ],
//                  ),
//                  borderRadius: BorderRadius.circular(10.0)),
//              child: Center(
//                child: Text(widget.meaning[index]),
//              )),
//        ),
//      );
//    }
     return Container(
       child: ListView.builder(
        itemCount: widget.word.length,
        itemBuilder: (context, position) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: FlipCard(
              direction: FlipDirection.VERTICAL,
              front: Container(
                  padding: EdgeInsets.all(70.0),
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                        radius: 2.5,
                        colors: [
                          Color(0xFFF0F2F0),
                          Color(0XFF0082c8),
                        ],
                      ),
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(child: Text(widget.word[position]))),
              back: Container(
                  padding: EdgeInsets.all(70.0),
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                        radius: 2.5,
                        colors: [
                          Color(0XFFa7fe0),
                          Color(0xFF0082c8),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                    child: Text(widget.meaning[position]),
                  )),
            ),
          );
        },
    ),);
  }
}


