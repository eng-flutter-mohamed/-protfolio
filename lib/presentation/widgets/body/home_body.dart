import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/responsive.dart';
import '../../controllers/portfolio_controller.dart';
import '../app_bar/top_nav_bar.dart';
import '../app_bar/vertical_headers_builder.dart';
import '../common/animated_section.dart';
import 'about_me/about_me_section.dart';
import 'contact/contact_section.dart';
import 'intro/intro_section.dart';
import 'projects/projects_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final ScrollController _controller = ScrollController();
  final introKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();
  late final PortfolioController _portfolioController;
  Worker? _navigationWorker;

  @override
  void initState() {
    super.initState();
    _portfolioController = PortfolioController.to;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _initListenerForInteractWithHeaderIndex();
    });
    _navigationWorker = ever<int?>(
      _portfolioController.navigationRequest,
      (index) {
        if (index == null) return;
        _scrollToSection(index);
      },
    );
  }

  void _initListenerForInteractWithHeaderIndex() {
    double introHeight = introKey.currentContext!.size!.height;
    double aboutHeight = aboutKey.currentContext!.size!.height;
    double projectHeight = projectKey.currentContext!.size!.height;
    // double contactHeight = contactKey.currentContext!.size!.height;
    _controller.addListener(() {
      double controllerHeight = _controller.offset;
      if (_controller.position.extentAfter == 0.0) {
        _portfolioController.updateSectionFromScroll(3);
      } else if (controllerHeight < introHeight) {
        _portfolioController.updateSectionFromScroll(0);
      } else if (controllerHeight < (introHeight + aboutHeight)) {
        _portfolioController.updateSectionFromScroll(1);
      } else if (controllerHeight <
          (introHeight + aboutHeight + projectHeight)) {
        _portfolioController.updateSectionFromScroll(2);
      } else {
        _portfolioController.updateSectionFromScroll(3);
      }
    });
  }

  void _scrollToSection(int index) {
    final keys = [introKey, aboutKey, projectKey, contactKey];
    if (index < 0 || index >= keys.length) return;
    final targetContext = keys[index].currentContext;
    if (targetContext == null) return;
    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
    _portfolioController.acknowledgeNavigationRequest();
  }

  @override
  void dispose() {
    _navigationWorker?.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double topPadding = AppConstants.appBarHeight + 40;

    return Stack(
      children: [
        const _BackgroundGlows(),
        Padding(
          padding: EdgeInsets.only(top: topPadding),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.horizontalPadding(width),
            ),
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: [
                  AnimatedSection(
                    key: introKey,
                    delay: const Duration(milliseconds: 100),
                    child: const IntroSection(),
                  ),
                  AnimatedSection(
                    key: aboutKey,
                    delay: const Duration(milliseconds: 200),
                    child: const AboutMeSection(),
                  ),
                  AnimatedSection(
                    key: projectKey,
                    delay: const Duration(milliseconds: 300),
                    child: const ProjectsSection(),
                  ),
                  AnimatedSection(
                    key: contactKey,
                    delay: const Duration(milliseconds: 400),
                    child: const ContactSection(),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(child: TopNavBar()),
        ),
        const VerticalHeadersBuilder(),
      ],
    );
  }
}

class _BackgroundGlows extends StatelessWidget {
  const _BackgroundGlows();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Stack(
        children: [
          _FloatingBlob(
            top: -80,
            left: -60,
            size: 240,
            color: AppColors.primaryColor,
          ),
          _FloatingBlob(
            bottom: 120,
            right: -40,
            size: 220,
            color: AppColors.secondaryColor,
          ),
        ],
      ),
    );
  }
}

class _FloatingBlob extends StatefulWidget {
  const _FloatingBlob({
    this.top,
    this.left,
    this.bottom,
    this.right,
    required this.size,
    required this.color,
  });

  final double? top;
  final double? left;
  final double? bottom;
  final double? right;
  final double size;
  final Color color;

  @override
  State<_FloatingBlob> createState() => _FloatingBlobState();
}

class _FloatingBlobState extends State<_FloatingBlob>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      left: widget.left,
      bottom: widget.bottom,
      right: widget.right,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final offset = (widget.size * .04) * (_controller.value - .5);
          return Transform.translate(
            offset: Offset(offset, -offset),
            child: child,
          );
        },
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                widget.color.withOpacity(.35),
                widget.color.withOpacity(0),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: widget.color.withOpacity(.25),
                blurRadius: widget.size / 2,
                spreadRadius: widget.size / 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
