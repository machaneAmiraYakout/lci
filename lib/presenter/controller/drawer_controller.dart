import 'package:get/get.dart';

class HomeController extends GetxController {
  var isSideMenuOpen = false.obs;

  void openSideMenu() {
    isSideMenuOpen.value = !isSideMenuOpen.value;
  }
}
