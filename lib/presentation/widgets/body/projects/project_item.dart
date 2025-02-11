import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../data/models/project.dart';
import 'project_actions.dart';
import 'project_image.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key, required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: AssetImage(
            'assets/images/background.png', // تأكد من وضع مسار الصورة الصحيح
          ))),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProjectImage(imageUrl: project.imageUrl),
                const SizedBox(height: 16),
                FittedBox(
                  child: Text(
                    project.name,
                    style:
                        AppStyles.s24.copyWith(color: AppColors.primaryColor),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: AutoSizeText(
                    project.description,
                    style: AppStyles.s18,
                    minFontSize: 12,
                    maxLines: 8,
                  ),
                ),
                const SizedBox(height: 8),
                ProjectActions(project: project)
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Image.asset(project.image3
                            // "assets/images/med1.png",
                            )),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(child: Image.asset(project.image2)),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Image.asset(project.image1),
              ],
            ),
          )
        ],
      ),
    );
  }
}
