import 'storage.dart';

class SearchServices{
  static setHistory(keyWords) async{
    List? searchListData = await Storage.getData("searchList");
    if(searchListData!=null){
      var hasData = searchListData
    }else{
      List temPlist = [];
      temPlist.add(keyWords);
      await Storage.setData("searchList", keyWords);
    }
  }
}