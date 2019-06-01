import 'package:flutter/material.dart';
import 'experience.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Login"),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => Experience())),
    );
  }
}
