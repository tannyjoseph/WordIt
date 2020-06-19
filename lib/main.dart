import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:excel/excel.dart';

void main() {
  runApp(MyApp());
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
  Widget build(BuildContext context) {
    load();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("WordIt"),
        ),
        body: Center(
          child: PageView.builder(
            itemBuilder: (context, position) {
              return Container(
                child: Center(
                  child: Center(
                    child: Column(
                      children: [
                        Image(
                          image:  NetworkImage("https://cdn.vox-cdn.com/thumbor/fNwRmSTE0L-p6SjuaQmsmhfmEb0=/0x0:655x365/1400x1400/filters:focal(249x23:353x127):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/55356659/spider_man_homecoming.0.jpg")
                        ),
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
                ),
              );
            },
            itemCount: list.length,
          ),
        ),
      ),
    );
  }

  Future<void> load() async {
    ByteData data = await rootBundle.load("res/wordlist.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes, verify: false);

    for (var table in excel.tables.keys) {
      int count = 0;
      for (row in excel.tables[table].rows) {
        count++;
        list.add(row[0]);
        meanings.add(row[1]);
      }
      print(meanings);
    }
  }
}
