import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:excel/excel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'helper/ExcelLoader.dart';
import 'custom_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  var row;
  List<String> list = List<String>();
  List<String> meanings = List<String>();

  @override
  Widget build(BuildContext context) {
    //load(list, meanings);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF84DCC6),
          title: Text("WordIt"),
        ),
        bottomSheet: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFFFF686B),
          unselectedItemColor: Colors.grey[600],
          items: <BottomNavigationBarItem>[
            getTab(Icons.collections_bookmark),
            getTab(Custom.cards),
            getTab(Custom.sentences),
            getTab(Custom.synonyms),
            getTab(Custom.fun)
          ],
          currentIndex: _selectedIndex,
          onTap: onTabTapped,
        ),
        body: Center(
          child: PageView.builder(
            itemBuilder: (context, position) {
              return Container(
                child: Center(
                  child: Column(
                    children: [
//                        Image(
//                            image: NetworkImage(
//                                "https://cdn.vox-cdn.com/thumbor/fNwRmSTE0L-p6SjuaQmsmhfmEb0=/0x0:655x365/1400x1400/filters:focal(249x23:353x127):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/55356659/spider_man_homecoming.0.jpg")),
                      Text(
                        list[position],
                        style: TextStyle(color: Colors.black, fontSize: 50.0),
                      ),
                      Text(
                        meanings[position],
                        style: TextStyle(color: Colors.black, fontSize: 25.0),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: list.length,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem getTab(IconData icon) {
    return BottomNavigationBarItem(
        icon: Icon(icon), activeIcon: Icon(icon), title: Text(('')));
  }

  void onTabTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
