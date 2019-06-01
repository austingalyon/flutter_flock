import 'package:flutter/cupertino.dart';
import 'topics_model.dart';

class MatchModel {
  final String url;
  final String description;
  final List<TopicsModel> topics;

  MatchModel(
      {@required this.url, @required this.description, @required this.topics});

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    var topic = json['topics'] as List;
    List<TopicsModel> topicsList =
        topic.map((i) => TopicsModel.fromJson(i)).toList();

    return MatchModel(
        url: json['url'], description: json['description'], topics: topicsList);
  }
}
