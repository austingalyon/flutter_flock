import 'package:flutter/material.dart';
import 'matches.dart';

class Experience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Submit"),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => Matches())),
    );
  }
}
