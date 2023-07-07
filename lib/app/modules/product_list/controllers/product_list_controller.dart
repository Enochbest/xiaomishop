import 'package:get/get.dart';
import '../../../models/plist_model.dart';
import '../../../tool/http/api_list.dart';

class ProductListController extends GetxController {
  //TODO: Implement ProductListController
  RxList<PlistModelItem> productList = <PlistModelItem>[].obs;
  RxInt page = 1.obs;
  RxInt pageSize = 8.obs;
  @override
  void onInit() {
    super.onInit();
    getProductList();
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

    var response = await Api.getProductListByCate({"cid":Get.arguments["cid"],"page":page.value,"pageSize":pageSize.value});
    if(response!=null){
      var pist = PlistModel.fromJson(response.data);
      productList.value = pist.result!;
    }
  }
}
