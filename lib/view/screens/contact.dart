import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/contact_controller.dart';
import '../widgets/my_custom_text.dart';
class Contact extends StatelessWidget {
  final ContactController controller = Get.put(ContactController());
  Contact({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
           Container(
             height: 350,
             width: 200,
             child:  Image.asset('assets/images/c.png'),
           ),
            const SizedBox(
              height: 20,
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
                            text: 'Park Mall 8 eme Etage',
                          ),
                          MyCustomTextWidget(
                            index: 2,
                            text: 'Sétif - Algérie',
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
              height: 80,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell (
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
                  InkWell (
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
                  InkWell (
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
      )
    );
  }
}