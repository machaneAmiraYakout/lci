import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../presenter/controller/contact_controller.dart';
import '../widgets/my_custom_text.dart';
class Contact extends StatelessWidget {
  final ContactController controller = Get.put(ContactController());
  Contact({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/c.jpg'),
              Positioned(
                bottom: 160,
                left: 173,
                child: Image.asset(
                  'assets/images/lg.jpg',
                  width: 45,
                  height: 45,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/locc.png'),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyCustomTextWidget(
                          index: 2,
                          text: 'LCI Formation & Conseils ',
                        ),
                        MyCustomTextWidget(
                          index: 2,
                          text: 'Business Center',
                        ),
                        MyCustomTextWidget(
                          index: 2,
                          text: 'Park Mall 8 eme Etage- Sétif - Algérie',
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage('assets/images/phone.jpg'),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    MyCustomTextWidget(
                        index: 2, text: '0560 93 35 52 / 0560 01 19 72 '),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/ema.png',
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    MyCustomTextWidget(index: 2, text: 'contact@groupelci.com'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    String url = 'https://www.facebook.com/GroupeLCI';
                    try {
                      await controller.launchUrl(url);
                    } catch (e) {
                      print('Error launching URL: $e');
                    }
                  },
                  child: Image.asset('assets/images/fb.png', width: 40, height: 40),
                ),
                const SizedBox(width: 30),
                GestureDetector(
                  onTap: () async {
                    String url = 'https://www.instagram.com/groupe_lci/';
                    try {
                      await controller.launchUrl(url);
                    } catch (e) {
                      print('Error launching URL: $e');
                    }
                  },
                  child: Image.asset('assets/images/in.png', width: 40, height: 40),
                ),
                const SizedBox(width: 30),
                GestureDetector(
                  onTap: () async {
                    String url = 'https://www.linkedin.com/company/groupelci/';
                    try {
                      await controller.launchUrl(url);
                    } catch (e) {
                      print('Error launching URL: $e');
                    }
                  },
                  child: Image.asset('assets/images/lin.png', width: 40, height: 40),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
