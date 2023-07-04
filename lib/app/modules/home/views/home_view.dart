import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../../tool/keepalivewrapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../tool/itying_fonts.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  //导航栏
  Widget _appBar(){
    return Positioned(
      top: 0,
      left:0,
      right: 0,
      child: Obx(()=>AppBar(
        leading: controller.flag.value? const Text("") : const Icon(ItyingIcon.xiaomi,color: Colors.white,),
        leadingWidth: controller.flag.value? 0 : 140.w,
        title: AnimatedContainer(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          width: controller.flag.value? 800.w : 620.w,
          height: 96.h,
          decoration: BoxDecoration(
            color: const Color.fromARGB(230, 252, 243, 236),
            borderRadius: BorderRadius.circular(30),
          ),
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  const Icon(Icons.search,color: Color.fromRGBO(189, 180, 171, 1),),
                  Text('手机',style: TextStyle(fontSize: 36.sp,color: const Color.fromRGBO(189, 180, 171, 1)))
                ],
              ),
              // const Icon(Icons.adf_scanner,color: Color.fromRGBO(189, 180, 171, 1)),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: controller.flag.value? Colors.white:Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon:  Icon(Icons.qr_code,color: controller.flag.value? Colors.black87:Colors.white,)),
          IconButton(onPressed: (){}, icon:  Icon(Icons.message,color: controller.flag.value? Colors.black87:Colors.white,)),
        ],
      )),
    );
  }
  //轮播图
  Widget _homeSwiper(){
    return Container(
      width: 1080.w,
      height: 682.h,
      child: Obx(()=>Swiper(
        itemBuilder: (context, index){
          return Image.network("https://xiaomi.itying.com/${controller.swiperList[index].pic}",fit: BoxFit.fill,);
        },
        itemCount: controller.swiperList.length,
        pagination: const SwiperPagination(
            builder: SwiperPagination.rect
        ),
        autoplay: true,
        loop: true,

      )),
    );
  }
  //中间banner
  Widget _banner(){
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 30.h, 0, 30.h),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(ItyingIcon.duigou,size: 20,color: Colors.grey,),
              Text('官方商场',style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),)
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(ItyingIcon.duigou,size: 20,color: Colors.grey,),
              Text('售后无忧',style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),)
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(ItyingIcon.duigou,size: 20,color: Colors.grey,),
              Text('资质证照',style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),)
            ],
          ),
        ],
      ),
    );
  }
  //广告banner
  Widget _banner2(){
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
      child: Container(
        height: 420.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
          image:const DecorationImage(
            fit: BoxFit.cover, 
            image: AssetImage("assets/images/2.0x/xiaomiBanner2.png"),
          )
        ),
      ),
    );
  }
  //中间滑动分类
  Widget _cateSwiper(){
    return Obx(() =>
        Container(
          width: 1080.w,
          height: 500.h,
          child: Swiper(
            itemBuilder: (context, index){
              return GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.w
                  ),
                  itemBuilder: (context ,i){

                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 140.h,
                          width: 140.h,
                          child: Image.network("https://xiaomi.itying.com/${controller.bestCateList[index*10+i].pic}",fit:BoxFit.fitHeight,),
                        ),
                        Text('${controller.bestCateList[index*10+i].title}')
                      ],
                    );
                  }
              );
            },
            pagination: SwiperPagination(
                margin: const EdgeInsets.all(0.0),
                builder: SwiperCustomPagination(builder:
                    (BuildContext context, SwiperPluginConfig config) {
                  return ConstrainedBox(
                    constraints:  BoxConstraints.expand(height: 20.h),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: const RectSwiperPaginationBuilder(
                              color: Colors.black12,
                              activeColor: Colors.blue,
                            )
                                .build(context, config),
                          ),
                        )
                      ],
                    ),
                  );
                })),
            itemCount: controller.bestCateList.length~/10,
          ),
        )
    );
  }
  //甄选布局
  Widget _bestSelling(){
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(30.w, 40.w, 30.w, 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("热销甄选",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: ScreenUtil().setSp(46)
                ),),
                Text("更多手机推荐 >",style: TextStyle(
                    color: Colors.grey,
                    fontSize: ScreenUtil().setSp(38)
                ),)
              ],
            ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30.w, 0, 30.w, 30.h),
          child: Row(
            children: [
              Expanded(
                flex:1,
                child: Container(
                  height: 738.h,
                  child: Obx(()=>
                      Swiper(
                        itemBuilder: (context, index){
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.w),
                                // Image.network("https://itying.com/images/b_focus0${index+1}.png")
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:NetworkImage("https://xiaomi.itying.com/${controller.bestSellingSwiperList[index].pic}")
                                )
                            ),
                          );
                        },
                        itemCount: controller.bestSellingSwiperList.length,
                        // pagination: const SwiperPagination(
                        //     builder: SwiperPagination.rect
                        // ),
                        autoplay: true,
                        loop: true,

                      )
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                flex:1,
                child: Container(
                  height: 738.h,
                  color: Colors.white,
                  child: Obx(()=>
                      Column(
                        children: controller.hotSellingList.asMap().entries.map((entire){
                          var value = entire.value;

                          return Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, entire.key==2? 0 : 20.h),
                              color: const Color.fromRGBO(246, 246, 246, 1),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("${value.title}", style: TextStyle(fontSize: ScreenUtil().setSp(38),fontWeight: FontWeight.bold),),
                                        SizedBox(height: 10.h,),
                                        Text("${value.subTitle}", style: TextStyle(fontSize: ScreenUtil().setSp(28))),
                                        SizedBox(height: 10.h,),
                                        Text("众筹价${value.price}元", style: TextStyle(fontSize: ScreenUtil().setSp(34))),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.h),
                                      child: Image.network("https://xiaomi.itying.com/${value.pic}",fit: BoxFit.cover,),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        ).toList(),
                      )
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  //主页
  Widget _homePage(){
    return Positioned(
      top: -80.w,
      right: 0,
      bottom: 0,
      left:0,
        // https://www.itying.com/images/focus/focus02.png
      child:ListView(
        controller: controller.scrollController,
        children: [
          _homeSwiper(),
          _banner(),
          _cateSwiper(),
          _banner2(),
          _bestSelling(),
          SizedBox(
            height: 100,
          )
        ],
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
        child:Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              _homePage(),
              _appBar(),
            ],
          )
        )
    );
  }
}
