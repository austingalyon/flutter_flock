import 'package:flutter/material.dart';
import 'contact.dart';
import '../data/matches_model.dart';
import 'dart:convert';

class Matches extends StatefulWidget {
  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  List<MatchModel> matches;

  @override
  initState() {
    matches = _LoadData();
  }

  List<MatchModel> _LoadData() {
    var exampleJson =
        '[{"url": "https://avatars1.githubusercontent.com/u/14101776?s=200&v=4", "name": "Flutter Flock", "description": "This is just a filler descripiton", "topics": [{"name": "ios", "isExpert": true}, {"name": "packages", "isExpert": true}, {"name": "plugins", "isExpert": false}]}]';

    var jsonDecoded = json.decode(exampleJson);
    var decoded =
        (jsonDecoded as List).map((data) => MatchModel.fromJson(data)).toList();

    return decoded;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Matches"),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Contact())),
            child: Card(
                child: Row(
              children: <Widget>[
                Image.network(
                  matches[index].url,
                  width: 50,
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("${matches[index].name}"),
                    Text("${matches[index].description}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        for (var topic in matches[index].topics)
                          if (topic.isExpert) Text(" •${topic.name}")
                      ],
                    )
                  ],
                )
              ],
            )),
          );
        },
        itemCount: matches.length,
      ),
    );

    // return RaisedButton(
    //   child: Text("Submit"),
    //   onPressed: () => Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => Contact())),
    // );
  }
}
