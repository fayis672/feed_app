import 'package:flutter/material.dart';
import 'package:get/get.dart';

//controlling the scroll indicater position using scroll controller

class MyScrollContrller extends GetxController {
  late ScrollController scrollController;

  var move = 0.0.obs;

  // var scrollIndicatorVis = true.obs;

  @override
  void onInit() {
    scrollController = ScrollController();
    //adding listener to controller
    scrollController.addListener(() {
      //computing indicator position
      var currentPixel = scrollController.position.pixels;
      var mainContainer = scrollController.position.maxScrollExtent / 60;
      move.value = currentPixel / mainContainer;
      update();

      //updating chages
    });
    super.onInit();
  }
}
