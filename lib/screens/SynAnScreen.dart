import 'package:flutter/material.dart';
import 'package:wordit/helper/SynonymLoader.dart';

class SynAnScreen extends StatefulWidget {
  @override
  _SynAnScreenState createState() => _SynAnScreenState();
}

class _SynAnScreenState extends State<SynAnScreen> {
  List<FlatButton> syns = [];

  FlatButton synButton(String syns){
    return FlatButton(
      onPressed: (){},
      child: Text(syns),
    );
  }

  @override
  Widget build(BuildContext context) {
    loadsyns();
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Word'),
//              GridView.count(
//                physics: BouncingScrollPhysics(),
//                shrinkWrap: true,
//                crossAxisCount: 3,
//                children: List.generate(12, (index) {
//                  return Center(
//                    child: FlatButton(
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(10.0),
//                      ),
//                      color: Colors.red,
//                      onPressed: () {},
//                      child: Text(
//                        'whut',
//                      ),
//                    ),
//                  );
//                }),
//              ),
              Wrap(
                children: [
                  FlatButton(
                    child: Text('he'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('he'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('hedscdsfds'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('he'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('he'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('he'),
                    onPressed: () {},
                  ),FlatButton(
                    child: Text('he'),
                    onPressed: () {},
                  ),FlatButton(
                    child: Text('he'),
                    onPressed: () {},
                  ),
                ],
              ),
              Card(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Text('Antonym'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
