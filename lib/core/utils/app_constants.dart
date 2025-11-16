import '../../data/models/custom_service.dart';
import '../../data/models/project.dart';
import 'app_assets.dart';
import 'app_strings.dart';

abstract class AppConstants {
  static const double appBarHeight = 80;
  static const List<CustomService> services = [
    CustomService(
      titleKey: 'service_mobile_title',
      descriptionKey: 'service_mobile_desc',
      logo: AppAssets.flutterLogo,
    ),
    CustomService(
      titleKey: 'service_desktop_title',
      descriptionKey: 'service_desktop_desc',
      logo: AppAssets.flutterLogo,
    ),
    CustomService(
      titleKey: 'service_web_title',
      descriptionKey: 'service_web_desc',
      logo: AppAssets.flutterLogo,
    ),
  ];

  static const List<Project> projects = [
    Project(
      titleKey: 'project_trent_title',
      descriptionKey: 'project_trent_desc',
      gallery: [
        'assets/images/trentlogo.png',
        'assets/images/trent1.png',
        'assets/images/trent2.png',
        'assets/images/trent3.png',
      ],
      storeLinks: [
        ProjectLink(
          type: ProjectLinkType.googlePlay,
          url:
              'https://play.google.com/store/apps/details?id=com.texifytech.trentapp.sa&pcampaignid=web_share',
        ),
        ProjectLink(
          type: ProjectLinkType.appStore,
          url: 'https://apps.apple.com/eg/app/trent/id6747688830?l=ar',
        ),
        ProjectLink(type: ProjectLinkType.web, url: 'https://trent.sa/'),
      ],
      previewLink: 'https://trent.sa/',
      highlightKeys: [
        AppStrings.projectTagEcommerce,
        AppStrings.projectTagCrossPlatform,
        AppStrings.projectTagPublished,
      ],
    ),
    Project(
      titleKey: 'project_ticket_title',
      descriptionKey: 'project_ticket_desc',
      gallery: [
        'assets/images/ticketogo.png',
        'assets/images/ticket1.png',
        'assets/images/ticket2.png',
        'assets/images/ticket3.png',
      ],
      storeLinks: [
        ProjectLink(
            type: ProjectLinkType.web, url: 'https://ticketchamber.com/'),
      ],
      previewLink: 'https://ticketchamber.com/',
      highlightKeys: [
        AppStrings.projectTagTravel,
        AppStrings.projectTagCrossPlatform,
        AppStrings.projectTagWebPlatform,
      ],
    ),
    Project(
      titleKey: 'project_medshare_title',
      descriptionKey: 'project_medshare_desc',
      gallery: [
        'https://i.postimg.cc/N0C53TQz/icon.png',
        'assets/images/med1.png',
        'assets/images/med2.png',
        'assets/images/med3.png',
      ],
      storeLinks: [
        ProjectLink(type: ProjectLinkType.web, url: 'https://medshare.app'),
      ],
      githubRepoLink: 'https://github.com/eng-flutter-mohamed/med-share-rx',
      previewLink:
          'https://www.figma.com/design/tA0XqylRpOygqWFmzh7nBR/Untitled?node-id=469-2021&p=f&t=ypkMiheefbLZPc7s-0',
      highlightKeys: [
        AppStrings.projectTagHealthcare,
        AppStrings.projectTagSaas,
      ],
    ),
    Project(
      titleKey: 'project_avon_title',
      descriptionKey: 'project_avon_desc',
      gallery: [
        'assets/images/Avondeliverylogo.png',
        'assets/images/Avon1.png',
        'assets/images/Avon2.png',
        'assets/images/Avon3.png',
      ],
      storeLinks: [
        ProjectLink(
          type: ProjectLinkType.appStore,
          url:
              'https://apps.apple.com/us/app/avon-delivery-%D9%84%D9%84%D9%85%D9%86%D8%AF%D9%88%D8%A8%D9%8A%D9%86/id6754839198',
        ),
        ProjectLink(
          type: ProjectLinkType.web,
          url: 'https://avon-cake.com/',
        ),
      ],
      previewLink: 'https://avon-cake.com/',
      highlightKeys: [
        AppStrings.projectTagDelivery,
        AppStrings.projectTagCrossPlatform,
      ],
    ),
    Project(
      titleKey: 'project_goaara_title',
      descriptionKey: 'project_goaara_desc',
      gallery: [
        'https://i.postimg.cc/j2Z9csHP/logo.png',
        'assets/images/goaraa.png',
        'assets/images/goaraa1.png',
        'assets/images/goaraa2.png',
      ],
      storeLinks: [
        ProjectLink(type: ProjectLinkType.web, url: 'https://goaara.web.app'),
      ],
      githubRepoLink: 'https://github.com/eng-flutter-mohamed/goaraa_app',
      previewLink: 'https://youtube.com/shorts/DX7cvCXZA5c?si=mV18qGFeDbRF4moA',
      highlightKeys: [
        AppStrings.projectTagHealthcare,
        AppStrings.projectTagMobile,
      ],
    ),
    Project(
      titleKey: 'project_tog_title',
      descriptionKey: 'project_tog_desc',
      gallery: [
        'https://i.postimg.cc/x8Bg7qfv/logo.png',
        'assets/images/Tog1.png',
        'assets/images/Tog2.png',
        'assets/images/Tog3.png',
      ],
      storeLinks: [
        ProjectLink(
          type: ProjectLinkType.googlePlay,
          url:
              'https://play.google.com/store/apps/details?id=com.manaratalasr.apps.tog',
        ),
        ProjectLink(
          type: ProjectLinkType.web,
          url: 'https://tog.sa',
        ),
      ],
      githubRepoLink: 'https://github.com/eng-flutter-mohamed/tog',
      previewLink:
          'https://play.google.com/store/apps/details?id=com.manaratalasr.apps.tog',
      highlightKeys: [
        AppStrings.projectTagFintech,
        AppStrings.projectTagMobile,
      ],
    ),
    Project(
      titleKey: 'project_fuve_title',
      descriptionKey: 'project_fuve_desc',
      gallery: [
        'https://i.postimg.cc/x1mjBZRM/image.png',
        'assets/images/ecommerce1.png',
        'assets/images/ecommerce2.png',
        'assets/images/ecommerce3.png',
      ],
      storeLinks: [
        ProjectLink(type: ProjectLinkType.web, url: 'https://fuve.store'),
      ],
      githubRepoLink: 'https://github.com/eng-flutter-mohamed/Fuve',
      previewLink:
          'https://www.figma.com/design/bYYmtezTg0jPp0WqINEvPQ/Accessories?node-id=220-3796&t=fRik3LqLTo7G215i-0',
      highlightKeys: [
        AppStrings.projectTagEcommerce,
        AppStrings.projectTagWebPlatform,
      ],
    ),
    Project(
      titleKey: 'project_gpa_title',
      descriptionKey: 'project_gpa_desc',
      gallery: [
        'https://i.postimg.cc/NGWjbY8B/logoApp.png',
        'assets/images/gpa1.png',
        'assets/images/gpa2.png',
        'assets/images/gpa3.png',
      ],
      storeLinks: [
        ProjectLink(
          type: ProjectLinkType.googlePlay,
          url:
              'https://play.google.com/store/apps/details?id=com.gpa.calculator',
        ),
      ],
      githubRepoLink: 'https://github.com/eng-flutter-mohamed/Gpa-App',
      previewLink: 'https://youtube.com/shorts/Rd2aXRycaIk',
      highlightKeys: [
        AppStrings.projectTagLearning,
        AppStrings.projectTagMobile,
      ],
    ),
    Project(
      titleKey: 'project_sigmaty_title',
      descriptionKey: 'project_sigmaty_desc',
      gallery: [
        'https://i.postimg.cc/pdYsc257/sigmaty-logo.png',
        'assets/images/sigmaty1.png',
        'assets/images/sigmaty2.png',
        'assets/images/sigmaty3.png',
      ],
      storeLinks: [
        ProjectLink(type: ProjectLinkType.web, url: 'https://sigmaty.com'),
      ],
      githubRepoLink: 'https://github.com/eng-flutter-mohamed/sigmaty',
      previewLink:
          'https://www.figma.com/design/p1e35vf8jSyiDa5lq7ROnP/Sigmaty?node-id=0-1&p=f&t=8utQela73IVlBcKS-0',
      highlightKeys: [
        AppStrings.projectTagLearning,
        AppStrings.projectTagSaas,
      ],
    ),
    Project(
      titleKey: 'project_pizza_title',
      descriptionKey: 'project_pizza_desc',
      gallery: [
        'https://i.postimg.cc/59vSs9cm/pizza.png',
        'assets/images/PizzaApp1.png',
        'assets/images/PizzaApp2.png',
        'assets/images/PizzaApp3.png',
      ],
      storeLinks: [
        ProjectLink(
          type: ProjectLinkType.googlePlay,
          url:
              'https://play.google.com/store/apps/details?id=com.radyhaggag.zawilan',
        ),
      ],
      githubRepoLink:
          'https://play.google.com/store/apps/details?id=com.radyhaggag.zawilan',
      previewLink:
          'https://drive.google.com/file/d/1q0byVRvYEjj9cln5L_VM1dCT9vhUpfcn/view?usp=sharing',
      highlightKeys: [
        AppStrings.projectTagDelivery,
        AppStrings.projectTagMobile,
      ],
    ),
    Project(
      titleKey: 'project_rick_title',
      descriptionKey: 'project_rick_desc',
      gallery: [
        'https://i.postimg.cc/1zpGRJ9N/1.png',
        'assets/images/rick1.png',
        'assets/images/rick2.png',
        'assets/images/rick3.png',
      ],
      githubRepoLink:
          'https://github.com/eng-flutter-mohamed/rick-and-mortty-app',
      previewLink: 'https://youtu.be/_ctOIWNv-Uw?si=7mi9x6m-z6JSw43R',
      highlightKeys: [
        AppStrings.projectTagEntertainment,
        AppStrings.projectTagFlutter,
      ],
    ),
  ];
}
