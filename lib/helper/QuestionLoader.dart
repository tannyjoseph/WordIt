import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:wordit/models/Question.dart';


class QuestionLoader {
  int _qno = 0;

  List<Question> q = List<Question>();

  void nextQ() {
    if (_qno < q.length - 1) {
      _qno++;
    }
  }

  bool isFinished() {
    if (_qno == 12) {
      return true;
    }
    return false;
  }

  void reset() {
    if (isFinished()) _qno = 0;
  }

  String getQuestion() {
    return q[_qno].question;
  }

  String getAnswer() {
    return q[_qno].ans;
  }

  Future<void> loadQuiz() async {
    ByteData data = await rootBundle.load("res/wordlist.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes, verify: false);
    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table].rows) {
        q.add(Question(row[3], row[0]));
      }
    }
  }
}
