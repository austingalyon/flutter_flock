import 'package:flutter/cupertino.dart';

class TopicsModel {
  final String name;
  final bool isExpert;

  TopicsModel({@required this.name, @required this.isExpert});

  factory TopicsModel.fromJson(Map<String, dynamic> json) {
    return TopicsModel(name: json['name'], isExpert: json['isExpert']);
  }
}
