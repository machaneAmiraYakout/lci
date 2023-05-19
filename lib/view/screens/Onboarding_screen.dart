import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/onBoarding_controller.dart';
import '../widgets/colors.dart';
import '../widgets/curve_container.dart';
import '../widgets/my_custom_button.dart';
class OnboardingScreen extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           Stack(children: [
             CurvedContainer(height: 110,), // hada l orange
             CurvedContainer(height: 100,color: Colors.white,),
             CurvedContainer(height: 90,color: primaryColor), // hada blue
             CurvedContainer(height: 80,color: Colors.white,),
             Image.asset('assets/images/lg.jpg',height: 50,width: 50,),
           ],),
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.onboardingItems.length,
                itemBuilder: (context, index) {
                  return OnboardingItemWidget(
                    onboardingItem: controller.onboardingItems[index],
                  );
                },
                onPageChanged: controller.onPageChanged,
              ),
            ),
            SizedBox(height: 10.0),
            Obx(() =>
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.buildPageIndicator(),
                )),
            SizedBox(height: 10.0),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
               child:  CustomButton(
               text:'Get Started' ,
               onPressed:controller.goToNextPage,
               sideColor: buttonColor,
               onPrimary:Colors.white ,
               primary:buttonColor
           ),),
          ],
        ),
      ),
    );
  }
}