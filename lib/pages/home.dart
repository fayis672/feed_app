import 'package:feed_app/controller/feed_controller.dart';
import 'package:feed_app/controller/scroll_controller.dart';
import 'package:feed_app/model/feed.dart';
import 'package:feed_app/widgets/scroll_indicater.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  //depandacy injection of the controll of getX
  final FeedControler _feedControler = Get.put(FeedControler());
  final MyScrollContrller _myScrollContrller = Get.put(MyScrollContrller());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body: _feedControler.isloading.value //checing for data loading
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  // main listview
                  ListView.builder(
                      controller: _myScrollContrller.scrollController,
                      itemCount:
                          (_feedControler.feed.value.data?.components?.length ??
                                  0) +
                              1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Stack(
                            children: [
                              //header image
                              FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image:
                                    _feedControler.feed.value.data?.coverUrl ??
                                        "",
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 20.0,
                                left: 10.0,
                                //header title
                                child: Text(
                                  _feedControler.feed.value.data?.title ??
                                      "title",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          );
                          // chacking for type of componenet
                        } else if (_feedControler
                                .feed.value.data?.components?[index - 1].type ==
                            Type.text) {
                          // text component
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(5),
                              title: Text(
                                _feedControler.feed.value.data
                                        ?.components?[index - 1].title ??
                                    "Title",
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                _feedControler.feed.value.data
                                        ?.components?[index - 1].desc ??
                                    "descrption",
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        } else {
                          //image component
                          return FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            fit: BoxFit.cover,
                            image: _feedControler.feed.value.data
                                    ?.components?[index - 1].url ??
                                "",
                          );
                        }
                      }),

                  ScrollIndicator(), //created custom scroll indicater
                ],
              )));
  }
}
