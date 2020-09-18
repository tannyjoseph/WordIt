import 'dart:math';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Words extends StatefulWidget {
  final List<String> word, meaning, image;
  final int index;

  Words(
      {@required this.word,
      @required this.meaning,
      @required this.index,
      @required this.image});

  @override
  _WordsState createState() => _WordsState();
}

class _WordsState extends State<Words> {
  final _pageController = PageController(
    viewportFraction: 0.5,
  );

  @override
  Widget build(BuildContext context) {
    int m = widget.index * 25;
    return Scaffold(
        body: PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: 25,
      itemBuilder: (context, position) => _builder(position, m),
    ));
  }

  _builder(int position, int m) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 1.0;

        if (_pageController.position.haveDimensions) {
          value = _pageController.page - position;

          if (value >= 0) {
            double _lowerLimit = 0;
            double _upperLimit = pi / 2;

            value = (_upperLimit - (value.abs() * (_upperLimit - _lowerLimit)))
                .clamp(_lowerLimit, _upperLimit);
            value = _upperLimit - value;
            value *= -1;
          }
        } else {
          if (position == 0) {
            value = 0;
          } else if (position == 1) {
            value = -1;
          }
        }
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(value),
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: AssetImage("images/word_images/${widget.image[position]}"),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.word[position],
                          style: TextStyle(color: Colors.black, fontSize: 30.0),
                        ),
                        Text(
                          widget.meaning[position],
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
