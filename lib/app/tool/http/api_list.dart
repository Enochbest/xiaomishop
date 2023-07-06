import 'http_client.dart';
class Api {
  static getFirstCateList (){
      return HttpClient().get("/pcate");
  }
  static getSecondCateList (params){
    print(params);
    print('挨批中///////////////////');
    return HttpClient().get("/pcate",params:params);
  }
}