import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'app_enums.dart';
import 'app_strings.dart';

extension AppBarHeaderExtension on AppBarHeaders {
  String get label {
    switch (this) {
      case AppBarHeaders.home:
        return AppStrings.headerHome.tr;
      case AppBarHeaders.aboutMe:
        return AppStrings.headerAbout.tr;
      case AppBarHeaders.projects:
        return AppStrings.headerProjects.tr;
      case AppBarHeaders.contact:
        return AppStrings.headerContact.tr;
    }
  }
}

extension MediaQueryExtension on BuildContext {
  Size get _size => MediaQuery.of(this).size;
  double get width => _size.width;
  double get height => _size.height;
}

extension DeviceTypeExtension on DeviceType {
  int getMinWidth() {
    switch (this) {
      case DeviceType.mobile:
        return 320;
      case DeviceType.ipad:
        return 481;
      case DeviceType.smallScreenLaptop:
        return 769;
      case DeviceType.largeScreenDesktop:
        return 1025;
      case DeviceType.extraLargeTV:
        return 1201;
    }
  }

  int getMaxWidth() {
    switch (this) {
      case DeviceType.mobile:
        return 480;
      case DeviceType.ipad:
        return 768;
      case DeviceType.smallScreenLaptop:
        return 1024;
      case DeviceType.largeScreenDesktop:
        return 1200;
      case DeviceType.extraLargeTV:
        return 3840; // any number more than 1200
    }
  }
}
