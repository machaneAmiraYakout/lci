import 'package:elearning/presenter/controller/login_controller.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elearning/view/widgets/my_custom_page.dart';

import '../widgets/my_custom_container.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: buttonColor, // Set the color of the drawer icon
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children:  <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                height: 70,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0),
                  color: buttonColor.withOpacity(0.4),
                ),
                child: Image.asset('assets/images/graduated.png'),
              ),
            ),
            ListTile(

              leading: const Icon(Icons.account_circle,color: thirdColor),
              title: MyCustomTextWidget(index:6 ,text: 'Profile'),
            ),
            ListTile(
              onTap:()=>Get.to(() =>const CustomPage(title: 'Presentation', text: 'LCI Formation & Conseils est un institut privé créé en 2014, certifié ISO 9001 : 2015 par AFAQ AFNOR International sous le N° 94219, spécialisé en formation inter et intra entreprises dans les différents domaines et en conseils d’entreprises. Il assure aussi les services en tant que centre d’examen International pour : TFI, TOEIC, TOEFL Junior, CERT et Bright.'
                  ' \n\n LCI « Land of Creativity & Instruction » est géré par un staff jeune, qualifié, doté d’un esprit d’équipe développé, source de son dynamisme et sa régularité.'
                  '\n\n  L’institut bénéficie aussi d’un agrément délivré par le ministère du tourisme sous le nom : ZINE EL ABIDINE Travel Agency N°2329, qui assure l’organisation des évènements à l’échelle internationale.')) ,
              leading: const Icon(Icons.info,color: thirdColor),
              title: MyCustomTextWidget(index:6 ,text: 'Presentation'),
            ),
            ListTile(
              onTap:()=>Get.to(() =>const CustomPage(title: 'Edito', text: 'Nous ne pouvons nier l’importance du savoir, toujours considéré comme un pilier incontournable de l’émancipation des sociétés et des personnes.'
                  ' \n\n Envisager la formation professionnelle sur le seul aspect de la transmission d’un savoir-faire peut sembler insuffisant pour cela, nous devons la placer dans une vision globale de la société prenant en compte, non seulement le geste technique mais aussi l’individu et les enjeux de la transition écologique qui sera demain au cœur des préoccupations de nos sociétés.'
                  '\n\n Nous n’avons pas pour seule ambition, de répondre aux politiques adéquationnistes – emplois et formations – mais nous souhaitons former des citoyens qui auront à apprendre et se former tout au long de la vie afin de s’adapter aux défis futurs auxquels ils serons confrontés .'
                  '\n\n Dr.Zine El Abidine HAMDI CHERIF'
                  '\n\n Directeur Général')) ,

              leading: const Icon(Icons.mode_edit_outline_rounded,color: thirdColor),
              title: MyCustomTextWidget(index:6 ,text: 'Edito'),
            ),
            ListTile(
              onTap:()=>Get.to(() =>const CustomPage(title: 'Valeur', text: 'Professionnalisme :'
                  '\n\n  Notre équipe est toujours mobilisée, s’impliquera pleinement afin de répondre au mieux à vos attentes. Notre professionnalisme est basé sur la confiance de notre clientèle; la capacité à tenir nos engagements est notre priorité principale.'
                  ' \n\n Qualité :'
                  '\n\n Notre établissement certifié ISO 9001:2015, est un témoignage et une reconnaissance de notre sérieux professionnel et de l’éfficacité de notre système de Management qualité.'
                  '\n\n Flexibilité et disponibilité :'
                  '\n\n Horaire, disponibilité, et flexibilité, sont des critères qui seront adaptés à vos besoins. le respect de la ponctualité est nécéssaire à la réussite du parcours de la formation.'
              )) ,
              leading: const Icon(Icons.high_quality,color: thirdColor),
              title: MyCustomTextWidget(index:6 ,text: 'Valeurs'),
            ),
            ListTile(
              onTap:()=>Get.to(() =>const CustomPage(title: 'Objectif', text: 'Notre objectif principal à travers notre mission, est de favoriser et promouvoir l’accès à la formation professionnelle pour TOUS, quelque soit la taille, et l’activité de votre entreprise, nous saurons vous apporter des solutions et des conseils pour la réussite de vos projets par nos experts reconnus dans leur domaine'
              )) ,
              leading: const Icon(Icons.emoji_objects,color: thirdColor),
              title: MyCustomTextWidget(index:6 ,text: 'Objectifs'),
            ),
            ListTile(
              onTap:()=>Get.to(() =>const CustomPage(title: 'Partners', text: 'Depuis sa création, LCI Formation & Conseils ne cesse de tisser et de développer des relations de formation, de coopération avec des partenaires internationaux afin d’assurer l’évolution de l’institut et la réalisation de ces projets.'
              )) ,
              leading: const Icon(Icons.boy,color: thirdColor),
              title: MyCustomTextWidget(index:6 ,text: 'Partners'),
            ),
            ListTile(
              leading: const Icon(Icons.settings,color: thirdColor),
              title: MyCustomTextWidget(index:6 ,text: 'Settings'),
            ),
            ListTile(
              onTap: (){
                Get.lazyPut(() => LoginController()); // Initialize the controller
                Get.find<LoginController>().logout();
              },
              leading: const Icon(Icons.logout,color: thirdColor),
              title: MyCustomTextWidget(index:6 ,text: 'Logout'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(

          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height:50 ,),
              MyContainer(
                text: 'Services',
                urlimage: 'assets/images/service.png',
                borderRadius: 16.0,
                borderColor: primaryColor,
                borderWidth: 2.0,
                index: 6,
              ),
              SizedBox(height: 40,),
              MyContainer(
                text: 'Online',
                urlimage: 'assets/images/online.png',
                borderRadius: 16.0,
                borderColor: buttonColor,
                borderWidth: 2.0,
                index: 6,
              ),


            ],
          ),
        ),
      ),


    );
  }
}