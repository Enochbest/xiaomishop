import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/category_controller.dart';
class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);

  Widget _appBar(){
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: 800.w,
      height: 96.h,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(246, 246, 246, 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const Icon(Icons.search,color: Color.fromRGBO(189, 180, 171, 1),),
              Text('手机',style: TextStyle(fontSize: ScreenUtil().setSp(36),color: const Color.fromRGBO(189, 180, 171, 1)))
            ],
          ),
          // const Icon(Icons.adf_scanner,color: Color.fromRGBO(189, 180, 171, 1)),
        ],
      ),
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
          IconButton(onPressed: (){}, icon:  const Icon(Icons.message,color: Colors.grey)),
        ],
      ),
      body: Row(
        children: [
          Container(
            color: Colors.white,
            width:280.w,
            height: double.infinity,
            child: Obx(()=>
                ListView.builder(
                  itemCount: controller.firstCateList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 180.h,
                      child: InkWell(
                        onTap: (){
                          controller.changeIndex(index);
                          controller.getSecondCateList(controller.firstCateList[index].sId);
                          print(controller.firstCateList[index].sId);
                        },
                        child: Obx(()=>Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 10.w,
                                height: 46.h,
                                color: controller.selectIndex.value == index? Colors.orange : Colors.white,
                              ),
                            ),
                            Center(
                              child: Text("${controller.firstCateList[index].title}",style: TextStyle(
                                  fontSize: ScreenUtil().setSp(36),
                                  fontWeight: controller.selectIndex.value == index? FontWeight.bold : FontWeight.normal
                              ),),
                            )
                          ],
                        )),
                      ),
                    );
                  },
                )),
          ),
          Expanded(
            flex: 1,
            child: Obx(()=>Container(
              height: double.infinity,
              color: Colors.white,
              child: GridView.builder(
                  itemCount: controller.secondCateList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 40.w,
                      childAspectRatio: 240/346
                  ),
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed("/product-list",arguments: {"cid":controller.secondCateList[index].sId});
                      },
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Image.network("https://xiaomi.itying.com/${controller.secondCateList[index].pic}",fit: BoxFit.fitHeight,),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20.w, 0, 0),
                            child: Text("${controller.secondCateList[index].title}",style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
                          )
                        ],
                      ),
                    );
                  }),
            )),
          )
        ],
      )
    );
  }
}
