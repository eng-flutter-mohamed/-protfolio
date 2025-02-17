import 'package:flutter/material.dart';

import 'projects_grid.dart';
import 'projects_intro.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(bottom: 80),
      child: Stack(children: [    Positioned.fill(
            child: Image.asset(
              'assets/images/background.png', // تأكد من وضع مسار الصورة الصحيح
              fit: BoxFit.cover,
            ),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProjectsIntro(),
            SizedBox(height: 52),
            ProjectsGrid(),
          ],
        ),
      ]),
    );
  }
}
