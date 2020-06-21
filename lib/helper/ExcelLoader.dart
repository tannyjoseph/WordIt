import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';

Future<void> load(List<String> list, List<String> meanings) async {
  ByteData data = await rootBundle.load("res/wordlist.xlsx");
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes, verify: false);
  for (var table in excel.tables.keys) {
    for (var row in excel.tables[table].rows) {
      list.add(row[0]);
      meanings.add(row[1]);
    }

    print(list);
    print(meanings);
  }
}