// To parse this JSON data, do
//
//     final topic = topicFromJson(jsonString);

import 'dart:convert';

List<Topic> topicFromJson(String str) =>
    List<Topic>.from(json.decode(str).map((x) => Topic.fromJson(x)));

class Topic {
  Topic({
    this.id,
    this.topic,
    this.subtopics,
  });

  int? id;
  String? topic;
  List<Subtopic>? subtopics;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["id"],
        topic: json["topic"],
        subtopics: List<Subtopic>.from(
            json["subtopics"].map((x) => Subtopic.fromJson(x))),
      );
}

class Subtopic {
  Subtopic({
    this.stname,
  });

  String? stname;

  factory Subtopic.fromJson(Map<String, dynamic> json) => Subtopic(
        stname: json["stname"],
      );
}
