import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../models/plist_model.dart';
import '../../../tool/http/api_list.dart';
class ProductController extends GetxController {
  //TODO: Implement ProductController
  ScrollController scrollController = ScrollController();
  RxList<PlistModelItem> productList = <PlistModelItem>[].obs;
  GlobalKey<ScaffoldState> scaffoldGlobalKey = GlobalKey<ScaffoldState>();
  RxInt page = 1.obs;
  RxInt pageSize = 8.obs;
  bool flag = true;
  RxBool hasData = true.obs;
  String sort = "";
  String? cid = "";
  String? keyWords = "";
  //二级导航数据
   List subHeaderList = [
     {"id":1, "title":"综合", "fileds":"all", "sort":-1,},
     {"id":2, "title":"销量", "fileds":"salecount", "sort":-1,},
     {"id":3, "title":"价格", "fileds":"price", "sort":-1,},
     {"id":4, "title":"筛选", }
   ];
   //二级导航选择判断
  RxInt selectHeaderId = 1.obs;
  //主要解决箭头无法更新的问题!
  RxInt subHeaderSort = 1.obs;
  @override
  void onInit() {
    super.onInit();
    cid = Get.arguments["cid"];
    keyWords = Get.arguments["keyWords"];
    getProductList();
    initScrollController();
    print('********************');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void getProductList() async{
    print('9999999999999');
    print("${Get.arguments["keyWords"]}**--------------");
    print("${hasData.value}**--------------");

    if(flag==true && hasData.value==true){
      flag=false;
      Map<String, dynamic> params = {"cid":cid,"page":page.value,"pageSize":pageSize.value,"sort":sort,"search":keyWords};

      print("$params//////////////params////////////////");
      var response = await Api.getProductListByCate(params);
      if(response!=null){
        var pist = PlistModel.fromJson(response.data);
        productList.addAll(pist.result!);
        if(pist.result!.length<pageSize.value && page.value>1){
          hasData.value=false;
        }
        page.value++;
        flag=true;
        update();
        print("${page.value}---------打印页码---------");

      }
    }else{
      print("没进来");
    }

  }

  void initScrollController(){
    scrollController.addListener(() {
      //如果滚动的高度 大于 页面高低-20  判断快阶级底部
      if(scrollController.position.pixels>(scrollController.position.maxScrollExtent - 20)){
        print("滚动到底了");
        getProductList();
      }
    });
  }

  void changeSubHeaderId(id){
    selectHeaderId.value = id;
    print("$id*****************id*****************");
    if(id==4){
     scaffoldGlobalKey.currentState!.openEndDrawer();
    }else{
      sort = "${subHeaderList[id-1]["fileds"]}_${subHeaderList[id-1]["sort"]}";
      subHeaderList[id-1]["sort"] = subHeaderList[id-1]["sort"]*-1;
      subHeaderSort.value = subHeaderList[id-1]["sort"];
      page.value = 1;
      flag = true;
      scrollController.jumpTo(0);
      productList.value= [];
      getProductList();
    }
    update();
  }
}
