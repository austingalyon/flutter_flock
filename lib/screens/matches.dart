import 'package:flutter/material.dart';
import 'contact.dart';
import '../data/matches_model.dart';

class Matches extends StatefulWidget {
  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  @override
  initState() {
    _LoadData();
  }

  void _LoadData() {
    // var json data here
  }

  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Submit"),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => Contact())),
    );
  }
}
