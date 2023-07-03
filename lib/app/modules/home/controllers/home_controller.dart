import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../../models/focus_model.dart';
class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxBool flag = false.obs;
  final ScrollController scrollController = ScrollController();
  final count = 0.obs;
  //限定类型,这样才能利用模型类进行字段提示
  RxList<ResultItemModel> swiperList = <ResultItemModel>[].obs;

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
    getSwiperList();
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
  getSwiperList() async{
    var response =  await Dio().get("https://xiaomi.itying.com/api/focus");
    var focus = FocusModel.fromJson(response.data);
    swiperList.value = focus.result!;
    update();
  }
}
