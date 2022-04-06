import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interest/controller/home_controller.dart';

import 'widgets/tag_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    homeController.getTopicList();
    return const Scaffold(body: TagWidget());
  }
}
