import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../../tool/keepalivewrapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../tool/itying_fonts.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

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
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
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
          ),
          Container(
            width: 1080.w,
            height: 470.h,
            color: Colors.red,
            child: Swiper(
              itemBuilder: (context, index){
                return GridView.builder(
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 20.w
                    ),
                    itemBuilder: (context ,index){
                      return Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 136.h,
                            width: 136.h,
                            child: Image.network("https://xiaomi.itying.com/public//upload//HYWKHxrKgE9O6zKajRTmb50B.png",fit:BoxFit.fitHeight,),
                          ),
                          Text('手机')
                        ],
                      );
                    }
                );
              },
              itemCount: 2,
            ),
          )
        ],
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
        child:Scaffold(
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
