import 'package:flutter/material.dart';
import 'contact.dart';

class Matches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Submit"),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => Contact())),
    );
  }
}
