import '../../data/models/custom_service.dart';
import '../../data/models/project.dart';
import 'app_assets.dart';

abstract class AppConstants {
  static const double appBarHeight = 80;
  static const List<CustomService> services = [
    CustomService(
      service: 'MOBILE DEVELOPMENT',
      logo: AppAssets
          .flutterLogo, 
      description:
          'I develop high-performance mobile applications using Flutter, delivering seamless experiences on both Android and iOS platforms.',
    ),
    CustomService(
      service: 'DESKTOP DEVELOPMENT',
      logo: AppAssets
          .flutterLogo, 
      description:
          'I create cross-platform desktop applications with Flutter, ensuring consistency and excellent performance across Windows, macOS, and Linux.',
    ),
    CustomService(
      service: 'WEB DEVELOPMENT',
      logo: AppAssets
          .flutterLogo, // يمكنك استخدام شعار Flutter Web أو شعار مخصص للويب
      description:
          'I build responsive and dynamic web applications using Flutter Web, leveraging a single codebase for multiple platforms.',
    ),
  ];
  static const List<Project> projects = [
    Project(
      name: 'Goaara',
      imageUrl: 'https://i.postimg.cc/j2Z9csHP/logo.png',
      description:
          'A mobile app offering comprehensive home medical services that lets users book appointments, track their medical records, and make secure payments. It leverages Firebase for robust authentication and GetX for smooth state management.',
      githubRepoLink: 'https://github.com/eng-flutter-mohamed/goaraa_app',
      previewLink: 'https://youtube.com/shorts/DX7cvCXZA5c?si=mV18qGFeDbRF4moA',
    ),
    Project(
      name: 'med share rx',
      imageUrl: 'https://i.postimg.cc/N0C53TQz/icon.png',
      description:
          'A cutting-edge mobile application designed to facilitate the seamless exchange of prescriptions between pharmacies. It streamlines communication and data sharing to enhance efficiency and patient care while upholding high standards of security and privacy.',
      githubRepoLink: 'https://github.com/eng-flutter-mohamed/med-share-rx',
      previewLink:
          'https://www.figma.com/design/tA0XqylRpOygqWFmzh7nBR/Untitled?node-id=469-2021&p=f&t=ypkMiheefbLZPc7s-0',
    ),
    Project(
      name: 'Tog',
      imageUrl: 'https://i.postimg.cc/x8Bg7qfv/logo.png',
      description:
          'Tog is a simple, modern point-of-sale application powered by the Tawq electronic invoicing platform. It meets government requirements and lets you easily manage sales, inventory, and finances from any smart device.',
      githubRepoLink: 'https://github.com/eng-flutter-mohamed/tog',
      previewLink:
          'https://play.google.com/store/apps/details?id=com.manaratalasr.apps.tog',
    ),
    Project(
      name: 'Fuve',
      imageUrl: 'https://i.postimg.cc/x1mjBZRM/image.png',
      description:
          'An intuitive shopping app offering unique, stylish accessories for men and women. Inspired by nature and art, it delivers a fast, seamless shopping experience with quality products, reliable shipping, and excellent customer service',
      githubRepoLink: 'https://github.com/eng-flutter-mohamed/Fuve',
      previewLink:
          'https://www.figma.com/design/bYYmtezTg0jPp0WqINEvPQ/Accessories?node-id=220-3796&t=fRik3LqLTo7G215i-0',
    ),
    Project(
      name: 'Gpa app',
      imageUrl: 'https://i.postimg.cc/NGWjbY8B/logoApp.png',
      description:
          'A bilingual (Arabic/English) GPA calculator designed for ease of use. It computes the GPA based on user input while maintaining a simple design that doesn’t store any data',
      githubRepoLink: 'https://github.com/eng-flutter-mohamed/Gpa-App',
      previewLink: 'https://youtube.com/shorts/Rd2aXRycaIk',
    ),
      Project(
      githubRepoLink: 'https://github.com/eng-flutter-mohamed/sigmaty',
      name: 'sigmaty',
      imageUrl: 'https://i.postimg.cc/pdYsc257/sigmaty-logo.png',
      description:
          'An educational management system designed for teachers, students, and parents. The app facilitates lesson scheduling, tracks student progress, and includes a parent dashboard for monitoring. It utilizes Firebase for authentication, Supabase for data management, and GetX for real-time updates.',
      previewLink:
          'https://www.figma.com/design/p1e35vf8jSyiDa5lq7ROnP/Sigmaty?node-id=0-1&p=f&t=8utQela73IVlBcKS-0',
    ),
    Project(
      name: 'pizaaApp',
      imageUrl: 'https://i.postimg.cc/59vSs9cm/pizza.png',
      description:
          'PizzaApp is a restaurant application designed to offer a seamless food ordering experience. Users can browse the menu, customize their orders, and place requests effortlessly. The app features a smooth UI with Flutter and uses efficient state management for a responsive and dynamic experience',
      previewLink:
          'https://drive.google.com/file/d/1q0byVRvYEjj9cln5L_VM1dCT9vhUpfcn/view?usp=sharing',
      githubRepoLink:
          'https://play.google.com/store/apps/details?id=com.radyhaggag.zawilan',
    ),
    Project(
        name: 'rick and mortty app',
        imageUrl: 'https://i.postimg.cc/1zpGRJ9N/1.png',
        description:
            'This app allows users to explore characters from the Rick and Morty series. Users can search for characters, view detailed information about each one, and navigate through their profiles. The app fetches data from an API and is built using Flutter with BLoC for state management, ensuring smooth performance and a structured architecture. ',
        previewLink: 'https://youtu.be/_ctOIWNv-Uw?si=7mi9x6m-z6JSw43R',
        githubRepoLink:
            'https://github.com/eng-flutter-mohamed/rick-and-mortty-app'),
  ];
}
