import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../../tool/keepalivewrapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../tool/itying_fonts.dart';
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
        child:Scaffold(
          // appBar: AppBar(
          //   title: const Text('HomeView'),
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          // ),
          body: Stack(
            children: [
              Positioned(
                top: -80.w,
                right: 0,
              bottom: 0,
              left:0,
              child:ListView.builder(
                  controller: controller.scrollController,
                  itemCount: 20,
                  itemBuilder: (context,index){
                    if(index==0){
                      return Container(
                        color: Colors.red,
                        width: 1.sw,
                        height: 682.h,
                        child: Image.network("https://www.itying.com/images/focus/focus02.png",fit: BoxFit.cover,),
                      );
                    }else{
                      return ListTile(
                        title: Text("第$index个列表"),
                      );
                    }
                  }),),
              Positioned(
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
              )
            ],
          )
        )
    );
  }
}
