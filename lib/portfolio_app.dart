import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/theme_manager.dart';
import 'core/localization/portfolio_translations.dart';
import 'presentation/controllers/portfolio_controller.dart';
import 'presentation/views/home_view.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PortfolioController.to;
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: PortfolioTranslations(),
        locale: controller.locale.value,
        fallbackLocale: controller.supportedLocales.first,
        theme: CustomTheme.darkTheme(),
        title: 'Mohamed Mostafa',
        home: const HomeView(),
      ),
    );
  }
}
