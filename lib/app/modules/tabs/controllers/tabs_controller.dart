import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../cart/views/cart_view.dart';
import '../../category/views/category_view.dart';
import '../../home/views/home_view.dart';
import '../../service/views/service_view.dart';
import '../../users/views/users_view.dart';
class TabsController extends GetxController {
  //TODO: Implement TabsController
  RxInt currentIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);
  final List<Widget> pages = [
    HomeView(),
    CategoryView(),
    ServiceView(),
    CartView(),
    UsersView(),
  ];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  setCurrentIndex(index){
    currentIndex.value = index;
    update();
  }
  getCurrentPage(){
    return pages[currentIndex.value];
  }

}
