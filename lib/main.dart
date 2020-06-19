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

  List<String> list = List<String>();
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
      for (var row in excel.tables[table].rows) {
        count++;
        list.add(row[0]);
      }
      print ("list ${list.length}");
      print(list);
    }
  }
}
