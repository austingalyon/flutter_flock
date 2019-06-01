import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Submit"),
      onPressed: () => Navigator.pop(context),
    );
  }
}
