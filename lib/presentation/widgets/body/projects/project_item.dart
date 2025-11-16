import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../data/models/project.dart';
import 'project_actions.dart';

class ProjectItem extends StatefulWidget {
  const ProjectItem({super.key, required this.project});
  final Project project;

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  bool _hovered = false;
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isDesktop = constraints.maxWidth > 720;
        return MouseRegion(
          onEnter: (_) => _setHover(true),
          onExit: (_) => _setHover(false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: EdgeInsets.all(isDesktop ? 36 : 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: AppColors.cardColor.withOpacity(.95),
              border: Border.all(
                color: _hovered
                    ? AppColors.primaryColor
                    : AppColors.borderColor.withOpacity(.5),
              ),
              boxShadow: _hovered
                  ? [
                      BoxShadow(
                        color: AppColors.primaryColor.withOpacity(.18),
                        blurRadius: 30,
                        offset: const Offset(0, 18),
                      ),
                    ]
                  : null,
            ),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 55,
                        child: _ProjectGallery(
                          project: widget.project,
                          controller: _pageController,
                          currentIndex: _currentIndex,
                          onPageChanged: _onGalleryChanged,
                          isDesktop: true,
                        ),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        flex: 45,
                        child: _ProjectDetails(project: widget.project),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ProjectGallery(
                        project: widget.project,
                        controller: _pageController,
                        currentIndex: _currentIndex,
                        onPageChanged: _onGalleryChanged,
                        isDesktop: false,
                      ),
                      const SizedBox(height: 20),
                      _ProjectDetails(project: widget.project),
                    ],
                  ),
          ),
        );
      },
    );
  }

  void _setHover(bool hovered) {
    if (_hovered == hovered) return;
    setState(() => _hovered = hovered);
  }

  void _onGalleryChanged(int index) {
    if (_currentIndex == index) return;
    setState(() => _currentIndex = index);
  }
}

class _ProjectDetails extends StatelessWidget {
  const _ProjectDetails({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.titleKey.tr,
          style: AppStyles.s24.copyWith(color: AppColors.primaryColor),
        ),
        const SizedBox(height: 12),
        AutoSizeText(
          project.descriptionKey.tr,
          style: AppStyles.s18,
          minFontSize: 12,
          maxLines: 6,
        ),
        if (project.highlightKeys.isNotEmpty) ...[
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.highlightKeys
                .map(
                  (key) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primaryLight.withOpacity(.4),
                      border: Border.all(
                        color: AppColors.borderColor.withOpacity(.4),
                      ),
                    ),
                    child: Text(
                      key.tr,
                      style: AppStyles.s14,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
        const SizedBox(height: 20),
        ProjectActions(project: project),
      ],
    );
  }
}

class _ProjectGallery extends StatelessWidget {
  const _ProjectGallery({
    required this.project,
    required this.controller,
    required this.currentIndex,
    required this.onPageChanged,
    required this.isDesktop,
  });

  final Project project;
  final PageController controller;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;
  final bool isDesktop;

  List<String> get mediaSources => project.gallery;

  @override
  Widget build(BuildContext context) {
    final ratio = isDesktop ? 4 / 3 : 16 / 9;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: AspectRatio(
            aspectRatio: ratio,
            child: PageView.builder(
              controller: controller,
              itemCount: mediaSources.length,
              onPageChanged: onPageChanged,
              itemBuilder: (context, index) {
                final source = mediaSources[index];
                return _ProjectMedia(source: source);
              },
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (mediaSources.length > 1)
          SizedBox(
            height: isDesktop ? 72 : 56,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: mediaSources.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final source = mediaSources[index];
                final bool isActive = index == currentIndex;
                return GestureDetector(
                  onTap: () => controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOut,
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: isDesktop ? 120 : 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isActive
                            ? AppColors.primaryColor
                            : AppColors.borderColor.withOpacity(.4),
                        width: isActive ? 2 : 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: _ProjectMedia(source: source),
                    ),
                  ),
                );
              },
            ),
          )
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 18,
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class _ProjectMedia extends StatelessWidget {
  const _ProjectMedia({required this.source});
  final String source;

  bool get _isNetwork => source.startsWith('http');

  @override
  Widget build(BuildContext context) {
    if (_isNetwork) {
      return CachedNetworkImage(
        imageUrl: source,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: AppColors.primaryLight,
        ),
        errorWidget: (context, url, error) => Container(
          color: AppColors.primaryLight,
          alignment: Alignment.center,
          child: Icon(
            Icons.error_outline,
            color: AppColors.warning,
          ),
        ),
      );
    }
    return Image.asset(
      source,
      fit: BoxFit.cover,
    );
  }
}
