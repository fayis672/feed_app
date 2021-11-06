import 'package:feed_app/controller/scroll_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//custom scroll indicater

class ScrollIndicator extends StatelessWidget {
  ScrollIndicator({Key? key}) : super(key: key);

  final MyScrollContrller _scrollContrller = Get.put(MyScrollContrller());

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      right: 30,
      child: Container(
        height: 80,
        width: 8,
        decoration: BoxDecoration(
            color: Colors.white54, borderRadius: BorderRadius.circular(10)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Obx(() => Positioned(
                top: _scrollContrller.move.value,
                child: Container(
                  height: 20,
                  width: 8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ))),
          ],
        ),
      ),
    );
  }
}
