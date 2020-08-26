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
    viewportFraction: 0.3,
  );
  @override
  Widget build(BuildContext context) {
    int m = widget.index * 25;
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: 25,
        itemBuilder: (context, position) {
//          AssetImage getImage() {
//            return AssetImage(
//                'images/word_images/${widget.image[position + m]}');
//          }

          return Transform(
            transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(pi/3),
            alignment: Alignment.center,
            child: Container(
              color: Colors.redAccent,
              child: Center(
                child: Column(
                  children: [
//                  FadeInImage(
//                    placeholder: MemoryImage(kTransparentImage),
//                    image: getImage(),
//                  ),
                    Center(
                      child: Text(
                        widget.word[position + m],
                        style: TextStyle(color: Colors.black, fontSize: 50.0),
                      ),
                    ),
                    Center(
                      child: Text(
                        widget.meaning[position + m],
                        style: TextStyle(color: Colors.black, fontSize: 25.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
