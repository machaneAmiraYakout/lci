import 'package:elearning/presenter/controller/signup_controller.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../view/screens/BottomBar_screen.dart';
class AuthenticationGoogleController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String selectedEmail = '';
  bool googleIsTapped=false;
  final SignupController signupController = Get.put(SignupController());
  Future<void> signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await auth.signInWithCredential(credential);
      Get.to(() => BottomBar());
    } catch (e) {
      print('Google sign-in failed: $e');
    }
  }
}