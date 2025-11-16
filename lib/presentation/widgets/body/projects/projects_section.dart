import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import 'projects_grid.dart';
import 'projects_intro.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.cardColor.withOpacity(.9),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: AppColors.borderColor.withOpacity(.6)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.35),
              blurRadius: 25,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProjectsIntro(),
            SizedBox(height: 40),
            ProjectsGrid(),
          ],
        ),
      ),
    );
  }
}
