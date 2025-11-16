import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/app_enums.dart';

class PortfolioController extends GetxController {
  static PortfolioController get to => Get.find<PortfolioController>();

  final RxInt headerIndex = 0.obs;
  final RxnInt navigationRequest = RxnInt();
  final Rx<AppBarHeadersAxis> headersAxis = AppBarHeadersAxis.horizontal.obs;
  final Rx<Locale> locale = const Locale('en', 'US').obs;

  final List<Locale> supportedLocales = const [
    Locale('en', 'US'),
    Locale('ar', 'EG'),
  ];

  @override
  void onInit() {
    super.onInit();
    locale.value = _resolveInitialLocale();
  }

  Locale _resolveInitialLocale() {
    final deviceLocale = Get.deviceLocale;
    if (deviceLocale == null) {
      return locale.value;
    }
    for (final supported in supportedLocales) {
      if (supported.languageCode == deviceLocale.languageCode) {
        return supported;
      }
    }
    return locale.value;
  }

  void changeHeaderIndex(int index) {
    if (headerIndex.value == index) return;
    headerIndex.value = index;
  }

  void requestSectionNavigation(int index) {
    navigationRequest.value = index;
    changeHeaderIndex(index);
    setHeadersAxis(AppBarHeadersAxis.horizontal);
  }

  void acknowledgeNavigationRequest() {
    navigationRequest.value = null;
  }

  void updateSectionFromScroll(int index) {
    if (navigationRequest.value != null) return;
    changeHeaderIndex(index);
  }

  void setHeadersAxis(AppBarHeadersAxis axis) {
    headersAxis.value = axis;
  }

  void toggleMenuAxis() {
    headersAxis.value = headersAxis.value == AppBarHeadersAxis.horizontal
        ? AppBarHeadersAxis.vertical
        : AppBarHeadersAxis.horizontal;
  }

  void changeLocale(Locale locale) {
    if (this.locale.value == locale) return;
    this.locale.value = locale;
    Get.updateLocale(locale);
  }
}
