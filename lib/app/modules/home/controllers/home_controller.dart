import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../../models/focus_model.dart';
import '../../../models/bestcate_model.dart';
import '../../../models/plist_model.dart';
import 'dart:convert';
class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxBool flag = false.obs;
  final ScrollController scrollController = ScrollController();
  final count = 0.obs;
  //限定类型,这样才能利用模型类进行字段提示
  RxList<ResultItemModel> swiperList = <ResultItemModel>[].obs;
  RxList<ResultItemModel> bestSellingSwiperList = <ResultItemModel>[].obs;
  RxList<BestCateModelItem> bestCateList = <BestCateModelItem>[].obs;
  RxList<PlistModelItem> hotSellingList = <PlistModelItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    addController();
    getSwiperList();
    getBestCateList();
    getBestSellingSwiperList();
    getHotSellingList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  addController(){
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
  void increment() => count.value++;
  getSwiperList() async{
    var response =  await Dio().get("https://xiaomi.itying.com/api/focus");
    var focus = FocusModel.fromJson(response.data);
    swiperList.value = focus.result!;
    update();
  }

  getBestCateList() async{
    var response =  await Dio().get("https://xiaomi.itying.com/api/bestCate");
    var focus = BestCateModel.fromJson(response.data);
    bestCateList.value = focus.result!;
    print(json.encode(focus.result));
    update();
  }

  //获取甄选分类轮播数据
  getBestSellingSwiperList() async{
    var response =  await Dio().get("https://xiaomi.itying.com/api/focus?position=2");
    var focus = FocusModel.fromJson(response.data);
    bestSellingSwiperList.value = focus.result!;
    update();
  }
  //获取热销商品数据
  getHotSellingList() async{
    var response =  await Dio().get("http://xiaomi.itying.com/api/plist?is_hot=1&pageSize=3");
    var hotSelling = PlistModel.fromJson(response.data);
    hotSellingList.value = hotSelling.result!;
    print(json.encode(hotSelling.result));
    update();
  }
}
