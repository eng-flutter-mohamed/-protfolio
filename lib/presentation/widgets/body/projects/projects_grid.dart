import 'package:flutter/material.dart';
import '../../../../core/utils/app_constants.dart';

import 'project_item.dart';

class ProjectsGrid extends StatelessWidget {
  const ProjectsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // تم التعديل هنا إلى 1 لعرض عنصر واحد في كل صف
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5, // يمكن تعديل هذه النسبة لجعل العنصر أكبر
      ),
      itemBuilder: (context, index) {
        return ProjectItem(
          project: AppConstants.projects[index],
        );
      },
      itemCount: AppConstants.projects.length,
    );
  }
}