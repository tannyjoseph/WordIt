import 'dart:math';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'helper/ExcelLoader.dart';
import 'custom_icons.dart';
import 'package:progressive_image/progressive_image.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var row;
  List<String> list = List<String>();
  List<String> meanings = List<String>();
  List<String> images = List<String>();
  QuestionLoader questionLoader = QuestionLoader();
  var random = new Random();
  var incAns;

  @override
  void initState() {
    super.initState();
    loadFirstScreen(list, meanings, images);
    questionLoader.loadQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        systemNavigationBarColor: Colors.black, // navigation bar color
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness:
            Brightness.dark, //navigation bar icons' color
      ),
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
            bottomNavigationBar: new TabBar(
              tabs: [
                getTab(Icons.collections_bookmark),
                getTab(Custom.cards),
                getTab(Custom.sentences),
                getTab(Custom.synonyms),
                getTab(Custom.fun)
              ],
//    onTap: onTabTapped,
              labelColor: Color(0xFF93E1D8),
              unselectedLabelColor: Colors.grey[600],
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(8.0),
              indicatorColor: Color(0xFFEE4266),
            ),
            body: TabBarView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 8.0, left: 8.0, top: 20.0, bottom: 0.0),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
//                      semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 5.0,
                          child: Container(
                            constraints: new BoxConstraints.expand(
                              height: 200.0,
                            ),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/words_bg.jpg'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Align(
                                alignment: FractionalOffset.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Learn New Words!',
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                    Expanded(
                      child: Container(
                        child: words(),
                      ),
                    ),
                  ],
                ),
                FlashCards(),
                Sentences(),
                new Container(
                  color: Colors.red,
                ),
                new Container(
                  color: Colors.purple[600],
                )
              ],
            )
//
            ),
      ),
    ));
  }

  Container words() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        itemCount: 53,
        itemBuilder: (context, index) {
          return listCard(index);
        },
      ),
    );
  }

  Widget listCard(int index) {
    return InkWell(
      onTap: () {
        loadFirstScreen(list, meanings, images);

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Words(
              word: list, meaning: meanings, index: index, image: images);
        }));
      },
      child: Card(
        color: getColor(index + 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Word List #${index + 1}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  PageView FlashCards() {
    return PageView.builder(
        itemCount: list.length,
        itemBuilder: (context, position) {
          return Container(
            padding: EdgeInsets.all(20.0),
            child: FlipCard(
              direction: FlipDirection.VERTICAL,
              front: Container(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Center(child: Text(list[position]))),
              back: Container(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Center(child: Text(meanings[position]))),
            ),
          );
        });
  }

  // ignore: non_constant_identifier_names
  Column Sentences() {
    List<String> options = questionLoader.getOptions();
    print(options);

    return Column(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(questionLoader.getQuestion()),
        FlatButton(
          child: Text(options[0]),
          onPressed: (){
            checkAns(options[0]);
          },
        ),
        FlatButton(
          child: Text(options[1]),
          onPressed: (){
            checkAns(options[1]);
          },
        ),
        FlatButton(
          child: Text(options[2]),
          onPressed: (){
            checkAns(options[2]);
          },
        ),
        FlatButton(
          child: Text(options[3]),
          onPressed: (){
            checkAns(options[3]);
          },
        ),
      ],
    );
  }

  void checkAns(String chosen) {
    String correct = questionLoader.getAnswer();
    if (questionLoader.isFinished()) {
//      Alert(
//        context: context,
//        type: AlertType.error,
//        title: "Finished!",
//        desc: "You have reached the end of the quiz.",
//        buttons: [
//          DialogButton(
//            child: Text(
//              "CANCEL",
//              style: TextStyle(color: Colors.white, fontSize: 20),
//            ),
//            onPressed: () => Navigator.pop(context),
//            width: 120,
//          )
//        ],
//      ).show();

      questionLoader.reset();

//      score = [];
    } else {
      setState(() {
        if (correct == chosen) {
//          score.add(Icon(
//            Icons.check,
//            color: Colors.green,
//          ));

        print('correct');
        } else {
//          score.add(Icon(
//            Icons.close,
//            color: Colors.red,
//          ));

        print('wrong');
        }
        questionLoader.nextQ();
      });
    }
  }

}

// ignore: missing_return
Color getColor(int index) {
  if (index % 2 == 0) return Color(0xFF84DCC6);
  if (index % 2 == 1) return Color(0xFFFF686B);
}

Tab getTab(IconData icon) {
  return Tab(icon: Icon(icon));
}

class Words extends StatelessWidget {
  final List<String> word, meaning, image;
  final int index;

  Words(
      {@required this.word,
      @required this.meaning,
      @required this.index,
      @required this.image});

  @override
  Widget build(BuildContext context) {
    int m = index * 25;
    return Scaffold(
      body: PageView.builder(
          itemCount: 25,
          itemBuilder: (context, position) {
            return Container(
              child: Center(
                child: Column(
                  children: [
                    Image.asset('images/word_images/${image[position+m]}'),
                    Text(
                      word[position + m],
                      style: TextStyle(color: Colors.black, fontSize: 50.0),
                    ),
                    Text(
                      meaning[position + m],
                      style: TextStyle(color: Colors.black, fontSize: 25.0),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
