import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'helper/ExcelLoader.dart';
import 'custom_icons.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                new Container(
                  color: Colors.orange,
                  child: Text(
                    'hey',
                    style: TextStyle(color: Colors.black, fontSize: 50.0),
                  ),
                ),
                new Container(
                  color: Colors.lightGreen,
                ),
                new Container(
                  color: Colors.red,
                ),
                new Container(
                  color: Colors.purple,
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
        load(list, meanings);

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                 return Words(word: list, meaning: meanings, index: index);}
            ));
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
  final List<String> word, meaning;
  final int index;

  Words({@required this.word, @required this.meaning, @required this.index});

  @override
  Widget build(BuildContext context) {
    int m = index*25;
    return Scaffold(
      body: PageView.builder(
          itemCount: 25,
          itemBuilder: (context, position) {
            return Container(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      word[position+m],
                      style: TextStyle(color: Colors.black, fontSize: 50.0),
                    ),
                    Text(
                      meaning[position+m],
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
