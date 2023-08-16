import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  Widget _appBar(){
    return Container(
      // padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      width: 800.w,
      height: 96.h,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(246, 246, 246, 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        autofocus: true,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(38)
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none
          )
        ),
        //监听输入框输入事件
        onChanged: (value){
          controller.keyWords = value;
        },
        //监听回车事件
        onSubmitted: (value){
          Get.offAndToNamed("/product",arguments: {"keyWords" : value});
        },
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBar(),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(onPressed: (){
            Get.offAndToNamed("/product",arguments: {"keyWords" : controller.keyWords});
          }, child:  Text("搜索",style: TextStyle(
            fontSize: ScreenUtil().setSp(42),
            color: Colors.black87
          ),))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20.h),
        children: [
            Padding(
                padding: EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("搜索历史",style: TextStyle(fontSize: ScreenUtil().setSp(42)),),
                    const Icon(Icons.delete_forever_sharp)
                  ],
                ),
            ),
            Wrap(
              spacing: 20.w,
              // 纵向的间距
              runSpacing: 20.h,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(32.w, 10.w, 32.w, 10.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.w)
                  ),
                  child: const Text("手机"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(32.w, 10.w, 32.w, 10.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.w)
                  ),
                  child: const Text("笔记本"),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("搜索历史",style: TextStyle(fontSize: ScreenUtil().setSp(42)),),
                  const Icon(Icons.refresh)
                ],
              ),
            ),
            Wrap(
              spacing: 20.w,
              // 纵向的间距
              runSpacing: 20.h,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(32.w, 10.w, 32.w, 10.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.w)
                  ),
                  child: Text("手机"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(32.w, 10.w, 32.w, 10.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.w)
                  ),
                  child: Text("笔记本"),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 138.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/2.0x/hot_search.png")
                      )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.w),
                    child: GridView.builder(
                        itemCount: 8,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 40.w,
                          mainAxisSpacing: 20.h,
                          childAspectRatio: 3 / 1
                        ),
                        itemBuilder: ((context,index){
                          return Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 120.w,
                                padding: EdgeInsets.all(10.w),
                                child: Image.network("https://www.itying.com/images/shouji.png",fit: BoxFit.fitHeight,),
                              ),
                              Expanded(child: Container(
                                padding: EdgeInsets.all(10.w),
                                alignment: Alignment.topLeft,
                                child: const Text("小米净化器 热水器 小米净化器"),
                              ))
                            ],
                          );
                        })
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
