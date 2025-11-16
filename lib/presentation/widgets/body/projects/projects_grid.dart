import 'package:flutter/material.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/responsive.dart';
import 'project_item.dart';

class ProjectsGrid extends StatelessWidget {
  const ProjectsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final columns = Responsive.projectColumns(width);
        final spacing = Responsive.projectGap(columns);
        final itemWidth = Responsive.projectItemWidth(width, gap: spacing);
        return Wrap(
          spacing: spacing,
          runSpacing: 24,
          children: AppConstants.projects
              .map(
                (project) => SizedBox(
                  width: itemWidth,
                  child: ProjectItem(project: project),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
