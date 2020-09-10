import 'package:flutter/material.dart';
import 'package:wordit/helper/ExcelLoader.dart';
import 'Words.dart';

class WordList extends StatelessWidget {
  final List<String> list, meanings, images;

  WordList(
      {@required this.list, @required this.meanings, @required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.builder(
        itemCount: 53,
        itemBuilder: (context, index) {
          return listCard(index, context);
        },
      ),
    );
  }

  Widget listCard(int index, BuildContext context) {
    return Container(
      color: Color(0xFFdef1f2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Word List #${index + 1}"),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Color(0xFF537c98),
                  child: Text(
                    "Start",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    loadFirstScreen(list, meanings, images);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Words(
                          word: list,
                          meaning: meanings,
                          index: index,
                          image: images);
                    }));
                  },
                )
              ],
            ),
          ),
          Divider(
            height: 2.0,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  // ignore: missing_return
  Color getColor(int index) {
    if (index % 2 == 0) return Color(0xFF84DCC6);
    if (index % 2 == 1) return Color(0xFFFF686B);
  }
}
