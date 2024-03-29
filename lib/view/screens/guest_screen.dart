import 'package:elearning/presenter/controller/course_controller.dart';
import 'package:elearning/view/screens/contact.dart';
import 'package:elearning/view/screens/online_screen.dart';
import 'package:elearning/view/screens/service_screen.dart';
import 'package:elearning/view/screens/signup_screen.dart';
import 'package:elearning/view/screens/subcourses_screen.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elearning/view/widgets/my_custom_page.dart';
import '../../presenter/controller/home_controller.dart';
import '../../presenter/controller/settings_controller.dart';
import '../widgets/my_custom_container.dart';
class GuestScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final CourseController courseController = Get.put(CourseController());
  final SettingsController settingscontroller = Get.put(SettingsController());
  GuestScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        shadowColor:  settingscontroller.isDarkMode.value
            ? Colors.black26// Use dark mode color
            : primaryColor,
        iconTheme: const IconThemeData(
          color: buttonColor, // Set the color of the drawer icon
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/lgb.png',
              height: 40,
              width: 40,
            ),
            const SizedBox(
              width: 10,
            ),
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
                    color:  settingscontroller.isDarkMode.value
                        ? Colors.black26// Use dark mode color
                        : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/lgb.png',
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
              onTap: () => Get.to(() =>  CustomPage(
                  title: 'Presentation',
                  text:
                      'LCI Formation & Conseils est un institut privé créé en 2014, certifié ISO 9001 : 2015 par AFAQ AFNOR International sous le N° 94219, spécialisé en formation inter et intra entreprises dans les différents domaines et en conseils d’entreprises. Il assure aussi les services en tant que centre d’examen International pour : TFI, TOEIC, TOEFL Junior, CERT et Bright.'
                      ' \n\n LCI « Land of Creativity & Instruction » est géré par un staff jeune, qualifié, doté d’un esprit d’équipe développé, source de son dynamisme et sa régularité.'
                      '\n\n  L’institut bénéficie aussi d’un agrément délivré par le ministère du tourisme sous le nom : ZINE EL ABIDINE Travel Agency N°2329, qui assure l’organisation des évènements à l’échelle internationale.')),
              leading: const Icon(Icons.info, color: primaryColor),
              title: MyCustomTextWidget(index: 6, text: 'Presentation'),
            ),
            ListTile(
              onTap: () => Get.to(() =>  CustomPage(
                  imagePath: 'assets/images/boss.png',
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
              onTap: () => Get.to(() =>  CustomPage(
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
              onTap: () => Get.to(() =>  CustomPage(
                  title: 'Objectif',
                  text:
                      'Notre objectif principal à travers notre mission, est de favoriser et promouvoir l’accès à la formation professionnelle pour TOUS, quelque soit la taille, et l’activité de votre entreprise, nous saurons vous apporter des solutions et des conseils pour la réussite de vos projets par nos experts reconnus dans leur domaine')),
              leading: const Icon(Icons.emoji_objects, color: primaryColor),
              title: MyCustomTextWidget(index: 6, text: 'Objectifs'),
            ),
            ListTile(
              onTap: () => Get.to(() =>  CustomPage(
                  imagePath: 'assets/images/partners.png',
                  title: 'Partners',
                  text:
                      'Depuis sa création, LCI Formation & Conseils ne cesse de tisser et de développer des relations de formation, de coopération avec des partenaires internationaux afin d’assurer l’évolution de l’institut et la réalisation de ces projets.')),
              leading: const Icon(Icons.boy, color: primaryColor),
              title: MyCustomTextWidget(index: 6, text: 'Partners'),
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 2, // Number of tabs
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                    child: Stack(
                      children: [
                        Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                        color: settingscontroller.isDarkMode.value
                            ? Colors.black54// Use dark mode color
                            : primaryColor, // Use light mode color
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                        Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      children: const [
                                        Expanded(
                                          child: Tooltip(
                                            message: 'Welcome, Guest',
                                            child: Text(
                                              'Welcome,Guest',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                                letterSpacing: 2,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.waving_hand,
                                          color: buttonColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),  // Add spacing between the text and the image
                                  MyCustomTextWidget(
                                    index: 10,
                                    text: 'Ready to Learn Today ?',
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.to(SignupScreen());
                                    },
                                    child: MyCustomTextWidget(
                                      index: 15,
                                      text: 'SignUp',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.30,
                              height: screenWidth * 0.40,
                              child: Image.asset(
                                'assets/images/signguest.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                    width: MediaQuery.of(context).size.width,
                    child: MyContainer(
                      gestuorTap: () {
                        Get.to(() => const Service());
                      },
                      text: 'Services',
                      // urlimage: 'assets/images/service.png',
                      borderRadius: 16.0,
                      borderColor: primaryColor,
                      borderWidth: 2.0,
                      index: 6,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: MyContainer(
                      gestuorTap: () {
                        Get.to(() =>  OnlineScreen());
                      },
                      text: 'Online',
                      // urlimage: 'assets/images/online.png',
                      borderRadius: 16.0,
                      borderColor: buttonColor,
                      borderWidth: 2.0,
                      index: 6,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: MyContainer(
                      gestuorTap: () {
                        Get.to(() => Contact());
                      },
                      text: 'Contact Us',
                      // urlimage: 'assets/images/contact.png',
                      borderRadius: 16.0,
                      borderColor: primaryColor,
                      borderWidth: 2.0,
                      index: 6,
                    ),
                  ),
                ],
              ),
            ),
                 const SizedBox(
              height: 40,
            ),
                 Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TabBar(
                indicatorColor: primaryColor, //
                labelColor: primaryColor,
                unselectedLabelColor:
                    buttonColorWith, // Customize indicator color
                tabs: const [
                  Tab(text: 'Our Courses'),
                  Tab(text: 'New Courses'),
                ],
              ),
            ),
                 const SizedBox(
              height: 20,
            ),
                 SizedBox(
              height: MediaQuery.of(context).size.height - 260,
              child: TabBarView(children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyCustomTextWidget(
                                index: 6,
                                text: 'Our Courses',
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  courseController.showAllCourses.toggle();
                                },
                                child: Obx(() => Text(
                                      courseController.showAllCourses.value
                                          ? "See Less"
                                          : "See More",
                                      style: TextStyle(
                                            color:settingscontroller.isDarkMode.value
                                                ? Colors.white// Use dark mode color
                                                : primaryColor,
                                          ),
                                    )),
                              ),
                            ],
                          )),
                      GetBuilder<CourseController>(
                        init: CourseController(),
                        builder: (controller) => Obx(
                              () {
                            final itemCount = controller.showAllCourses.value ? controller.courseList.length : 2;
                            return Padding(
                              padding: EdgeInsets.all(8),
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: itemCount,
                                itemBuilder: (BuildContext context, int index) {
                                  if (index >= controller.courseList.length) {
                                    return Container(); // Return an empty container for indices beyond the valid range
                                  }

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: settingscontroller.isDarkMode.value
                                            ? Colors.black54 // Use dark mode color
                                            : Colors.white, // Use light mode color
                                        boxShadow: [
                                          BoxShadow(
                                            color: settingscontroller.isDarkMode.value
                                                ? Colors.black26 // Use dark mode color
                                                : primaryColor.withOpacity(0.5), // Use light mode color
                                            spreadRadius: 1,
                                            blurRadius: 8,
                                          ),
                                        ],
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          controller.setGridTapped(true, index);
                                          await controller.fetchSubCourses(controller.courseList[index]);
                                          Get.to(SubCourses(index1: index));
                                        },
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        controller.courseList[index],
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 13,
                                                          fontWeight: FontWeight.w500,
                                                          color: settingscontroller.isDarkMode.value
                                                              ? Colors.white // Use dark mode color
                                                              : primaryColor, // Use light mode color
                                                          letterSpacing: 2,
                                                        ),
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                    Obx(
                                                          () => controller.isGridTapped.value &&
                                                          controller.currentGridTappedIndex.value == index
                                                          ? const SizedBox(
                                                        width: 15,
                                                        height: 15,
                                                        child: CircularProgressIndicator(
                                                          color: buttonColor,
                                                          strokeWidth: 2.0,
                                                        ),
                                                      )
                                                          : const Icon(
                                                        Icons.arrow_circle_right,
                                                        color: buttonColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: settingscontroller.isDarkMode.value
                      ? Colors.black54 // Use dark mode color
                      : Colors.white, // Use light mode color// Customize tab content background color
                  child: const Center(
                    child: Text(
                      'New Courses',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
