import 'package:get/get.dart';
import 'package:flutter/material.dart';
class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxBool flag = false.obs;
  final ScrollController scrollController = ScrollController();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if(scrollController.position.pixels >20){
        if(flag.value==false){
          flag.value = true;
          update();
        }
      }
      if(scrollController.position.pixels <20){
        if(flag.value==true){
          flag.value = false;
          update();
        }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
