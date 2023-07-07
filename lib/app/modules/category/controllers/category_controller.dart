import 'package:get/get.dart';
import '../../../models/bestcate_model.dart';
import 'dart:convert';
import '../../../tool/http/api_list.dart';
class CategoryController extends GetxController {
  //TODO: Implement CategoryController

  RxInt selectIndex = 0.obs;
  RxList<BestCateModelItem> firstCateList = <BestCateModelItem>[].obs;
  RxList<BestCateModelItem> secondCateList = <BestCateModelItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    getFirstCateList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeIndex(index) {
    selectIndex.value = index;
    print(selectIndex.value);
    update();
  }

  getFirstCateList() async{
    var response =   await Api.getFirstCateList();
    var cateList = BestCateModel.fromJson(response.data);
    firstCateList.value = cateList.result!;

    print(json.encode(cateList.result));
    getSecondCateList(firstCateList[0].sId);
    update();
  }
  getSecondCateList(pid) async{
    var response =  await Api.getSecondCateList({"pid":pid});
    var secondList = BestCateModel.fromJson(response.data);
    secondCateList.value = secondList.result!;
    print(json.encode(secondList.result));
    print(json.encode(response.statusCode));
    update();
  }

  test() async{
    var response =  await Api.getFirstCateList();
    var cateList = BestCateModel.fromJson(response.data);

    print(json.encode(cateList.result));
    print('----------------------------');

  }
}
