import 'dart:collection';
import 'dart:math';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:wordit/models/Question.dart';


class QuestionLoader {
  int _qno = 0;
  var incAns;
  var random = new Random();

  List<Question> q = List<Question>();
  List<String> options = List<String>();


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

  List<String> getOptions() {
    incAns = random.nextInt(1325);

    int loc = random.nextInt(4);
    List<String> options = List<String>();
    List<String> result;

    for (int i = 0; i < 4; i++) {
      if (i == loc) {
        options.add(q[_qno].ans);
      } else {
        incAns = random.nextInt(1325);
        while (incAns == loc || incAns == _qno) {
          incAns = random.nextInt(1325);
        }
        options.add(q[incAns].ans);
      }
    }
    result = LinkedHashSet<String>.from(options).toList();
    while (result.length != 4) {
      incAns = random.nextInt(1325);
      options.add(q[incAns].ans);
      result = LinkedHashSet<String>.from(options).toList();
    }
    return result;
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
