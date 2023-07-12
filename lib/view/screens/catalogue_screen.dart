import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/catalogue_controller.dart';
class Catalogue extends StatelessWidget {
  final VideoController videoController = Get.put(VideoController());
  @override
  void onInit() {
    videoController.fetchVideo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
      ),
       body:Container()
       //Obx(() {
      //   // if (videoController.video.value == null) {
      //   //   return CircularProgressIndicator();
      //   // } else {
      //   //   final videoUrl = videoController.video.value.url;
      //   //   return VideoPlayerWidget(url: videoUrl); // Replace VideoPlayerWidget with your actual video player widget
      //   // }
      // }),
    );
  }
}
