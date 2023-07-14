import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  final storage = FirebaseStorage.instance;
  Rx<VideoPlayerController?> videoUrl = Rx<VideoPlayerController?>(null);

  @override
  void onInit() {
    fetchVideo(); // Fetch the video when the controller is initialized
    super.onInit();
  }
  void onClose() {
    videoUrl.value?.dispose(); // Dispose of the video player when the controller is closed
    super.onClose();
  }
  Future<void> fetchVideo() async {
    try {
      final ref = storage.ref().child('catalogue/catalogue.mp4');
      final videoPlayerController = VideoPlayerController.network(await ref.getDownloadURL());
      videoUrl.value = videoPlayerController;
    } catch (e) {
      // Handle any errors that occur during fetching
      print('Error fetching video: $e');
    }
  }
}
