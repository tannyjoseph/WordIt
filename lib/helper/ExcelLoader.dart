import 'package:excel/excel.dart';
import 'package:flutter/services.dart';

Future<void> loadFirstScreen(List<String> list, List<String> meanings,
    List<String> images, int index) async {
  list.clear();
  meanings.clear();
  images.clear();
  ByteData data = await rootBundle.load("res/wordlist${index + 1}.xlsx");
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes);

  for (var table in excel.tables.keys) {
    for (var row in excel.tables[table].rows) {
      print(row[0]);
      list.add(row[0]);
      meanings.add(row[1]);
      images.add(row[2]);
    }
  }
}
