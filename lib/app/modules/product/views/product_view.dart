import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);
  Widget _appBar(){
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: 900.w,
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
  Widget _productList(){
    return Obx(() =>
        controller.productList.isNotEmpty ?ListView.builder(
            controller: controller.scrollController,
            padding: EdgeInsets.fromLTRB(26.h, 200.w, 26.h, 26.h),
            itemCount: controller.productList.length,
            itemBuilder: (context,index){
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 26.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.w)
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(60.w),
                          width: 400.w,
                          height: 460.w,
                          child: Image.network(
                            "https://xiaomi.itying.com/${controller.productList[index].sPic}",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 20.h),
                                child: Text(
                                    "${controller.productList[index].title}",
                                    style: TextStyle(fontSize: ScreenUtil().setSp(42),fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 20.h),
                                child: Text(
                                    "${controller.productList[index].subTitle}",
                                    style: TextStyle(fontSize: ScreenUtil().setSp(34))),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 20.h),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            "超大屏",
                                            style: TextStyle(
                                                fontSize: ScreenUtil().setSp(34),
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text(
                                            "6.1寸",
                                            style: TextStyle(
                                                fontSize: ScreenUtil().setSp(34)
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            "超大屏",
                                            style: TextStyle(
                                                fontSize: ScreenUtil().setSp(34),
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text(
                                            "6.1寸",
                                            style: TextStyle(
                                                fontSize: ScreenUtil().setSp(34)
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            "超大屏",
                                            style: TextStyle(
                                                fontSize: ScreenUtil().setSp(34),
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text(
                                            "6.1寸",
                                            style: TextStyle(
                                                fontSize: ScreenUtil().setSp(34)
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                  "¥${controller.productList[index].price}元",
                                  style: TextStyle(fontSize: ScreenUtil().setSp(39),fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  (index == controller.productList.length-1)? _processIndicator() : const Text("")
                ],
              );
            }
        ) : _processIndicator()
    );
  }

  Widget _processIndicator(){
    if(controller.hasData.value){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }else{
      return const Center(
        child: Text("-----我也是有底线的-----"),
      );
    }
  }

  Widget _showIcon(id){
    if(id==2 || id==3 || controller.subHeaderSort.value==1 || controller.subHeaderSort.value==-1){
      if(controller.subHeaderList[id-1]["sort"]==1){
        return const Icon(Icons.arrow_drop_down,color: Colors.black54,);
      }else{
        return const Icon(Icons.arrow_drop_up,color: Colors.black54,);
      }
    }else{
      return const Text("");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldGlobalKey,
      endDrawer: const Drawer(
        child: DrawerHeader(
          child: Text("右侧筛选"),
        ),
      ),
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        title: _appBar(),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Text("")
        ],
      ),
      body: Stack(
        children: [
          _productList(),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 220.h,
              width: 1080.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          width: 1.h,
                          color:  const Color.fromRGBO(233, 233, 233, 0.9)
                      )
                  )
              ),
              child: Column(
                children: [
                  Obx(() => Row(
                    children: controller.subHeaderList.map((value) =>
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (){
                                  controller.changeSubHeaderId(value["id"]);
                                },
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 16.h, 0, 16.h),
                                  child: Text(
                                    "${value["title"]}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: value["id"] ==controller.selectHeaderId.value? Colors.orange : Colors.black54,
                                        fontSize:ScreenUtil().setSp(40)
                                    ),
                                  ),
                                ),
                              ),
                              _showIcon(value["id"])
                            ],
                          ),
                        ),
                    ).toList(),
                  )),
                  Container(
                    padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                    width: 1080.w,
                    height: 100.h,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 20,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return Container(
                            margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                            alignment: Alignment.center,
                            height: 50.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.w),
                              color: Colors.grey,
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("光阿萨德照"),
                                  const Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                          );

                          // Row(
                          //   children: [
                          //     Container(
                          //       padding: EdgeInsets.fromLTRB(30.w, 0, 30.w, 0),
                          //       color:Colors.grey,
                          //       child: Row(
                          //         children: [
                          //           Text("运动"),
                          //           const Icon(Icons.arrow_drop_down)
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // )
                        }
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
