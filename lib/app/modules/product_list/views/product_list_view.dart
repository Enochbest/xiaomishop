import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_list_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);
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
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(26.h, 200.w, 26.h, 26.h),
        itemCount: 10,
        itemBuilder: (context,index){
          return Container(
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
                    "https://xiaomi.itying.com/public/upload/DjXIpErQNsPo4qj_8c4GVmRg.jpg",
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
                            "Redimi Note 11",
                            style: TextStyle(fontSize: ScreenUtil().setSp(42),fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Text(
                            "内外双旗舰屏幕 | 莱卡专业光学镜头 | 莱卡原生画质",
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
                          "¥8999起",
                          style: TextStyle(fontSize: ScreenUtil().setSp(39),fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        title: _appBar(),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
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
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 16.h, 0, 16.h),
                            child: Text(
                              "综合",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize:ScreenUtil().setSp(36)
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 16.h, 0, 16.h),
                            child: Text(
                              "销量",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:ScreenUtil().setSp(36)
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 16.h, 0, 16.h),
                            child: Text(
                              "价格",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:ScreenUtil().setSp(36)
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 16.h, 0, 16.h),
                            child: Text(
                              "筛选",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:ScreenUtil().setSp(36)
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                            width: 200.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.w),
                              color: Colors.grey,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("333"),
                                const Icon(Icons.arrow_drop_down)
                              ],
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
