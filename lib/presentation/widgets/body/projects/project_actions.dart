import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:portfolio/data/models/project.dart';
import 'package:universal_html/html.dart' as html;

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_button.dart';

class ProjectActions extends StatelessWidget {
  const ProjectActions({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final List<Widget> actionButtons = [];
    if (project.previewLink != null) {
      actionButtons.add(
        CustomButton(
          label: AppStrings.projectPreview.tr,
          backgroundColor: AppColors.primaryColor,
          onPressed: () => html.window.open(project.previewLink!, '_blank'),
        ),
      );
    }
    if (project.githubRepoLink != null) {
      actionButtons.add(
        CustomButton(
          label: AppStrings.projectGithub.tr,
          borderColor: AppColors.primaryColor,
          onPressed: () => html.window.open(project.githubRepoLink!, '_blank'),
        ),
      );
    }

    final storeBadges = project.storeLinks
        .map((link) => _StoreBadge(link: link))
        .toList(growable: false);

    final bool hasAnyAction =
        actionButtons.isNotEmpty || storeBadges.isNotEmpty;

    if (!hasAnyAction) {
      return CustomButton(
        label: AppStrings.projectUnavailable.tr,
        borderColor: AppColors.primaryColor,
        onPressed: () {},
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (storeBadges.isNotEmpty)
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: storeBadges,
          ),
        if (actionButtons.isNotEmpty) ...[
          if (storeBadges.isNotEmpty) const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: actionButtons,
          ),
        ],
      ],
    );
  }
}

class _StoreBadge extends StatelessWidget {
  const _StoreBadge({required this.link});

  final ProjectLink link;

  @override
  Widget build(BuildContext context) {
    String label;
    IconData icon;
    switch (link.type) {
      case ProjectLinkType.googlePlay:
        label = AppStrings.projectPlayStore.tr;
        icon = Icons.android;
        break;
      case ProjectLinkType.appStore:
        label = AppStrings.projectAppStore.tr;
        icon = Icons.apple;
        break;
      case ProjectLinkType.web:
        label = AppStrings.projectVisitSite.tr;
        icon = Icons.language;
        break;
    }
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () => html.window.open(link.url, '_blank'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.primaryLight.withOpacity(.5),
          border: Border.all(color: AppColors.primaryColor.withOpacity(.5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: AppColors.white),
            const SizedBox(width: 6),
            Text(label, style: AppStyles.s14),
          ],
        ),
      ),
    );
  }
}
