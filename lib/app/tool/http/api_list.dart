import 'http_client.dart';
class Api {
  static getFirstCateList (){
      return HttpClient().get("/pcate");
  }
  static getSecondCateList (params){
    return HttpClient().get("/pcate",params:params);
  }
  static getProductListByCate (params){
    print(params);
    print('--------------参数---------------');
    return HttpClient().get("/plist",params:params);
  }
}