import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wordit/Tabs/Sentences.dart';
import 'package:wordit/helper/ExcelLoader.dart';
import 'package:wordit/helper/QuestionLoader.dart';
import 'file:///C:/Users/Tania%20Joseph/AndroidStudioProjects/word_it/word_it/lib/Tabs/FlashCards.dart';
import 'package:wordit/screens/ImagesAndWords.dart';
import 'file:///C:/Users/Tania%20Joseph/AndroidStudioProjects/word_it/word_it/lib/Tabs/SynonymsAntonyms.dart';
import '../custom_icons.dart';

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
//    questionLoader.loadQuiz();
  }

  @override
  Widget build(BuildContext context) {
//    print(list.length);
//    print("p ${list.length}");


    return MaterialApp(
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.black,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness:
          Brightness.dark,
        ),
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
              bottomNavigationBar: new TabBar(
                tabs: [
                  getTab(Icons.collections_bookmark),
                  getTab(Custom.cards),
                  getTab(Custom.sentences),
                  getTab(Custom.synonyms),
                ],
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
                                  child: Text(
                                    'Learn New Words!',
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            )),
                      ),
                      Expanded(
                        child: WordList(list: list, meanings: meanings, images: images),
                      ),
                    ],
                  ),
                  FlashCards(word: list, meaning: meanings),
                  Sentences(list: list, meanings: meanings, images: images),
                  SynonAntonyms(),
                ],
              )),
        ),
      ),
    );
  }
}


Tab getTab(IconData icon) {
  return Tab(icon: Icon(icon));
}
