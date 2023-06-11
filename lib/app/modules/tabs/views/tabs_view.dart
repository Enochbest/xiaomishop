import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Scaffold(
          body: PageView(
            controller: controller.pageController,
            children: controller.pages,
            onPageChanged: (index){
              controller.setCurrentIndex(index);
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            onTap: (index){
              controller.setCurrentIndex(index);
              controller.pageController.jumpToPage(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "首页"),
              BottomNavigationBarItem(icon: Icon(Icons.category),label: "分类"),
              BottomNavigationBarItem(icon: Icon(Icons.message),label: "服务"),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: "购物车"),
              BottomNavigationBarItem(icon: Icon(Icons.people),label: "用户"),
            ],
          ),
        )
    );
  }
}
