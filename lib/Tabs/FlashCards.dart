import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import '../my_flutter_app_icons.dart';

class FlashCards extends StatefulWidget {
  final List<String> word, meaning;

  FlashCards({@required this.word, @required this.meaning});

  @override
  _FlashCardsState createState() => _FlashCardsState();
}

class _FlashCardsState extends State<FlashCards> {
  @override
  void initState() {
    items.addAll(widget.word);
    for (int i = 0; i < widget.word.length; i++) {
      map[widget.word[i]] = widget.meaning[i];
    }
    super.initState();
  }

  List<String> alph = [];
  Map<String, List<String>> mp = new Map();
  var map = new Map();
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    alph = getAlphabetList(widget.word);
    List.generate(
      alph.length,
      (index) => _getAlphabetItem(alph[index]),
    );

    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Expanded(
              flex: 20,
              child: Container(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, position) {
                    return Container(
                      height: 200.0,
                      padding: EdgeInsets.all(10.0),
                      child: FlipCard(
                        direction: FlipDirection.VERTICAL,
                        front: Container(
                            padding: EdgeInsets.all(50.0),
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
                            child: Center(child: Text(items[position]))),
                        back: Container(
                            padding: EdgeInsets.all(50.0),
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
                              child: Text(
                                map[items[position]],
                              ),
                            )),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(alph.length, (index) {
                  return Center(
                    child: getList(context, index),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              items.shuffle();
            },
          );
        },
        child: Icon(MyFlutterApp.shuffle),
        backgroundColor: Colors.red,
      ),
    );
  }

  Widget getList(BuildContext context, int index) {
    return GestureDetector(
        onTap: () {
          searchList(alph[index]);
        },
        child: Text(alph[index]));
  }

  Widget _getAlphabetItem(String alphabet) {
    return Expanded(
      child: Text(
        alphabet,
        textAlign: TextAlign.end,
        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300),
      ),
    );
  }

  List<String> getAlphabetList(List<String> original) {
    List<String> al = [];

    for (var item in original) {
      if (!al.contains(item[0])) al.add(item[0]);
    }
    al.sort();
    return al;
  }

  var items = List<String>();

  void searchList(String query) {
    Map dummy = new Map();
    dummy.addAll(map);
    if (query.isNotEmpty) {
      List<String> dataMatch = List<String>();
      List<String> means = List<String>();
      dummy.forEach((key, value) {
        if (key[0].contains(query)) {
          dataMatch.add(key);
          means.add(value);
        }
      });
      setState(
        () {
          items.clear();
          items.addAll(dataMatch);
        },
      );
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(dummy.keys);
      });
    }
  }
}
