import 'package:elearning/presenter/controller/course_controller.dart';
import 'package:elearning/presenter/controller/login_controller.dart';
import 'package:elearning/view/screens/contact.dart';
import 'package:elearning/view/screens/online_screen.dart';
import 'package:elearning/view/screens/service_screen.dart';
import 'package:elearning/view/screens/subcourses_screen.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elearning/view/widgets/my_custom_page.dart';
import '../../presenter/controller/home_controller.dart';
import '../widgets/my_custom_container.dart';
class GuestScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final CourseController courseController = Get.put(CourseController());
  GuestScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5.0,
        shadowColor: primaryColor,
        iconTheme: const IconThemeData(
          color: buttonColor, // Set the color of the drawer icon
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/lg.jpg',
              height: 40,
              width: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            MyCustomTextWidget(
              index: 10,
              text: 'LCI Group',
            )
          ],
        ),

      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/lg.jpg',
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MyCustomTextWidget(
                          index: 10,
                          text: 'LCI Group',
                        )
                      ],
                    ),
                  )),
            ),
            ListTile(
              onTap: () =>
                  Get.to(() =>
                  const CustomPage(
                      title: 'Presentation',
                      text:
                      'LCI Formation & Conseils est un institut privé créé en 2014, certifié ISO 9001 : 2015 par AFAQ AFNOR International sous le N° 94219, spécialisé en formation inter et intra entreprises dans les différents domaines et en conseils d’entreprises. Il assure aussi les services en tant que centre d’examen International pour : TFI, TOEIC, TOEFL Junior, CERT et Bright.'
                          ' \n\n LCI « Land of Creativity & Instruction » est géré par un staff jeune, qualifié, doté d’un esprit d’équipe développé, source de son dynamisme et sa régularité.'
                          '\n\n  L’institut bénéficie aussi d’un agrément délivré par le ministère du tourisme sous le nom : ZINE EL ABIDINE Travel Agency N°2329, qui assure l’organisation des évènements à l’échelle internationale.')),
              leading: const Icon(Icons.info, color: primaryColor),
              title: MyCustomTextWidget(index: 6, text: 'Presentation'),
            ),
            ListTile(
              onTap: () =>
                  Get.to(() =>
                  const CustomPage(
                      title: 'Edito',
                      text:
                      'Nous ne pouvons nier l’importance du savoir, toujours considéré comme un pilier incontournable de l’émancipation des sociétés et des personnes.'
                          ' \n\n Envisager la formation professionnelle sur le seul aspect de la transmission d’un savoir-faire peut sembler insuffisant pour cela, nous devons la placer dans une vision globale de la société prenant en compte, non seulement le geste technique mais aussi l’individu et les enjeux de la transition écologique qui sera demain au cœur des préoccupations de nos sociétés.'
                          '\n\n Nous n’avons pas pour seule ambition, de répondre aux politiques adéquationnistes – emplois et formations – mais nous souhaitons former des citoyens qui auront à apprendre et se former tout au long de la vie afin de s’adapter aux défis futurs auxquels ils serons confrontés .'
                          '\n\n Dr.Zine El Abidine HAMDI CHERIF'
                          '\n\n Directeur Général')),
              leading: const Icon(Icons.mode_edit_outline_rounded,
                  color: primaryColor),
              title: MyCustomTextWidget(index: 6, text: 'Edito'),
            ),
            ListTile(
              onTap: () =>
                  Get.to(() =>
                  const CustomPage(
                      title: 'Valeur',
                      text: 'Professionnalisme :'
                          '\n\n  Notre équipe est toujours mobilisée, s’impliquera pleinement afin de répondre au mieux à vos attentes. Notre professionnalisme est basé sur la confiance de notre clientèle; la capacité à tenir nos engagements est notre priorité principale.'
                          ' \n\n Qualité :'
                          '\n\n Notre établissement certifié ISO 9001:2015, est un témoignage et une reconnaissance de notre sérieux professionnel et de l’éfficacité de notre système de Management qualité.'
                          '\n\n Flexibilité et disponibilité :'
                          '\n\n Horaire, disponibilité, et flexibilité, sont des critères qui seront adaptés à vos besoins. le respect de la ponctualité est nécéssaire à la réussite du parcours de la formation.')),
              leading: const Icon(Icons.high_quality, color: primaryColor),
              title: MyCustomTextWidget(index: 6, text: 'Valeurs'),
            ),
            ListTile(
              onTap: () =>
                  Get.to(() =>
                  const CustomPage(
                      title: 'Objectif',
                      text:
                      'Notre objectif principal à travers notre mission, est de favoriser et promouvoir l’accès à la formation professionnelle pour TOUS, quelque soit la taille, et l’activité de votre entreprise, nous saurons vous apporter des solutions et des conseils pour la réussite de vos projets par nos experts reconnus dans leur domaine')),
              leading: const Icon(Icons.emoji_objects, color: primaryColor),
              title: MyCustomTextWidget(index: 6, text: 'Objectifs'),
            ),
            ListTile(
              onTap: () =>
                  Get.to(() =>
                  const CustomPage(
                      title: 'Partners',
                      text:
                      'Depuis sa création, LCI Formation & Conseils ne cesse de tisser et de développer des relations de formation, de coopération avec des partenaires internationaux afin d’assurer l’évolution de l’institut et la réalisation de ces projets.')),
              leading: const Icon(Icons.boy, color: primaryColor),
              title: MyCustomTextWidget(index: 6, text: 'Partners'),
            ),
            ListTile(
              onTap: () {
                Get.lazyPut(
                        () => LoginController()); // Initialize the controller
                Get.find<LoginController>().logout();
              },
              leading: const Icon(Icons.logout, color: primaryColor),
              title: MyCustomTextWidget(index: 6, text: 'Logout'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 25),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: Row(
                                      children: [
                                        GetBuilder<HomeController>(
                                          init: HomeController(),
                                          builder: (controller) =>
                                              Text(
                                                'Welcome, Guest',
                                                style: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  letterSpacing: 2,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Icon(
                                          Icons.waving_hand,
                                          color: buttonColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  MyCustomTextWidget(
                                    index: 10,
                                    text: 'Ready to Learn Today ?',
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    width: 70,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                      onPressed: () {
                                            Get.back();
                                      },
                                      child: MyCustomTextWidget(
                                        index: 15,
                                        text: 'Signup',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/images/signguest.png',
                                height: 170,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: homeController.scrollController,
                  // Assign the scroll controller here
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: MyContainer(
                          gestuorTap: () {
                            Get.to(() => const Service());
                          },
                          text: 'Services',
                          urlimage: 'assets/images/service.png',
                          borderRadius: 16.0,
                          borderColor: primaryColor,
                          borderWidth: 2.0,
                          index: 6,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: MyContainer(
                          gestuorTap: () {
                            Get.to(() => OnlineScreen());
                          },
                          text: 'Online',
                          urlimage: 'assets/images/online.png',
                          borderRadius: 16.0,
                          borderColor: buttonColor,
                          borderWidth: 2.0,
                          index: 6,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: MyContainer(
                          gestuorTap: () {
                            Get.to(() => Contact());
                          },
                          text: 'Contact Us',
                          urlimage: 'assets/images/contact.png',
                          borderRadius: 16.0,
                          borderColor: primaryColor,
                          borderWidth: 2.0,
                          index: 6,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyCustomTextWidget(index: 6, text: 'Our Courses',),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          courseController.showAllCourses.toggle();

                        },
                        child:  Obx(() => Text(
                          courseController.showAllCourses.value ? "See Less" : "See More",
                          style: const TextStyle(color: primaryColor),
                        )),
                      ),
                    ],
                  )),
                const SizedBox(height: 20,),
                GetBuilder<CourseController>(
                  init: CourseController(),
                  builder: (controller) =>
                      Obx(() => GridView.count(
                        crossAxisCount: 2,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          for (int i = 0; i < (controller.showAllCourses.value ? controller.courseList.length : 2)
                              && i < controller.courseList.length; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: primaryColor.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                // drt inkwell hna bah l grid kaml tapped
                                child:  InkWell(
                                    onTap: () async {
                                      controller.setGridTapped(true, i);
                                      await controller.fetchSubCourses(controller.courseList[i]);
                                      Get.to(SubCourses(index1: i));
                                    },
                                    child:Column(
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          'assets/images/${homeController
                                              .l[i]}.png',
                                          width: 120,
                                          height: 100,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 8, left: 5),
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceAround,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                controller.courseList[i],
                                                style: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                  color: primaryColor,
                                                  letterSpacing: 2,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Obx(() =>
                                            controller.isGridTapped.value &&
                                                controller
                                                    .currentGridTappedIndex
                                                    .value == i
                                                ? Container(
                                              width: 15,
                                              height: 15,
                                              child: const CircularProgressIndicator(
                                                color: buttonColor,
                                                strokeWidth: 2.0,
                                              ),
                                            )
                                                : const Icon(
                                                Icons.arrow_circle_right,
                                                color: buttonColor)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                        ],
                      )),
                ),
                const SizedBox(height: 40,),
              ])),
    );
  }
}