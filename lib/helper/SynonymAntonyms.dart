import 'package:excel/excel.dart';
import 'package:flutter/services.dart';

Future<void> loadsyns() async {
  ByteData data = await rootBundle.load("res/synant.xlsx");
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes);
  List<String> b;
  for (var table in excel.tables.keys) {
    for (var row in excel.tables[table].rows) {
      List a = row.toList();
      a.removeWhere((value) => value == null);
      b = [];
      for (int i = 1; i< a.length; i++){
        b.add(a[i]);
      }
    }
  }
}