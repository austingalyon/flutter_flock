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
        '[{"name":"Hilary Cleatherow","url":"https://randomuser.me/api/portraits/women/84.jpg","description":"Inverse web-enabled knowledge user","topics":[{"name":"android","isExpert":true},{"name":"ios","isExpert":false},{"name":"packages","isExpert":false},{"name":"plugins","isExpert":false},{"name":"ui/ux","isExpert":true},{"name":"widgets","isExpert":true}]},{"name":"Rana Lassen","url":"https://randomuser.me/api/portraits/women/36.jpg","description":"Switchable heuristic knowledge base","topics":[{"name":"android","isExpert":false},{"name":"ios","isExpert":true},{"name":"packages","isExpert":false},{"name":"plugins","isExpert":false},{"name":"ui/ux","isExpert":false},{"name":"widgets","isExpert":false}]},{"name":"Salem Munnion","url":"https://randomuser.me/api/portraits/men/84.jpg","description":"Diverse logistical emulation","topics":[{"name":"android","isExpert":false},{"name":"ios","isExpert":true},{"name":"packages","isExpert":false},{"name":"plugins","isExpert":false},{"name":"ui/ux","isExpert":false},{"name":"widgets","isExpert":true}]},{"name":"Brenden Whardley","url":"https://randomuser.me/api/portraits/men/25.jpg","description":"Self-enabling fresh-thinking matrix","topics":[{"name":"android","isExpert":true},{"name":"ios","isExpert":false},{"name":"packages","isExpert":false},{"name":"plugins","isExpert":true},{"name":"ui/ux","isExpert":true},{"name":"widgets","isExpert":false}]},{"name":"Flossie McKane","url":"https://randomuser.me/api/portraits/women/63.jpg","description":"Fundamental global task-force","topics":[{"name":"android","isExpert":true},{"name":"ios","isExpert":false},{"name":"packages","isExpert":true},{"name":"plugins","isExpert":false},{"name":"ui/ux","isExpert":true},{"name":"widgets","isExpert":true}]},{"name":"Hector Hackett","url":"https://randomuser.me/api/portraits/men/4.jpg","description":"Seamless bi-directional flexibility","topics":[{"name":"android","isExpert":false},{"name":"ios","isExpert":false},{"name":"packages","isExpert":true},{"name":"plugins","isExpert":true},{"name":"ui/ux","isExpert":false},{"name":"widgets","isExpert":true}]},{"name":"Archibald Farey","url":"https://randomuser.me/api/portraits/men/19.jpg","description":"Secured bandwidth-monitored frame","topics":[{"name":"android","isExpert":true},{"name":"ios","isExpert":false},{"name":"packages","isExpert":true},{"name":"plugins","isExpert":true},{"name":"ui/ux","isExpert":true},{"name":"widgets","isExpert":false}]},{"name":"Alessandra Mangeney","url":"https://randomuser.me/api/portraits/women/55.jpg","description":"Multi-channelled 5th generation array","topics":[{"name":"android","isExpert":false},{"name":"ios","isExpert":false},{"name":"packages","isExpert":false},{"name":"plugins","isExpert":true},{"name":"ui/ux","isExpert":false},{"name":"widgets","isExpert":true}]},{"name":"Lindy Vasiliu","url":"https://randomuser.me/api/portraits/women/22.jpg","description":"Mandatory grid-enabled software","topics":[{"name":"android","isExpert":true},{"name":"ios","isExpert":true},{"name":"packages","isExpert":true},{"name":"plugins","isExpert":false},{"name":"ui/ux","isExpert":false},{"name":"widgets","isExpert":true}]},{"name":"Elysee Labbett","url":"https://randomuser.me/api/portraits/women/15.jpg","description":"Virtual 24/7 contingency","topics":[{"name":"android","isExpert":false},{"name":"ios","isExpert":false},{"name":"packages","isExpert":true},{"name":"plugins","isExpert":false},{"name":"ui/ux","isExpert":true},{"name":"widgets","isExpert":true}]}]';

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
