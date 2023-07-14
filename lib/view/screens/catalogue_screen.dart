import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../presenter/controller/catalogue_controller.dart';
class Catalogue extends StatelessWidget {
  final VideoController videoController = Get.put(VideoController());

  Catalogue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
        child: GetX<VideoController>(
          builder: (controller) {
            final videoUrl = controller.videoUrl.value;
            if (videoUrl == null) {
              return CircularProgressIndicator();
            } else {
              return AspectRatio(
                aspectRatio: 16 / 9, // Adjust the aspect ratio according to your video
                child: VideoPlayerWidget(videoPlayerController: videoUrl),
              );
            }
          },
        ),
      ),
      ),
    );
  }
}
class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController? videoPlayerController;
  const VideoPlayerWidget({Key? key, required this.videoPlayerController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    videoPlayerController!.initialize().then((_) {
      videoPlayerController!.play();
    });
    return FutureBuilder(
      future: videoPlayerController!.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return VideoPlayer(videoPlayerController!);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
