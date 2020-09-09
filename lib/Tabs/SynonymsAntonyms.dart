import 'package:flutter/material.dart';
import 'package:wordit/screens/SynAnScreen.dart';

class SynonAntonyms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        itemCount: 53,
        itemBuilder: (context, index) {
          return listCard(index, context);
        },
      ),
    );
  }

  Widget listCard(int index, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SynAnScreen();
        }));
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

  // ignore: missing_return
  Color getColor(int index) {
    if (index % 2 == 0) return Color(0xFF93E1D8);
    if (index % 2 == 1) return Color(0xFFC94042);
  }
}
