import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 36.0, bottom: 36.0),
                      child: CircleAvatar(
                          radius: 64.0,
                          backgroundImage: new AssetImage("assets/guru.jpg")),
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.twitter),
                      title: Text('@flutter_guru'),
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.facebook),
                      title: Text('facebook'),
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.github),
                      title: Text('github'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
//    return Container(
//      child: ListView(children: [
//        Container(
//          child: CircleAvatar(backgroundImage: new AssetImage("assets/guru.jpg")
//    ),
//        ),
//        RaisedButton(
//          child: Text("Submit"),
//          onPressed: () => Navigator.pop(context),
//        ),
//      ]),
//    );
  }
}
