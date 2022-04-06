
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:interest/model/topic_model.dart';

class HomeController extends GetxController {
  List<Topic> _topicList = [];
  List<Topic> get topicList => _topicList;
  bool _isLoded = false;
  bool get isLoded => _isLoded;
  Map<String, List<String>> myResults = {};

  Future<void> getTopicList() async {
    String response = await rootBundle.loadString("assets/tag.json");

    _topicList = [];
    _topicList.addAll(topicFromJson(response));

    _isLoded = true;

    update();
  }

  void addX(String key) {
    myResults.addAll({key: []});
  }

  void add(Topic topic, Subtopic subtopic) async {
    List<String> l = myResults[topic.topic!]!;
    if (l.contains(subtopic.stname!)) {
      l.remove(subtopic.stname!);
    } else {
      l.add(subtopic.stname!);
    }
    myResults.addAll({topic.topic!: l});
    // update();
    print(myResults.toString());
  }

  bool checkSubTopic(Topic topic, Subtopic subtopic) {
    if (myResults[topic.topic!]!.contains(subtopic.stname)) {
      return true;
    }
    return false;
  }

  //----------------
  // @override 
  // void onInit(){
  //   super.onInit();
  //   test();
  // }
  // void test(){
  //   for(var d in _topicList){
  //      addX(d.topic.toString());
  //   }
  //   print(myResults.toString());
  // }
}
