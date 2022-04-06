import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_homeController) {
      return ListView.builder(
          itemCount: _homeController.topicList.length,
          itemBuilder: (context, index1) {
            // print(_homeController.topicList[index1].topic.toString());
            _homeController
                .addX(_homeController.topicList[index1].topic.toString());
            

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  _homeController.topicList[index1].topic!,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Wrap(
                  children: List.generate(
                    _homeController.topicList[index1].subtopics!.length,
                    (index2) {
                      final subTopic =
                          _homeController.topicList[index1].subtopics![index2];
                      final topic = _homeController.topicList[index1];
                      print(_homeController.myResults.toString());
                      return InkWell(
                        onTap: () {
                          _homeController.add(topic, subTopic);
                          // print(_homeController.checkSubTopic(topic, subTopic));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: 
                              // _homeController.myResults[topic.topic!]!
                              //         .contains(subTopic)
                              //     ? Colors.blue.withOpacity(0.5)
                              //     : 
                                  Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(subTopic.stname!),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          });
    });
  }
}
