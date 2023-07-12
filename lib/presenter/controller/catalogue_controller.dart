import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import '../../models/video_model.dart';
class VideoController extends GetxController {
  Rx<Video> video = Rx<Video>(Video as Video);
  void fetchVideo() async {
    final storage = FirebaseStorage.instance;
    final Reference ref = storage.ref().child('catalogue').child('video_filename.mp4');
    final videoUrl = await ref.getDownloadURL();
    video.value = Video(url: videoUrl);
  }
}
